part of resource_helpers;

@freezed
class FilePath with _$FilePath  {

  const factory FilePath.documents(String src) = FilePathDocuments;
  const factory FilePath.temporary(String src) = FilePathTemporary;
  const factory FilePath.absolute(String src) = FilePathAbsolute;

  factory FilePath.fromJson(Map<String, dynamic> json) => _$FilePathFromJson(json);

}
