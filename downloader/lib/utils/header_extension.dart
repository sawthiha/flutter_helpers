part of downloader;

extension HeadersResumableExtension on Headers  {

  bool get isResumable => value('accept-ranges') == 'bytes';
  int? get contentLength => int.parse(value('content-length') ?? '0');

  String? get validator => value('etag') ?? value('last-modified');
  bool isTheSameSourceAs(Headers other) => validator == other.validator;

}