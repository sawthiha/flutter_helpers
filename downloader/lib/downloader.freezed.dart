// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloader.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DownloadTask _$DownloadTaskFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return DownloadTaskDefault.fromJson(json);
    case 'withExtraction':
      return DownloadTaskWithExtraction.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DownloadTask',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DownloadTask {
  String? get tag => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  FilePath get savePath => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? tag, String url, FilePath savePath) $default, {
    required TResult Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)
        withExtraction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? tag, String url, FilePath savePath)? $default, {
    TResult? Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)?
        withExtraction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? tag, String url, FilePath savePath)? $default, {
    TResult Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)?
        withExtraction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DownloadTaskDefault value) $default, {
    required TResult Function(DownloadTaskWithExtraction value) withExtraction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(DownloadTaskDefault value)? $default, {
    TResult? Function(DownloadTaskWithExtraction value)? withExtraction,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DownloadTaskDefault value)? $default, {
    TResult Function(DownloadTaskWithExtraction value)? withExtraction,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DownloadTaskCopyWith<DownloadTask> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadTaskCopyWith<$Res> {
  factory $DownloadTaskCopyWith(
          DownloadTask value, $Res Function(DownloadTask) then) =
      _$DownloadTaskCopyWithImpl<$Res, DownloadTask>;
  @useResult
  $Res call({String? tag, String url, FilePath savePath});

  $FilePathCopyWith<$Res> get savePath;
}

/// @nodoc
class _$DownloadTaskCopyWithImpl<$Res, $Val extends DownloadTask>
    implements $DownloadTaskCopyWith<$Res> {
  _$DownloadTaskCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? url = null,
    Object? savePath = null,
  }) {
    return _then(_value.copyWith(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      savePath: null == savePath
          ? _value.savePath
          : savePath // ignore: cast_nullable_to_non_nullable
              as FilePath,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FilePathCopyWith<$Res> get savePath {
    return $FilePathCopyWith<$Res>(_value.savePath, (value) {
      return _then(_value.copyWith(savePath: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DownloadTaskDefaultCopyWith<$Res>
    implements $DownloadTaskCopyWith<$Res> {
  factory _$$DownloadTaskDefaultCopyWith(_$DownloadTaskDefault value,
          $Res Function(_$DownloadTaskDefault) then) =
      __$$DownloadTaskDefaultCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? tag, String url, FilePath savePath});

  @override
  $FilePathCopyWith<$Res> get savePath;
}

/// @nodoc
class __$$DownloadTaskDefaultCopyWithImpl<$Res>
    extends _$DownloadTaskCopyWithImpl<$Res, _$DownloadTaskDefault>
    implements _$$DownloadTaskDefaultCopyWith<$Res> {
  __$$DownloadTaskDefaultCopyWithImpl(
      _$DownloadTaskDefault _value, $Res Function(_$DownloadTaskDefault) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? url = null,
    Object? savePath = null,
  }) {
    return _then(_$DownloadTaskDefault(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      savePath: null == savePath
          ? _value.savePath
          : savePath // ignore: cast_nullable_to_non_nullable
              as FilePath,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskDefault implements DownloadTaskDefault {
  const _$DownloadTaskDefault(
      {this.tag,
      required this.url,
      required this.savePath,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$DownloadTaskDefault.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskDefaultFromJson(json);

  @override
  final String? tag;
  @override
  final String url;
  @override
  final FilePath savePath;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTask(tag: $tag, url: $url, savePath: $savePath)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskDefault &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.savePath, savePath) ||
                other.savePath == savePath));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, tag, url, savePath);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadTaskDefaultCopyWith<_$DownloadTaskDefault> get copyWith =>
      __$$DownloadTaskDefaultCopyWithImpl<_$DownloadTaskDefault>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? tag, String url, FilePath savePath) $default, {
    required TResult Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)
        withExtraction,
  }) {
    return $default(tag, url, savePath);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? tag, String url, FilePath savePath)? $default, {
    TResult? Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)?
        withExtraction,
  }) {
    return $default?.call(tag, url, savePath);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? tag, String url, FilePath savePath)? $default, {
    TResult Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)?
        withExtraction,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(tag, url, savePath);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DownloadTaskDefault value) $default, {
    required TResult Function(DownloadTaskWithExtraction value) withExtraction,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(DownloadTaskDefault value)? $default, {
    TResult? Function(DownloadTaskWithExtraction value)? withExtraction,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DownloadTaskDefault value)? $default, {
    TResult Function(DownloadTaskWithExtraction value)? withExtraction,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskDefaultToJson(
      this,
    );
  }
}

abstract class DownloadTaskDefault implements DownloadTask {
  const factory DownloadTaskDefault(
      {final String? tag,
      required final String url,
      required final FilePath savePath}) = _$DownloadTaskDefault;

  factory DownloadTaskDefault.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskDefault.fromJson;

  @override
  String? get tag;
  @override
  String get url;
  @override
  FilePath get savePath;
  @override
  @JsonKey(ignore: true)
  _$$DownloadTaskDefaultCopyWith<_$DownloadTaskDefault> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadTaskWithExtractionCopyWith<$Res>
    implements $DownloadTaskCopyWith<$Res> {
  factory _$$DownloadTaskWithExtractionCopyWith(
          _$DownloadTaskWithExtraction value,
          $Res Function(_$DownloadTaskWithExtraction) then) =
      __$$DownloadTaskWithExtractionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? tag,
      String url,
      FilePath savePath,
      FilePath extractPath,
      bool deleteArchiveOnComplete});

  @override
  $FilePathCopyWith<$Res> get savePath;
  $FilePathCopyWith<$Res> get extractPath;
}

/// @nodoc
class __$$DownloadTaskWithExtractionCopyWithImpl<$Res>
    extends _$DownloadTaskCopyWithImpl<$Res, _$DownloadTaskWithExtraction>
    implements _$$DownloadTaskWithExtractionCopyWith<$Res> {
  __$$DownloadTaskWithExtractionCopyWithImpl(
      _$DownloadTaskWithExtraction _value,
      $Res Function(_$DownloadTaskWithExtraction) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? tag = freezed,
    Object? url = null,
    Object? savePath = null,
    Object? extractPath = null,
    Object? deleteArchiveOnComplete = null,
  }) {
    return _then(_$DownloadTaskWithExtraction(
      tag: freezed == tag
          ? _value.tag
          : tag // ignore: cast_nullable_to_non_nullable
              as String?,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      savePath: null == savePath
          ? _value.savePath
          : savePath // ignore: cast_nullable_to_non_nullable
              as FilePath,
      extractPath: null == extractPath
          ? _value.extractPath
          : extractPath // ignore: cast_nullable_to_non_nullable
              as FilePath,
      deleteArchiveOnComplete: null == deleteArchiveOnComplete
          ? _value.deleteArchiveOnComplete
          : deleteArchiveOnComplete // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FilePathCopyWith<$Res> get extractPath {
    return $FilePathCopyWith<$Res>(_value.extractPath, (value) {
      return _then(_value.copyWith(extractPath: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskWithExtraction implements DownloadTaskWithExtraction {
  const _$DownloadTaskWithExtraction(
      {this.tag,
      required this.url,
      required this.savePath,
      required this.extractPath,
      this.deleteArchiveOnComplete = false,
      final String? $type})
      : $type = $type ?? 'withExtraction';

  factory _$DownloadTaskWithExtraction.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskWithExtractionFromJson(json);

  @override
  final String? tag;
  @override
  final String url;
  @override
  final FilePath savePath;
  @override
  final FilePath extractPath;
  @override
  @JsonKey()
  final bool deleteArchiveOnComplete;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTask.withExtraction(tag: $tag, url: $url, savePath: $savePath, extractPath: $extractPath, deleteArchiveOnComplete: $deleteArchiveOnComplete)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskWithExtraction &&
            (identical(other.tag, tag) || other.tag == tag) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.savePath, savePath) ||
                other.savePath == savePath) &&
            (identical(other.extractPath, extractPath) ||
                other.extractPath == extractPath) &&
            (identical(
                    other.deleteArchiveOnComplete, deleteArchiveOnComplete) ||
                other.deleteArchiveOnComplete == deleteArchiveOnComplete));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, tag, url, savePath, extractPath, deleteArchiveOnComplete);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadTaskWithExtractionCopyWith<_$DownloadTaskWithExtraction>
      get copyWith => __$$DownloadTaskWithExtractionCopyWithImpl<
          _$DownloadTaskWithExtraction>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(String? tag, String url, FilePath savePath) $default, {
    required TResult Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)
        withExtraction,
  }) {
    return withExtraction(
        tag, url, savePath, extractPath, deleteArchiveOnComplete);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(String? tag, String url, FilePath savePath)? $default, {
    TResult? Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)?
        withExtraction,
  }) {
    return withExtraction?.call(
        tag, url, savePath, extractPath, deleteArchiveOnComplete);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(String? tag, String url, FilePath savePath)? $default, {
    TResult Function(String? tag, String url, FilePath savePath,
            FilePath extractPath, bool deleteArchiveOnComplete)?
        withExtraction,
    required TResult orElse(),
  }) {
    if (withExtraction != null) {
      return withExtraction(
          tag, url, savePath, extractPath, deleteArchiveOnComplete);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(DownloadTaskDefault value) $default, {
    required TResult Function(DownloadTaskWithExtraction value) withExtraction,
  }) {
    return withExtraction(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(DownloadTaskDefault value)? $default, {
    TResult? Function(DownloadTaskWithExtraction value)? withExtraction,
  }) {
    return withExtraction?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(DownloadTaskDefault value)? $default, {
    TResult Function(DownloadTaskWithExtraction value)? withExtraction,
    required TResult orElse(),
  }) {
    if (withExtraction != null) {
      return withExtraction(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskWithExtractionToJson(
      this,
    );
  }
}

abstract class DownloadTaskWithExtraction implements DownloadTask {
  const factory DownloadTaskWithExtraction(
      {final String? tag,
      required final String url,
      required final FilePath savePath,
      required final FilePath extractPath,
      final bool deleteArchiveOnComplete}) = _$DownloadTaskWithExtraction;

  factory DownloadTaskWithExtraction.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskWithExtraction.fromJson;

  @override
  String? get tag;
  @override
  String get url;
  @override
  FilePath get savePath;
  FilePath get extractPath;
  bool get deleteArchiveOnComplete;
  @override
  @JsonKey(ignore: true)
  _$$DownloadTaskWithExtractionCopyWith<_$DownloadTaskWithExtraction>
      get copyWith => throw _privateConstructorUsedError;
}

DownloadTaskState _$DownloadTaskStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'idle':
      return DownloadTaskStateIdle.fromJson(json);
    case 'downloading':
      return DownloadTaskStateDownloading.fromJson(json);
    case 'extracting':
      return DownloadTaskStateExtracting.fromJson(json);
    case 'completed':
      return DownloadTaskStateCompleted.fromJson(json);
    case 'error':
      return DownloadTaskStateError.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'DownloadTaskState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$DownloadTaskState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            double progress, Map<String, List<String>> headers)
        downloading,
    required TResult Function(double progress) extracting,
    required TResult Function() completed,
    required TResult Function(DownloadTaskState prevState, String? description)
        error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult? Function(double progress)? extracting,
    TResult? Function()? completed,
    TResult? Function(DownloadTaskState prevState, String? description)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult Function(double progress)? extracting,
    TResult Function()? completed,
    TResult Function(DownloadTaskState prevState, String? description)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadTaskStateIdle value) idle,
    required TResult Function(DownloadTaskStateDownloading value) downloading,
    required TResult Function(DownloadTaskStateExtracting value) extracting,
    required TResult Function(DownloadTaskStateCompleted value) completed,
    required TResult Function(DownloadTaskStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadTaskStateIdle value)? idle,
    TResult? Function(DownloadTaskStateDownloading value)? downloading,
    TResult? Function(DownloadTaskStateExtracting value)? extracting,
    TResult? Function(DownloadTaskStateCompleted value)? completed,
    TResult? Function(DownloadTaskStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadTaskStateIdle value)? idle,
    TResult Function(DownloadTaskStateDownloading value)? downloading,
    TResult Function(DownloadTaskStateExtracting value)? extracting,
    TResult Function(DownloadTaskStateCompleted value)? completed,
    TResult Function(DownloadTaskStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadTaskStateCopyWith<$Res> {
  factory $DownloadTaskStateCopyWith(
          DownloadTaskState value, $Res Function(DownloadTaskState) then) =
      _$DownloadTaskStateCopyWithImpl<$Res, DownloadTaskState>;
}

/// @nodoc
class _$DownloadTaskStateCopyWithImpl<$Res, $Val extends DownloadTaskState>
    implements $DownloadTaskStateCopyWith<$Res> {
  _$DownloadTaskStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$DownloadTaskStateIdleCopyWith<$Res> {
  factory _$$DownloadTaskStateIdleCopyWith(_$DownloadTaskStateIdle value,
          $Res Function(_$DownloadTaskStateIdle) then) =
      __$$DownloadTaskStateIdleCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadTaskStateIdleCopyWithImpl<$Res>
    extends _$DownloadTaskStateCopyWithImpl<$Res, _$DownloadTaskStateIdle>
    implements _$$DownloadTaskStateIdleCopyWith<$Res> {
  __$$DownloadTaskStateIdleCopyWithImpl(_$DownloadTaskStateIdle _value,
      $Res Function(_$DownloadTaskStateIdle) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskStateIdle implements DownloadTaskStateIdle {
  const _$DownloadTaskStateIdle({final String? $type})
      : $type = $type ?? 'idle';

  factory _$DownloadTaskStateIdle.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskStateIdleFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTaskState.idle()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DownloadTaskStateIdle);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            double progress, Map<String, List<String>> headers)
        downloading,
    required TResult Function(double progress) extracting,
    required TResult Function() completed,
    required TResult Function(DownloadTaskState prevState, String? description)
        error,
  }) {
    return idle();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult? Function(double progress)? extracting,
    TResult? Function()? completed,
    TResult? Function(DownloadTaskState prevState, String? description)? error,
  }) {
    return idle?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult Function(double progress)? extracting,
    TResult Function()? completed,
    TResult Function(DownloadTaskState prevState, String? description)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadTaskStateIdle value) idle,
    required TResult Function(DownloadTaskStateDownloading value) downloading,
    required TResult Function(DownloadTaskStateExtracting value) extracting,
    required TResult Function(DownloadTaskStateCompleted value) completed,
    required TResult Function(DownloadTaskStateError value) error,
  }) {
    return idle(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadTaskStateIdle value)? idle,
    TResult? Function(DownloadTaskStateDownloading value)? downloading,
    TResult? Function(DownloadTaskStateExtracting value)? extracting,
    TResult? Function(DownloadTaskStateCompleted value)? completed,
    TResult? Function(DownloadTaskStateError value)? error,
  }) {
    return idle?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadTaskStateIdle value)? idle,
    TResult Function(DownloadTaskStateDownloading value)? downloading,
    TResult Function(DownloadTaskStateExtracting value)? extracting,
    TResult Function(DownloadTaskStateCompleted value)? completed,
    TResult Function(DownloadTaskStateError value)? error,
    required TResult orElse(),
  }) {
    if (idle != null) {
      return idle(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskStateIdleToJson(
      this,
    );
  }
}

abstract class DownloadTaskStateIdle implements DownloadTaskState {
  const factory DownloadTaskStateIdle() = _$DownloadTaskStateIdle;

  factory DownloadTaskStateIdle.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskStateIdle.fromJson;
}

/// @nodoc
abstract class _$$DownloadTaskStateDownloadingCopyWith<$Res> {
  factory _$$DownloadTaskStateDownloadingCopyWith(
          _$DownloadTaskStateDownloading value,
          $Res Function(_$DownloadTaskStateDownloading) then) =
      __$$DownloadTaskStateDownloadingCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress, Map<String, List<String>> headers});
}

/// @nodoc
class __$$DownloadTaskStateDownloadingCopyWithImpl<$Res>
    extends _$DownloadTaskStateCopyWithImpl<$Res,
        _$DownloadTaskStateDownloading>
    implements _$$DownloadTaskStateDownloadingCopyWith<$Res> {
  __$$DownloadTaskStateDownloadingCopyWithImpl(
      _$DownloadTaskStateDownloading _value,
      $Res Function(_$DownloadTaskStateDownloading) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
    Object? headers = null,
  }) {
    return _then(_$DownloadTaskStateDownloading(
      progress: null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
      headers: null == headers
          ? _value._headers
          : headers // ignore: cast_nullable_to_non_nullable
              as Map<String, List<String>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskStateDownloading implements DownloadTaskStateDownloading {
  const _$DownloadTaskStateDownloading(
      {required this.progress,
      required final Map<String, List<String>> headers,
      final String? $type})
      : _headers = headers,
        $type = $type ?? 'downloading';

  factory _$DownloadTaskStateDownloading.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskStateDownloadingFromJson(json);

  @override
  final double progress;
  final Map<String, List<String>> _headers;
  @override
  Map<String, List<String>> get headers {
    if (_headers is EqualUnmodifiableMapView) return _headers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_headers);
  }

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTaskState.downloading(progress: $progress, headers: $headers)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskStateDownloading &&
            (identical(other.progress, progress) ||
                other.progress == progress) &&
            const DeepCollectionEquality().equals(other._headers, _headers));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, progress, const DeepCollectionEquality().hash(_headers));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadTaskStateDownloadingCopyWith<_$DownloadTaskStateDownloading>
      get copyWith => __$$DownloadTaskStateDownloadingCopyWithImpl<
          _$DownloadTaskStateDownloading>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            double progress, Map<String, List<String>> headers)
        downloading,
    required TResult Function(double progress) extracting,
    required TResult Function() completed,
    required TResult Function(DownloadTaskState prevState, String? description)
        error,
  }) {
    return downloading(progress, headers);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult? Function(double progress)? extracting,
    TResult? Function()? completed,
    TResult? Function(DownloadTaskState prevState, String? description)? error,
  }) {
    return downloading?.call(progress, headers);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult Function(double progress)? extracting,
    TResult Function()? completed,
    TResult Function(DownloadTaskState prevState, String? description)? error,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(progress, headers);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadTaskStateIdle value) idle,
    required TResult Function(DownloadTaskStateDownloading value) downloading,
    required TResult Function(DownloadTaskStateExtracting value) extracting,
    required TResult Function(DownloadTaskStateCompleted value) completed,
    required TResult Function(DownloadTaskStateError value) error,
  }) {
    return downloading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadTaskStateIdle value)? idle,
    TResult? Function(DownloadTaskStateDownloading value)? downloading,
    TResult? Function(DownloadTaskStateExtracting value)? extracting,
    TResult? Function(DownloadTaskStateCompleted value)? completed,
    TResult? Function(DownloadTaskStateError value)? error,
  }) {
    return downloading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadTaskStateIdle value)? idle,
    TResult Function(DownloadTaskStateDownloading value)? downloading,
    TResult Function(DownloadTaskStateExtracting value)? extracting,
    TResult Function(DownloadTaskStateCompleted value)? completed,
    TResult Function(DownloadTaskStateError value)? error,
    required TResult orElse(),
  }) {
    if (downloading != null) {
      return downloading(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskStateDownloadingToJson(
      this,
    );
  }
}

abstract class DownloadTaskStateDownloading implements DownloadTaskState {
  const factory DownloadTaskStateDownloading(
          {required final double progress,
          required final Map<String, List<String>> headers}) =
      _$DownloadTaskStateDownloading;

  factory DownloadTaskStateDownloading.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskStateDownloading.fromJson;

  double get progress;
  Map<String, List<String>> get headers;
  @JsonKey(ignore: true)
  _$$DownloadTaskStateDownloadingCopyWith<_$DownloadTaskStateDownloading>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadTaskStateExtractingCopyWith<$Res> {
  factory _$$DownloadTaskStateExtractingCopyWith(
          _$DownloadTaskStateExtracting value,
          $Res Function(_$DownloadTaskStateExtracting) then) =
      __$$DownloadTaskStateExtractingCopyWithImpl<$Res>;
  @useResult
  $Res call({double progress});
}

/// @nodoc
class __$$DownloadTaskStateExtractingCopyWithImpl<$Res>
    extends _$DownloadTaskStateCopyWithImpl<$Res, _$DownloadTaskStateExtracting>
    implements _$$DownloadTaskStateExtractingCopyWith<$Res> {
  __$$DownloadTaskStateExtractingCopyWithImpl(
      _$DownloadTaskStateExtracting _value,
      $Res Function(_$DownloadTaskStateExtracting) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? progress = null,
  }) {
    return _then(_$DownloadTaskStateExtracting(
      null == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskStateExtracting implements DownloadTaskStateExtracting {
  const _$DownloadTaskStateExtracting(this.progress, {final String? $type})
      : $type = $type ?? 'extracting';

  factory _$DownloadTaskStateExtracting.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskStateExtractingFromJson(json);

  @override
  final double progress;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTaskState.extracting(progress: $progress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskStateExtracting &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, progress);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadTaskStateExtractingCopyWith<_$DownloadTaskStateExtracting>
      get copyWith => __$$DownloadTaskStateExtractingCopyWithImpl<
          _$DownloadTaskStateExtracting>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            double progress, Map<String, List<String>> headers)
        downloading,
    required TResult Function(double progress) extracting,
    required TResult Function() completed,
    required TResult Function(DownloadTaskState prevState, String? description)
        error,
  }) {
    return extracting(progress);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult? Function(double progress)? extracting,
    TResult? Function()? completed,
    TResult? Function(DownloadTaskState prevState, String? description)? error,
  }) {
    return extracting?.call(progress);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult Function(double progress)? extracting,
    TResult Function()? completed,
    TResult Function(DownloadTaskState prevState, String? description)? error,
    required TResult orElse(),
  }) {
    if (extracting != null) {
      return extracting(progress);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadTaskStateIdle value) idle,
    required TResult Function(DownloadTaskStateDownloading value) downloading,
    required TResult Function(DownloadTaskStateExtracting value) extracting,
    required TResult Function(DownloadTaskStateCompleted value) completed,
    required TResult Function(DownloadTaskStateError value) error,
  }) {
    return extracting(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadTaskStateIdle value)? idle,
    TResult? Function(DownloadTaskStateDownloading value)? downloading,
    TResult? Function(DownloadTaskStateExtracting value)? extracting,
    TResult? Function(DownloadTaskStateCompleted value)? completed,
    TResult? Function(DownloadTaskStateError value)? error,
  }) {
    return extracting?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadTaskStateIdle value)? idle,
    TResult Function(DownloadTaskStateDownloading value)? downloading,
    TResult Function(DownloadTaskStateExtracting value)? extracting,
    TResult Function(DownloadTaskStateCompleted value)? completed,
    TResult Function(DownloadTaskStateError value)? error,
    required TResult orElse(),
  }) {
    if (extracting != null) {
      return extracting(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskStateExtractingToJson(
      this,
    );
  }
}

abstract class DownloadTaskStateExtracting implements DownloadTaskState {
  const factory DownloadTaskStateExtracting(final double progress) =
      _$DownloadTaskStateExtracting;

  factory DownloadTaskStateExtracting.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskStateExtracting.fromJson;

  double get progress;
  @JsonKey(ignore: true)
  _$$DownloadTaskStateExtractingCopyWith<_$DownloadTaskStateExtracting>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DownloadTaskStateCompletedCopyWith<$Res> {
  factory _$$DownloadTaskStateCompletedCopyWith(
          _$DownloadTaskStateCompleted value,
          $Res Function(_$DownloadTaskStateCompleted) then) =
      __$$DownloadTaskStateCompletedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DownloadTaskStateCompletedCopyWithImpl<$Res>
    extends _$DownloadTaskStateCopyWithImpl<$Res, _$DownloadTaskStateCompleted>
    implements _$$DownloadTaskStateCompletedCopyWith<$Res> {
  __$$DownloadTaskStateCompletedCopyWithImpl(
      _$DownloadTaskStateCompleted _value,
      $Res Function(_$DownloadTaskStateCompleted) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskStateCompleted implements DownloadTaskStateCompleted {
  const _$DownloadTaskStateCompleted({final String? $type})
      : $type = $type ?? 'completed';

  factory _$DownloadTaskStateCompleted.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskStateCompletedFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTaskState.completed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskStateCompleted);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            double progress, Map<String, List<String>> headers)
        downloading,
    required TResult Function(double progress) extracting,
    required TResult Function() completed,
    required TResult Function(DownloadTaskState prevState, String? description)
        error,
  }) {
    return completed();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult? Function(double progress)? extracting,
    TResult? Function()? completed,
    TResult? Function(DownloadTaskState prevState, String? description)? error,
  }) {
    return completed?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult Function(double progress)? extracting,
    TResult Function()? completed,
    TResult Function(DownloadTaskState prevState, String? description)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadTaskStateIdle value) idle,
    required TResult Function(DownloadTaskStateDownloading value) downloading,
    required TResult Function(DownloadTaskStateExtracting value) extracting,
    required TResult Function(DownloadTaskStateCompleted value) completed,
    required TResult Function(DownloadTaskStateError value) error,
  }) {
    return completed(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadTaskStateIdle value)? idle,
    TResult? Function(DownloadTaskStateDownloading value)? downloading,
    TResult? Function(DownloadTaskStateExtracting value)? extracting,
    TResult? Function(DownloadTaskStateCompleted value)? completed,
    TResult? Function(DownloadTaskStateError value)? error,
  }) {
    return completed?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadTaskStateIdle value)? idle,
    TResult Function(DownloadTaskStateDownloading value)? downloading,
    TResult Function(DownloadTaskStateExtracting value)? extracting,
    TResult Function(DownloadTaskStateCompleted value)? completed,
    TResult Function(DownloadTaskStateError value)? error,
    required TResult orElse(),
  }) {
    if (completed != null) {
      return completed(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskStateCompletedToJson(
      this,
    );
  }
}

abstract class DownloadTaskStateCompleted implements DownloadTaskState {
  const factory DownloadTaskStateCompleted() = _$DownloadTaskStateCompleted;

  factory DownloadTaskStateCompleted.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskStateCompleted.fromJson;
}

/// @nodoc
abstract class _$$DownloadTaskStateErrorCopyWith<$Res> {
  factory _$$DownloadTaskStateErrorCopyWith(_$DownloadTaskStateError value,
          $Res Function(_$DownloadTaskStateError) then) =
      __$$DownloadTaskStateErrorCopyWithImpl<$Res>;
  @useResult
  $Res call({DownloadTaskState prevState, String? description});

  $DownloadTaskStateCopyWith<$Res> get prevState;
}

/// @nodoc
class __$$DownloadTaskStateErrorCopyWithImpl<$Res>
    extends _$DownloadTaskStateCopyWithImpl<$Res, _$DownloadTaskStateError>
    implements _$$DownloadTaskStateErrorCopyWith<$Res> {
  __$$DownloadTaskStateErrorCopyWithImpl(_$DownloadTaskStateError _value,
      $Res Function(_$DownloadTaskStateError) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prevState = null,
    Object? description = freezed,
  }) {
    return _then(_$DownloadTaskStateError(
      prevState: null == prevState
          ? _value.prevState
          : prevState // ignore: cast_nullable_to_non_nullable
              as DownloadTaskState,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $DownloadTaskStateCopyWith<$Res> get prevState {
    return $DownloadTaskStateCopyWith<$Res>(_value.prevState, (value) {
      return _then(_value.copyWith(prevState: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$DownloadTaskStateError implements DownloadTaskStateError {
  const _$DownloadTaskStateError(
      {required this.prevState, this.description, final String? $type})
      : $type = $type ?? 'error';

  factory _$DownloadTaskStateError.fromJson(Map<String, dynamic> json) =>
      _$$DownloadTaskStateErrorFromJson(json);

  @override
  final DownloadTaskState prevState;
  @override
  final String? description;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'DownloadTaskState.error(prevState: $prevState, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadTaskStateError &&
            (identical(other.prevState, prevState) ||
                other.prevState == prevState) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, prevState, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadTaskStateErrorCopyWith<_$DownloadTaskStateError> get copyWith =>
      __$$DownloadTaskStateErrorCopyWithImpl<_$DownloadTaskStateError>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() idle,
    required TResult Function(
            double progress, Map<String, List<String>> headers)
        downloading,
    required TResult Function(double progress) extracting,
    required TResult Function() completed,
    required TResult Function(DownloadTaskState prevState, String? description)
        error,
  }) {
    return error(prevState, description);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? idle,
    TResult? Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult? Function(double progress)? extracting,
    TResult? Function()? completed,
    TResult? Function(DownloadTaskState prevState, String? description)? error,
  }) {
    return error?.call(prevState, description);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? idle,
    TResult Function(double progress, Map<String, List<String>> headers)?
        downloading,
    TResult Function(double progress)? extracting,
    TResult Function()? completed,
    TResult Function(DownloadTaskState prevState, String? description)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(prevState, description);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(DownloadTaskStateIdle value) idle,
    required TResult Function(DownloadTaskStateDownloading value) downloading,
    required TResult Function(DownloadTaskStateExtracting value) extracting,
    required TResult Function(DownloadTaskStateCompleted value) completed,
    required TResult Function(DownloadTaskStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(DownloadTaskStateIdle value)? idle,
    TResult? Function(DownloadTaskStateDownloading value)? downloading,
    TResult? Function(DownloadTaskStateExtracting value)? extracting,
    TResult? Function(DownloadTaskStateCompleted value)? completed,
    TResult? Function(DownloadTaskStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(DownloadTaskStateIdle value)? idle,
    TResult Function(DownloadTaskStateDownloading value)? downloading,
    TResult Function(DownloadTaskStateExtracting value)? extracting,
    TResult Function(DownloadTaskStateCompleted value)? completed,
    TResult Function(DownloadTaskStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$DownloadTaskStateErrorToJson(
      this,
    );
  }
}

abstract class DownloadTaskStateError implements DownloadTaskState {
  const factory DownloadTaskStateError(
      {required final DownloadTaskState prevState,
      final String? description}) = _$DownloadTaskStateError;

  factory DownloadTaskStateError.fromJson(Map<String, dynamic> json) =
      _$DownloadTaskStateError.fromJson;

  DownloadTaskState get prevState;
  String? get description;
  @JsonKey(ignore: true)
  _$$DownloadTaskStateErrorCopyWith<_$DownloadTaskStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
