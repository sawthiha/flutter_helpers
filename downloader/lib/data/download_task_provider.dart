part of downloader;

class DownloadTaskProvider with HiveObjectProviderMixin<DownloadTaskCubit>  {

  @override
  final Box<DownloadTaskCubit>? box;

  DownloadTaskProvider(this.box);

}
