part of downloader;

class DownloadTaskCubitHiveAdapter extends TypeAdapter<DownloadTaskCubit>  {

  final converter = const DownloadTaskCubitJsonConverter();

  DownloadTaskCubitHiveAdapter({
    required this.typeId
  });

  @override
  DownloadTaskCubit read(BinaryReader reader) {
    final json = reader.readMap();
    return converter.fromJson(
      Map<String, dynamic>.from(json)
    );
  }

  @override
  final int typeId;

  @override
  void write(BinaryWriter writer, DownloadTaskCubit obj) {
    writer.writeMap(
      converter.toJson(obj),
    );
  }

}
