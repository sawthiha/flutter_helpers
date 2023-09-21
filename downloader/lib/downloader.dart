library downloader;

import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter_archive/flutter_archive.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_helpers/hive_helpers.dart';
import 'package:resource_helpers/resource_helpers.dart';
import 'package:uuid/uuid.dart';
import 'package:path/path.dart' as path;
import 'package:dio/dio.dart' as dio;

export 'package:resource_helpers/resource_helpers.dart';

part 'downloader.freezed.dart';
part 'downloader.g.dart';

part 'application/download_task_cubit.dart';

part 'data/download_task_repository.dart';
part 'data/download_task_hive.dart';
part 'data/download_task_json.dart';
part 'data/download_task_provider.dart';

part 'domain/download_task.dart';
part 'domain/download_task_state.dart';

part 'utils/header_extension.dart';
part 'utils/custom_dio_native.dart';

Future<DownloadTaskRepository> initXBoardDownloader({
  required int typeId,
  String boxName = 'xboard_downloads',
}) async {
  Hive.registerAdapter(DownloadTaskCubitHiveAdapter(typeId: typeId));
  final box = await Hive.openBox<DownloadTaskCubit>(boxName);
  return DownloadTaskRepository(
    provider: DownloadTaskProvider(
      box,
    ),
  );
}
