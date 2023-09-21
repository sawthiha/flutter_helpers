part of downloader;

class DownloadTaskCubitJsonConverter extends JsonConverter<DownloadTaskCubit, dynamic>  {

  const DownloadTaskCubitJsonConverter();

  @override
  DownloadTaskCubit fromJson(json) => DownloadTaskCubit(
    uuid: json['uuid'] as String,
    task: DownloadTask.fromJson(
      Map<String, dynamic>.from(json['task']),
    ),
    state: DownloadTaskState.fromJson(
      Map<String, dynamic>.from(json['state']),
    ),
  );

  @override
  toJson(DownloadTaskCubit object) => {
    'uuid': object.uuid,
    'state': object.state.toJson(),
    'task': object.task.toJson(),
  };

}
