// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'downloader.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DownloadTaskDefault _$$DownloadTaskDefaultFromJson(Map json) =>
    _$DownloadTaskDefault(
      tag: json['tag'] as String?,
      url: json['url'] as String,
      savePath:
          FilePath.fromJson(Map<String, dynamic>.from(json['savePath'] as Map)),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskDefaultToJson(
        _$DownloadTaskDefault instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'url': instance.url,
      'savePath': instance.savePath.toJson(),
      'runtimeType': instance.$type,
    };

_$DownloadTaskWithExtraction _$$DownloadTaskWithExtractionFromJson(Map json) =>
    _$DownloadTaskWithExtraction(
      tag: json['tag'] as String?,
      url: json['url'] as String,
      savePath:
          FilePath.fromJson(Map<String, dynamic>.from(json['savePath'] as Map)),
      extractPath: FilePath.fromJson(
          Map<String, dynamic>.from(json['extractPath'] as Map)),
      deleteArchiveOnComplete:
          json['deleteArchiveOnComplete'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskWithExtractionToJson(
        _$DownloadTaskWithExtraction instance) =>
    <String, dynamic>{
      'tag': instance.tag,
      'url': instance.url,
      'savePath': instance.savePath.toJson(),
      'extractPath': instance.extractPath.toJson(),
      'deleteArchiveOnComplete': instance.deleteArchiveOnComplete,
      'runtimeType': instance.$type,
    };

_$DownloadTaskStateIdle _$$DownloadTaskStateIdleFromJson(Map json) =>
    _$DownloadTaskStateIdle(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskStateIdleToJson(
        _$DownloadTaskStateIdle instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$DownloadTaskStateDownloading _$$DownloadTaskStateDownloadingFromJson(
        Map json) =>
    _$DownloadTaskStateDownloading(
      progress: (json['progress'] as num).toDouble(),
      headers: (json['headers'] as Map).map(
        (k, e) => MapEntry(
            k as String, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskStateDownloadingToJson(
        _$DownloadTaskStateDownloading instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'headers': instance.headers,
      'runtimeType': instance.$type,
    };

_$DownloadTaskStateExtracting _$$DownloadTaskStateExtractingFromJson(
        Map json) =>
    _$DownloadTaskStateExtracting(
      (json['progress'] as num).toDouble(),
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskStateExtractingToJson(
        _$DownloadTaskStateExtracting instance) =>
    <String, dynamic>{
      'progress': instance.progress,
      'runtimeType': instance.$type,
    };

_$DownloadTaskStateCompleted _$$DownloadTaskStateCompletedFromJson(Map json) =>
    _$DownloadTaskStateCompleted(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskStateCompletedToJson(
        _$DownloadTaskStateCompleted instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$DownloadTaskStateError _$$DownloadTaskStateErrorFromJson(Map json) =>
    _$DownloadTaskStateError(
      prevState: DownloadTaskState.fromJson(
          Map<String, dynamic>.from(json['prevState'] as Map)),
      description: json['description'] as String?,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$DownloadTaskStateErrorToJson(
        _$DownloadTaskStateError instance) =>
    <String, dynamic>{
      'prevState': instance.prevState.toJson(),
      'description': instance.description,
      'runtimeType': instance.$type,
    };
