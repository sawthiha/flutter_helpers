// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'resource_helpers.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FilePath _$FilePathFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'documents':
      return FilePathDocuments.fromJson(json);
    case 'temporary':
      return FilePathTemporary.fromJson(json);
    case 'absolute':
      return FilePathAbsolute.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'FilePath',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$FilePath {
  String get src => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) documents,
    required TResult Function(String src) temporary,
    required TResult Function(String src) absolute,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? documents,
    TResult? Function(String src)? temporary,
    TResult? Function(String src)? absolute,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? documents,
    TResult Function(String src)? temporary,
    TResult Function(String src)? absolute,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilePathDocuments value) documents,
    required TResult Function(FilePathTemporary value) temporary,
    required TResult Function(FilePathAbsolute value) absolute,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilePathDocuments value)? documents,
    TResult? Function(FilePathTemporary value)? temporary,
    TResult? Function(FilePathAbsolute value)? absolute,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilePathDocuments value)? documents,
    TResult Function(FilePathTemporary value)? temporary,
    TResult Function(FilePathAbsolute value)? absolute,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FilePathCopyWith<FilePath> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FilePathCopyWith<$Res> {
  factory $FilePathCopyWith(FilePath value, $Res Function(FilePath) then) =
      _$FilePathCopyWithImpl<$Res, FilePath>;
  @useResult
  $Res call({String src});
}

/// @nodoc
class _$FilePathCopyWithImpl<$Res, $Val extends FilePath>
    implements $FilePathCopyWith<$Res> {
  _$FilePathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_value.copyWith(
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FilePathDocumentsCopyWith<$Res>
    implements $FilePathCopyWith<$Res> {
  factory _$$FilePathDocumentsCopyWith(
          _$FilePathDocuments value, $Res Function(_$FilePathDocuments) then) =
      __$$FilePathDocumentsCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$FilePathDocumentsCopyWithImpl<$Res>
    extends _$FilePathCopyWithImpl<$Res, _$FilePathDocuments>
    implements _$$FilePathDocumentsCopyWith<$Res> {
  __$$FilePathDocumentsCopyWithImpl(
      _$FilePathDocuments _value, $Res Function(_$FilePathDocuments) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$FilePathDocuments(
      null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilePathDocuments implements FilePathDocuments {
  const _$FilePathDocuments(this.src, {final String? $type})
      : $type = $type ?? 'documents';

  factory _$FilePathDocuments.fromJson(Map<String, dynamic> json) =>
      _$$FilePathDocumentsFromJson(json);

  @override
  final String src;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FilePath.documents(src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePathDocuments &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePathDocumentsCopyWith<_$FilePathDocuments> get copyWith =>
      __$$FilePathDocumentsCopyWithImpl<_$FilePathDocuments>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) documents,
    required TResult Function(String src) temporary,
    required TResult Function(String src) absolute,
  }) {
    return documents(src);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? documents,
    TResult? Function(String src)? temporary,
    TResult? Function(String src)? absolute,
  }) {
    return documents?.call(src);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? documents,
    TResult Function(String src)? temporary,
    TResult Function(String src)? absolute,
    required TResult orElse(),
  }) {
    if (documents != null) {
      return documents(src);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilePathDocuments value) documents,
    required TResult Function(FilePathTemporary value) temporary,
    required TResult Function(FilePathAbsolute value) absolute,
  }) {
    return documents(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilePathDocuments value)? documents,
    TResult? Function(FilePathTemporary value)? temporary,
    TResult? Function(FilePathAbsolute value)? absolute,
  }) {
    return documents?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilePathDocuments value)? documents,
    TResult Function(FilePathTemporary value)? temporary,
    TResult Function(FilePathAbsolute value)? absolute,
    required TResult orElse(),
  }) {
    if (documents != null) {
      return documents(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilePathDocumentsToJson(
      this,
    );
  }
}

abstract class FilePathDocuments implements FilePath {
  const factory FilePathDocuments(final String src) = _$FilePathDocuments;

  factory FilePathDocuments.fromJson(Map<String, dynamic> json) =
      _$FilePathDocuments.fromJson;

  @override
  String get src;
  @override
  @JsonKey(ignore: true)
  _$$FilePathDocumentsCopyWith<_$FilePathDocuments> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilePathTemporaryCopyWith<$Res>
    implements $FilePathCopyWith<$Res> {
  factory _$$FilePathTemporaryCopyWith(
          _$FilePathTemporary value, $Res Function(_$FilePathTemporary) then) =
      __$$FilePathTemporaryCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$FilePathTemporaryCopyWithImpl<$Res>
    extends _$FilePathCopyWithImpl<$Res, _$FilePathTemporary>
    implements _$$FilePathTemporaryCopyWith<$Res> {
  __$$FilePathTemporaryCopyWithImpl(
      _$FilePathTemporary _value, $Res Function(_$FilePathTemporary) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$FilePathTemporary(
      null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilePathTemporary implements FilePathTemporary {
  const _$FilePathTemporary(this.src, {final String? $type})
      : $type = $type ?? 'temporary';

  factory _$FilePathTemporary.fromJson(Map<String, dynamic> json) =>
      _$$FilePathTemporaryFromJson(json);

  @override
  final String src;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FilePath.temporary(src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePathTemporary &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePathTemporaryCopyWith<_$FilePathTemporary> get copyWith =>
      __$$FilePathTemporaryCopyWithImpl<_$FilePathTemporary>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) documents,
    required TResult Function(String src) temporary,
    required TResult Function(String src) absolute,
  }) {
    return temporary(src);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? documents,
    TResult? Function(String src)? temporary,
    TResult? Function(String src)? absolute,
  }) {
    return temporary?.call(src);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? documents,
    TResult Function(String src)? temporary,
    TResult Function(String src)? absolute,
    required TResult orElse(),
  }) {
    if (temporary != null) {
      return temporary(src);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilePathDocuments value) documents,
    required TResult Function(FilePathTemporary value) temporary,
    required TResult Function(FilePathAbsolute value) absolute,
  }) {
    return temporary(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilePathDocuments value)? documents,
    TResult? Function(FilePathTemporary value)? temporary,
    TResult? Function(FilePathAbsolute value)? absolute,
  }) {
    return temporary?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilePathDocuments value)? documents,
    TResult Function(FilePathTemporary value)? temporary,
    TResult Function(FilePathAbsolute value)? absolute,
    required TResult orElse(),
  }) {
    if (temporary != null) {
      return temporary(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilePathTemporaryToJson(
      this,
    );
  }
}

abstract class FilePathTemporary implements FilePath {
  const factory FilePathTemporary(final String src) = _$FilePathTemporary;

  factory FilePathTemporary.fromJson(Map<String, dynamic> json) =
      _$FilePathTemporary.fromJson;

  @override
  String get src;
  @override
  @JsonKey(ignore: true)
  _$$FilePathTemporaryCopyWith<_$FilePathTemporary> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FilePathAbsoluteCopyWith<$Res>
    implements $FilePathCopyWith<$Res> {
  factory _$$FilePathAbsoluteCopyWith(
          _$FilePathAbsolute value, $Res Function(_$FilePathAbsolute) then) =
      __$$FilePathAbsoluteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$FilePathAbsoluteCopyWithImpl<$Res>
    extends _$FilePathCopyWithImpl<$Res, _$FilePathAbsolute>
    implements _$$FilePathAbsoluteCopyWith<$Res> {
  __$$FilePathAbsoluteCopyWithImpl(
      _$FilePathAbsolute _value, $Res Function(_$FilePathAbsolute) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$FilePathAbsolute(
      null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FilePathAbsolute implements FilePathAbsolute {
  const _$FilePathAbsolute(this.src, {final String? $type})
      : $type = $type ?? 'absolute';

  factory _$FilePathAbsolute.fromJson(Map<String, dynamic> json) =>
      _$$FilePathAbsoluteFromJson(json);

  @override
  final String src;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'FilePath.absolute(src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FilePathAbsolute &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FilePathAbsoluteCopyWith<_$FilePathAbsolute> get copyWith =>
      __$$FilePathAbsoluteCopyWithImpl<_$FilePathAbsolute>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) documents,
    required TResult Function(String src) temporary,
    required TResult Function(String src) absolute,
  }) {
    return absolute(src);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? documents,
    TResult? Function(String src)? temporary,
    TResult? Function(String src)? absolute,
  }) {
    return absolute?.call(src);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? documents,
    TResult Function(String src)? temporary,
    TResult Function(String src)? absolute,
    required TResult orElse(),
  }) {
    if (absolute != null) {
      return absolute(src);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(FilePathDocuments value) documents,
    required TResult Function(FilePathTemporary value) temporary,
    required TResult Function(FilePathAbsolute value) absolute,
  }) {
    return absolute(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(FilePathDocuments value)? documents,
    TResult? Function(FilePathTemporary value)? temporary,
    TResult? Function(FilePathAbsolute value)? absolute,
  }) {
    return absolute?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(FilePathDocuments value)? documents,
    TResult Function(FilePathTemporary value)? temporary,
    TResult Function(FilePathAbsolute value)? absolute,
    required TResult orElse(),
  }) {
    if (absolute != null) {
      return absolute(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FilePathAbsoluteToJson(
      this,
    );
  }
}

abstract class FilePathAbsolute implements FilePath {
  const factory FilePathAbsolute(final String src) = _$FilePathAbsolute;

  factory FilePathAbsolute.fromJson(Map<String, dynamic> json) =
      _$FilePathAbsolute.fromJson;

  @override
  String get src;
  @override
  @JsonKey(ignore: true)
  _$$FilePathAbsoluteCopyWith<_$FilePathAbsolute> get copyWith =>
      throw _privateConstructorUsedError;
}

ResourcePath _$ResourcePathFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'assets':
      return AssetsResource.fromJson(json);
    case 'file':
      return FileResource.fromJson(json);
    case 'network':
      return NetworkResource.fromJson(json);
    case 'nil':
      return NilResource.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ResourcePath',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ResourcePath {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) assets,
    required TResult Function(FilePath path) file,
    required TResult Function(String src) network,
    required TResult Function() nil,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? assets,
    TResult? Function(FilePath path)? file,
    TResult? Function(String src)? network,
    TResult? Function()? nil,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? assets,
    TResult Function(FilePath path)? file,
    TResult Function(String src)? network,
    TResult Function()? nil,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetsResource value) assets,
    required TResult Function(FileResource value) file,
    required TResult Function(NetworkResource value) network,
    required TResult Function(NilResource value) nil,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetsResource value)? assets,
    TResult? Function(FileResource value)? file,
    TResult? Function(NetworkResource value)? network,
    TResult? Function(NilResource value)? nil,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetsResource value)? assets,
    TResult Function(FileResource value)? file,
    TResult Function(NetworkResource value)? network,
    TResult Function(NilResource value)? nil,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResourcePathCopyWith<$Res> {
  factory $ResourcePathCopyWith(
          ResourcePath value, $Res Function(ResourcePath) then) =
      _$ResourcePathCopyWithImpl<$Res, ResourcePath>;
}

/// @nodoc
class _$ResourcePathCopyWithImpl<$Res, $Val extends ResourcePath>
    implements $ResourcePathCopyWith<$Res> {
  _$ResourcePathCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AssetsResourceCopyWith<$Res> {
  factory _$$AssetsResourceCopyWith(
          _$AssetsResource value, $Res Function(_$AssetsResource) then) =
      __$$AssetsResourceCopyWithImpl<$Res>;
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$AssetsResourceCopyWithImpl<$Res>
    extends _$ResourcePathCopyWithImpl<$Res, _$AssetsResource>
    implements _$$AssetsResourceCopyWith<$Res> {
  __$$AssetsResourceCopyWithImpl(
      _$AssetsResource _value, $Res Function(_$AssetsResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$AssetsResource(
      null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AssetsResource implements AssetsResource {
  const _$AssetsResource(this.src, {final String? $type})
      : $type = $type ?? 'assets';

  factory _$AssetsResource.fromJson(Map<String, dynamic> json) =>
      _$$AssetsResourceFromJson(json);

  @override
  final String src;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResourcePath.assets(src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssetsResource &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssetsResourceCopyWith<_$AssetsResource> get copyWith =>
      __$$AssetsResourceCopyWithImpl<_$AssetsResource>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) assets,
    required TResult Function(FilePath path) file,
    required TResult Function(String src) network,
    required TResult Function() nil,
  }) {
    return assets(src);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? assets,
    TResult? Function(FilePath path)? file,
    TResult? Function(String src)? network,
    TResult? Function()? nil,
  }) {
    return assets?.call(src);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? assets,
    TResult Function(FilePath path)? file,
    TResult Function(String src)? network,
    TResult Function()? nil,
    required TResult orElse(),
  }) {
    if (assets != null) {
      return assets(src);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetsResource value) assets,
    required TResult Function(FileResource value) file,
    required TResult Function(NetworkResource value) network,
    required TResult Function(NilResource value) nil,
  }) {
    return assets(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetsResource value)? assets,
    TResult? Function(FileResource value)? file,
    TResult? Function(NetworkResource value)? network,
    TResult? Function(NilResource value)? nil,
  }) {
    return assets?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetsResource value)? assets,
    TResult Function(FileResource value)? file,
    TResult Function(NetworkResource value)? network,
    TResult Function(NilResource value)? nil,
    required TResult orElse(),
  }) {
    if (assets != null) {
      return assets(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$AssetsResourceToJson(
      this,
    );
  }
}

abstract class AssetsResource implements ResourcePath {
  const factory AssetsResource(final String src) = _$AssetsResource;

  factory AssetsResource.fromJson(Map<String, dynamic> json) =
      _$AssetsResource.fromJson;

  String get src;
  @JsonKey(ignore: true)
  _$$AssetsResourceCopyWith<_$AssetsResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FileResourceCopyWith<$Res> {
  factory _$$FileResourceCopyWith(
          _$FileResource value, $Res Function(_$FileResource) then) =
      __$$FileResourceCopyWithImpl<$Res>;
  @useResult
  $Res call({FilePath path});

  $FilePathCopyWith<$Res> get path;
}

/// @nodoc
class __$$FileResourceCopyWithImpl<$Res>
    extends _$ResourcePathCopyWithImpl<$Res, _$FileResource>
    implements _$$FileResourceCopyWith<$Res> {
  __$$FileResourceCopyWithImpl(
      _$FileResource _value, $Res Function(_$FileResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? path = null,
  }) {
    return _then(_$FileResource(
      null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as FilePath,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $FilePathCopyWith<$Res> get path {
    return $FilePathCopyWith<$Res>(_value.path, (value) {
      return _then(_value.copyWith(path: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _$FileResource implements FileResource {
  const _$FileResource(this.path, {final String? $type})
      : $type = $type ?? 'file';

  factory _$FileResource.fromJson(Map<String, dynamic> json) =>
      _$$FileResourceFromJson(json);

  @override
  final FilePath path;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResourcePath.file(path: $path)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileResource &&
            (identical(other.path, path) || other.path == path));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, path);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileResourceCopyWith<_$FileResource> get copyWith =>
      __$$FileResourceCopyWithImpl<_$FileResource>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) assets,
    required TResult Function(FilePath path) file,
    required TResult Function(String src) network,
    required TResult Function() nil,
  }) {
    return file(path);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? assets,
    TResult? Function(FilePath path)? file,
    TResult? Function(String src)? network,
    TResult? Function()? nil,
  }) {
    return file?.call(path);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? assets,
    TResult Function(FilePath path)? file,
    TResult Function(String src)? network,
    TResult Function()? nil,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(path);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetsResource value) assets,
    required TResult Function(FileResource value) file,
    required TResult Function(NetworkResource value) network,
    required TResult Function(NilResource value) nil,
  }) {
    return file(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetsResource value)? assets,
    TResult? Function(FileResource value)? file,
    TResult? Function(NetworkResource value)? network,
    TResult? Function(NilResource value)? nil,
  }) {
    return file?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetsResource value)? assets,
    TResult Function(FileResource value)? file,
    TResult Function(NetworkResource value)? network,
    TResult Function(NilResource value)? nil,
    required TResult orElse(),
  }) {
    if (file != null) {
      return file(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$FileResourceToJson(
      this,
    );
  }
}

abstract class FileResource implements ResourcePath {
  const factory FileResource(final FilePath path) = _$FileResource;

  factory FileResource.fromJson(Map<String, dynamic> json) =
      _$FileResource.fromJson;

  FilePath get path;
  @JsonKey(ignore: true)
  _$$FileResourceCopyWith<_$FileResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkResourceCopyWith<$Res> {
  factory _$$NetworkResourceCopyWith(
          _$NetworkResource value, $Res Function(_$NetworkResource) then) =
      __$$NetworkResourceCopyWithImpl<$Res>;
  @useResult
  $Res call({String src});
}

/// @nodoc
class __$$NetworkResourceCopyWithImpl<$Res>
    extends _$ResourcePathCopyWithImpl<$Res, _$NetworkResource>
    implements _$$NetworkResourceCopyWith<$Res> {
  __$$NetworkResourceCopyWithImpl(
      _$NetworkResource _value, $Res Function(_$NetworkResource) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? src = null,
  }) {
    return _then(_$NetworkResource(
      null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NetworkResource implements NetworkResource {
  const _$NetworkResource(this.src, {final String? $type})
      : $type = $type ?? 'network';

  factory _$NetworkResource.fromJson(Map<String, dynamic> json) =>
      _$$NetworkResourceFromJson(json);

  @override
  final String src;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResourcePath.network(src: $src)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkResource &&
            (identical(other.src, src) || other.src == src));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, src);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkResourceCopyWith<_$NetworkResource> get copyWith =>
      __$$NetworkResourceCopyWithImpl<_$NetworkResource>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) assets,
    required TResult Function(FilePath path) file,
    required TResult Function(String src) network,
    required TResult Function() nil,
  }) {
    return network(src);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? assets,
    TResult? Function(FilePath path)? file,
    TResult? Function(String src)? network,
    TResult? Function()? nil,
  }) {
    return network?.call(src);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? assets,
    TResult Function(FilePath path)? file,
    TResult Function(String src)? network,
    TResult Function()? nil,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(src);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetsResource value) assets,
    required TResult Function(FileResource value) file,
    required TResult Function(NetworkResource value) network,
    required TResult Function(NilResource value) nil,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetsResource value)? assets,
    TResult? Function(FileResource value)? file,
    TResult? Function(NetworkResource value)? network,
    TResult? Function(NilResource value)? nil,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetsResource value)? assets,
    TResult Function(FileResource value)? file,
    TResult Function(NetworkResource value)? network,
    TResult Function(NilResource value)? nil,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NetworkResourceToJson(
      this,
    );
  }
}

abstract class NetworkResource implements ResourcePath {
  const factory NetworkResource(final String src) = _$NetworkResource;

  factory NetworkResource.fromJson(Map<String, dynamic> json) =
      _$NetworkResource.fromJson;

  String get src;
  @JsonKey(ignore: true)
  _$$NetworkResourceCopyWith<_$NetworkResource> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NilResourceCopyWith<$Res> {
  factory _$$NilResourceCopyWith(
          _$NilResource value, $Res Function(_$NilResource) then) =
      __$$NilResourceCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NilResourceCopyWithImpl<$Res>
    extends _$ResourcePathCopyWithImpl<$Res, _$NilResource>
    implements _$$NilResourceCopyWith<$Res> {
  __$$NilResourceCopyWithImpl(
      _$NilResource _value, $Res Function(_$NilResource) _then)
      : super(_value, _then);
}

/// @nodoc
@JsonSerializable()
class _$NilResource implements NilResource {
  const _$NilResource({final String? $type}) : $type = $type ?? 'nil';

  factory _$NilResource.fromJson(Map<String, dynamic> json) =>
      _$$NilResourceFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ResourcePath.nil()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$NilResource);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String src) assets,
    required TResult Function(FilePath path) file,
    required TResult Function(String src) network,
    required TResult Function() nil,
  }) {
    return nil();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String src)? assets,
    TResult? Function(FilePath path)? file,
    TResult? Function(String src)? network,
    TResult? Function()? nil,
  }) {
    return nil?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String src)? assets,
    TResult Function(FilePath path)? file,
    TResult Function(String src)? network,
    TResult Function()? nil,
    required TResult orElse(),
  }) {
    if (nil != null) {
      return nil();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssetsResource value) assets,
    required TResult Function(FileResource value) file,
    required TResult Function(NetworkResource value) network,
    required TResult Function(NilResource value) nil,
  }) {
    return nil(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssetsResource value)? assets,
    TResult? Function(FileResource value)? file,
    TResult? Function(NetworkResource value)? network,
    TResult? Function(NilResource value)? nil,
  }) {
    return nil?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssetsResource value)? assets,
    TResult Function(FileResource value)? file,
    TResult Function(NetworkResource value)? network,
    TResult Function(NilResource value)? nil,
    required TResult orElse(),
  }) {
    if (nil != null) {
      return nil(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$NilResourceToJson(
      this,
    );
  }
}

abstract class NilResource implements ResourcePath {
  const factory NilResource() = _$NilResource;

  factory NilResource.fromJson(Map<String, dynamic> json) =
      _$NilResource.fromJson;
}
