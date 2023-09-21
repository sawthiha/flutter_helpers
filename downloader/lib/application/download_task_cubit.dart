part of downloader;

class DownloadTaskCubit extends Cubit<DownloadTaskState> with HiveObjectMixin {

  final String uuid;  
  final DownloadTask task;

  DownloadTaskCubit({
    required this.uuid,
    required this.task,
    DownloadTaskState? state
  }) : super(state ?? const DownloadTaskState.idle());

  final _cancelTokenRx = Rx<CancelToken?>(null);
  CancelToken? get _cancelToken => _cancelTokenRx.value;
  set _cancelToken(CancelToken? token)  {
    _cancelTokenRx.value = token;
  }

  bool get isCanceled => state is! DownloadTaskStateCompleted && _cancelToken == null;

  String? get errorDescription => state.whenOrNull(
    error: (prevState, description) => description,
  );

  Future<void> safeSave() async {
    if(isInBox)  {
      await save();
    }
  }

  @override
  void emit(DownloadTaskState state)  {
    super.emit(state);
    safeSave();
  }

  Future<dio.Response?> _fetchHeadersResponse({
    dio.Options? options
  }) async  {
    dio.Response<dynamic> headersResponse;
    try {
      headersResponse = await Dio().head(task.url,
        options: options,
      );
      switch (headersResponse.statusCode) {
        case 200:
          break;
        case 206:
          break;
        default:
          emit(DownloadTaskState.error(prevState: state, description: headersResponse.statusMessage));
          return null;
      }
      return headersResponse;
    } on DioException catch (e) {
      if(e.error is SocketException)  {
        emit(
          DownloadTaskState.error(
            prevState: state,
            description: (e.error as SocketException).message,
          ),
        );
      } else {
        emit(
          DownloadTaskState.error(
            prevState: state,
            description: e.message,
          ),
        );
      }
    }
    return null;
  }

  Future<void> _extractOrComplete([double? prevProgress]) async {
    await task.when(
      (tag, url, savePath) {
        emit(const DownloadTaskState.completed());
      },
      withExtraction: (tag, url, savePath, extractPath, deleteArchiveOnComplete) async {
        final downloadedFile = File(await savePath.resolvedPath);
        final extractDir = Directory(
          await extractPath.resolvedPath,
        );
        if(await downloadedFile.exists())  {
          try {
            emit(const DownloadTaskState.extracting(0.0));
            await ZipFile.extractToDirectory(
              zipFile: downloadedFile,
              destinationDir: extractDir,
              onExtracting: prevProgress == null ? (zipEntry, progress) {
                emit(DownloadTaskState.extracting(progress));
                
                // Handle Extraction progress
                return (_cancelToken?.isCancelled ?? true) ? ZipFileOperation.cancel: ZipFileOperation.includeItem;
              }: (zipEntry, progress) {
                emit(DownloadTaskState.extracting(progress));
                final isAlreadyExisted = !zipEntry.isDirectory ? File(path.join(extractDir.absolute.path, zipEntry.name)).existsSync()
                  : false;
                // Handle Extraction progress
                return (_cancelToken?.isCancelled ?? true) ? ZipFileOperation.cancel: !isAlreadyExisted ? ZipFileOperation.includeItem: ZipFileOperation.skipItem;
              },
            );
            if(_cancelToken != null && !_cancelToken!.isCancelled)  {
              if(deleteArchiveOnComplete)  {
                await downloadedFile.delete();
              }
              emit(const DownloadTaskState.completed());
            }
          } catch (e) {
            emit(
              DownloadTaskState.error(
                prevState: state,
                description: e.toString(),
              ),
            );
          }
        }
      },
    );
  }

  Future<void> start() async {
    final savePath = await task.savePath.resolvedPath;
    await state.whenOrNull(
      idle: () async {
        final headersResponse = await _fetchHeadersResponse();
        if(headersResponse == null) { return; }

        _cancelToken = CancelToken();
        try {
          final response = await Dio().download(task.url, savePath,
            cancelToken: _cancelToken,
            deleteOnError: false,
            onReceiveProgress: (count, total) {
              final progress = count / total * 100;
              emit(
                DownloadTaskState.downloading(progress: progress, headers: headersResponse.headers.map),
              );
            },
          );
          if(response.statusCode != 200) {
            emit(DownloadTaskState.error(prevState: state, description: response.statusMessage));
          } else  {
            await _extractOrComplete();
          }
        } catch (e) {
          // On cancel, most probably
          // TODO: check if cancel is the only case
        }
      },
      downloading: (progress, oldHeadersMap) async {
        if(_cancelToken != null)  {
          return;
        }
        final oldHeaders = Headers.fromMap(
          oldHeadersMap,
        );
        final oldDownload = File(savePath);
        final alreadyDownloaded = (await oldDownload.exists()) ? await oldDownload.length(): 0;
        
        final headersResponse = await _fetchHeadersResponse(
          options: Options(
            headers: {
              'If-Range': oldHeaders.validator,
              'Range': 'bytes=$alreadyDownloaded-'
            },
          ),
        );

        if(headersResponse == null)  { return; }

        if(!oldHeaders.isResumable || !(await oldDownload.exists()) || headersResponse.statusCode == 200)  {
          // Report that the file has to be download from 
          emit(const DownloadTaskState.idle());
          await start();
          return;
        }

        _cancelToken = CancelToken();
        try {
          final response = await CustomDioForNative(
            downloadFileMode: FileMode.append,
          ).download(task.url, savePath,
            cancelToken: _cancelToken,
            deleteOnError: false,
            options: Options(
              headers: {
                'If-Range': oldHeaders.validator,
                'Range': 'bytes=$alreadyDownloaded-'
              },
            ),
            onReceiveProgress: (count, total) {
              final progress = (count + alreadyDownloaded) / (total + alreadyDownloaded) * 100;
              emit(
                DownloadTaskState.downloading(progress: progress, headers: oldHeadersMap),
              );
            },
          );
          if(response.statusCode != 206) {
            emit(DownloadTaskState.error(prevState: state, description: response.statusMessage));
          } else  {
            await _extractOrComplete();
          }
        } catch (e) {
          // On cancel, most probably
          // TODO: check if cancel is the only case
        }
      },
      extracting: (oldProgress) async {
        _cancelToken = CancelToken();
        await _extractOrComplete(oldProgress);
      },
      error: (prevState, description) async {
        emit(prevState);
        await start();
      },
    );
  }

  void stop()  {
    _cancelToken?.cancel();
    _cancelToken = null;
  }

  Future<void> dispose() async {
    stop();
    final downloaded = File(await task.savePath.resolvedPath);
    if(await downloaded.exists())  {
      await downloaded.delete();
    }
    await task.when(
      (tag, url, savePath) async  { },
      withExtraction: (tag, url, savePath, extractPath, deleteArchiveOnComplete) async {
        await Directory(await extractPath.resolvedPath).delete(
          recursive: true,
        );
      },
    );
  }

}
