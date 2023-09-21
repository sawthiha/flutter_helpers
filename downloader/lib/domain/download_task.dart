part of downloader;

@freezed
class DownloadTask with _$DownloadTask  {

  const factory DownloadTask({
    String? tag,
    required String url,
    required FilePath savePath,
  }) = DownloadTaskDefault;
  const factory DownloadTask.withExtraction({
    String? tag,
    required String url,
    required FilePath savePath,
    required FilePath extractPath,
    @Default(false) bool deleteArchiveOnComplete,
  }) = DownloadTaskWithExtraction;

  factory DownloadTask.fromJson(Map<String, dynamic> json) => _$DownloadTaskFromJson(json); 
  
}
