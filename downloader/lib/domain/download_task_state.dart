part of downloader;

@freezed
class DownloadTaskState with _$DownloadTaskState  {

  const factory DownloadTaskState.idle() = DownloadTaskStateIdle;
  const factory DownloadTaskState.downloading({required double progress, required Map<String, List<String>> headers}) = DownloadTaskStateDownloading;
  const factory DownloadTaskState.extracting(double progress) = DownloadTaskStateExtracting;
  const factory DownloadTaskState.completed() = DownloadTaskStateCompleted;
  const factory DownloadTaskState.error({
    required DownloadTaskState prevState,
    String? description,
  }) = DownloadTaskStateError;

  factory DownloadTaskState.fromJson(Map<String, dynamic> json) => _$DownloadTaskStateFromJson(json); 
  
}
