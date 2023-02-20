// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'result_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$ResultCubitState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int percentage) loadingResult,
    required TResult Function(Image image) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int percentage)? loadingResult,
    TResult? Function(Image image)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int percentage)? loadingResult,
    TResult Function(Image image)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingResult value) loadingResult,
    required TResult Function(_loaded value) loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingResult value)? loadingResult,
    TResult? Function(_loaded value)? loaded,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingResult value)? loadingResult,
    TResult Function(_loaded value)? loaded,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResultCubitStateCopyWith<$Res> {
  factory $ResultCubitStateCopyWith(
          ResultCubitState value, $Res Function(ResultCubitState) then) =
      _$ResultCubitStateCopyWithImpl<$Res, ResultCubitState>;
}

/// @nodoc
class _$ResultCubitStateCopyWithImpl<$Res, $Val extends ResultCubitState>
    implements $ResultCubitStateCopyWith<$Res> {
  _$ResultCubitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$_loadingResultCopyWith<$Res> {
  factory _$$_loadingResultCopyWith(
          _$_loadingResult value, $Res Function(_$_loadingResult) then) =
      __$$_loadingResultCopyWithImpl<$Res>;
  @useResult
  $Res call({int percentage});
}

/// @nodoc
class __$$_loadingResultCopyWithImpl<$Res>
    extends _$ResultCubitStateCopyWithImpl<$Res, _$_loadingResult>
    implements _$$_loadingResultCopyWith<$Res> {
  __$$_loadingResultCopyWithImpl(
      _$_loadingResult _value, $Res Function(_$_loadingResult) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? percentage = null,
  }) {
    return _then(_$_loadingResult(
      null == percentage
          ? _value.percentage
          : percentage // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_loadingResult implements _loadingResult {
  _$_loadingResult(this.percentage);

  @override
  final int percentage;

  @override
  String toString() {
    return 'ResultCubitState.loadingResult(percentage: $percentage)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loadingResult &&
            (identical(other.percentage, percentage) ||
                other.percentage == percentage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, percentage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadingResultCopyWith<_$_loadingResult> get copyWith =>
      __$$_loadingResultCopyWithImpl<_$_loadingResult>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int percentage) loadingResult,
    required TResult Function(Image image) loaded,
  }) {
    return loadingResult(percentage);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int percentage)? loadingResult,
    TResult? Function(Image image)? loaded,
  }) {
    return loadingResult?.call(percentage);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int percentage)? loadingResult,
    TResult Function(Image image)? loaded,
    required TResult orElse(),
  }) {
    if (loadingResult != null) {
      return loadingResult(percentage);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingResult value) loadingResult,
    required TResult Function(_loaded value) loaded,
  }) {
    return loadingResult(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingResult value)? loadingResult,
    TResult? Function(_loaded value)? loaded,
  }) {
    return loadingResult?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingResult value)? loadingResult,
    TResult Function(_loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loadingResult != null) {
      return loadingResult(this);
    }
    return orElse();
  }
}

abstract class _loadingResult implements ResultCubitState {
  factory _loadingResult(final int percentage) = _$_loadingResult;

  int get percentage;
  @JsonKey(ignore: true)
  _$$_loadingResultCopyWith<_$_loadingResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$_loadedCopyWith<$Res> {
  factory _$$_loadedCopyWith(_$_loaded value, $Res Function(_$_loaded) then) =
      __$$_loadedCopyWithImpl<$Res>;
  @useResult
  $Res call({Image image});
}

/// @nodoc
class __$$_loadedCopyWithImpl<$Res>
    extends _$ResultCubitStateCopyWithImpl<$Res, _$_loaded>
    implements _$$_loadedCopyWith<$Res> {
  __$$_loadedCopyWithImpl(_$_loaded _value, $Res Function(_$_loaded) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? image = null,
  }) {
    return _then(_$_loaded(
      null == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc

class _$_loaded implements _loaded {
  _$_loaded(this.image);

  @override
  final Image image;

  @override
  String toString() {
    return 'ResultCubitState.loaded(image: $image)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_loaded &&
            (identical(other.image, image) || other.image == image));
  }

  @override
  int get hashCode => Object.hash(runtimeType, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_loadedCopyWith<_$_loaded> get copyWith =>
      __$$_loadedCopyWithImpl<_$_loaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int percentage) loadingResult,
    required TResult Function(Image image) loaded,
  }) {
    return loaded(image);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int percentage)? loadingResult,
    TResult? Function(Image image)? loaded,
  }) {
    return loaded?.call(image);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int percentage)? loadingResult,
    TResult Function(Image image)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(image);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_loadingResult value) loadingResult,
    required TResult Function(_loaded value) loaded,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_loadingResult value)? loadingResult,
    TResult? Function(_loaded value)? loaded,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_loadingResult value)? loadingResult,
    TResult Function(_loaded value)? loaded,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class _loaded implements ResultCubitState {
  factory _loaded(final Image image) = _$_loaded;

  Image get image;
  @JsonKey(ignore: true)
  _$$_loadedCopyWith<_$_loaded> get copyWith =>
      throw _privateConstructorUsedError;
}
