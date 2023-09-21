part of downloader;

class DownloadTaskRepository  {

  final DownloadTaskProvider provider;
  DownloadTaskRepository({required this.provider})  {
    tasksRx
      ..clear()
      ..addAll(provider.all);
  }

  final RxList<DownloadTaskCubit> tasksRx = <DownloadTaskCubit>[].obs;
  List<DownloadTaskCubit> get tasks => tasksRx.toList();

  Future<void> dispose() async {
    provider.close();
  }

  Future<DownloadTaskCubit> add(DownloadTask task, [String? uuid]) async {
    final existingTask = tasks.firstWhereOrNull((element) => element.task == task);
    if(existingTask != null)  { return existingTask; }

    final taskCubit = DownloadTaskCubit(
      uuid: uuid ?? const Uuid().v1(),
      task: task,
    );
    await provider.add(taskCubit);
    tasksRx.add(
      taskCubit,
    );
    return taskCubit;
  }

  Future<void> remove(DownloadTaskCubit taskCubit) async {
    tasksRx.remove(taskCubit);
    await provider.remove(taskCubit);
    await taskCubit.dispose();
  }

}
