part of resource_helpers;

@freezed
class ResourcePath with _$ResourcePath  {

  const factory ResourcePath.assets(String src) = AssetsResource;
  const factory ResourcePath.file(FilePath path) = FileResource;
  const factory ResourcePath.network(String src) = NetworkResource;
  const factory ResourcePath.nil() = NilResource;

  factory ResourcePath.fromJson(Map<String, dynamic> json) => _$ResourcePathFromJson(json);

}
