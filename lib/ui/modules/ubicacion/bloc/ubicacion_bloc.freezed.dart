// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ubicacion_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UbicacionEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUbicaciones,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUbicaciones,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUbicaciones,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetUbicaciones value) getUbicaciones,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetUbicaciones value)? getUbicaciones,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetUbicaciones value)? getUbicaciones,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbicacionEventCopyWith<$Res> {
  factory $UbicacionEventCopyWith(
          UbicacionEvent value, $Res Function(UbicacionEvent) then) =
      _$UbicacionEventCopyWithImpl<$Res, UbicacionEvent>;
}

/// @nodoc
class _$UbicacionEventCopyWithImpl<$Res, $Val extends UbicacionEvent>
    implements $UbicacionEventCopyWith<$Res> {
  _$UbicacionEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$StartedImplCopyWith<$Res> {
  factory _$$StartedImplCopyWith(
          _$StartedImpl value, $Res Function(_$StartedImpl) then) =
      __$$StartedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$StartedImplCopyWithImpl<$Res>
    extends _$UbicacionEventCopyWithImpl<$Res, _$StartedImpl>
    implements _$$StartedImplCopyWith<$Res> {
  __$$StartedImplCopyWithImpl(
      _$StartedImpl _value, $Res Function(_$StartedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$StartedImpl implements _Started {
  const _$StartedImpl();

  @override
  String toString() {
    return 'UbicacionEvent.started()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$StartedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUbicaciones,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUbicaciones,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUbicaciones,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetUbicaciones value) getUbicaciones,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetUbicaciones value)? getUbicaciones,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetUbicaciones value)? getUbicaciones,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UbicacionEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$GetUbicacionesImplCopyWith<$Res> {
  factory _$$GetUbicacionesImplCopyWith(_$GetUbicacionesImpl value,
          $Res Function(_$GetUbicacionesImpl) then) =
      __$$GetUbicacionesImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetUbicacionesImplCopyWithImpl<$Res>
    extends _$UbicacionEventCopyWithImpl<$Res, _$GetUbicacionesImpl>
    implements _$$GetUbicacionesImplCopyWith<$Res> {
  __$$GetUbicacionesImplCopyWithImpl(
      _$GetUbicacionesImpl _value, $Res Function(_$GetUbicacionesImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetUbicacionesImpl implements GetUbicaciones {
  _$GetUbicacionesImpl();

  @override
  String toString() {
    return 'UbicacionEvent.getUbicaciones()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetUbicacionesImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function() getUbicaciones,
  }) {
    return getUbicaciones();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function()? getUbicaciones,
  }) {
    return getUbicaciones?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function()? getUbicaciones,
    required TResult orElse(),
  }) {
    if (getUbicaciones != null) {
      return getUbicaciones();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(GetUbicaciones value) getUbicaciones,
  }) {
    return getUbicaciones(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(GetUbicaciones value)? getUbicaciones,
  }) {
    return getUbicaciones?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(GetUbicaciones value)? getUbicaciones,
    required TResult orElse(),
  }) {
    if (getUbicaciones != null) {
      return getUbicaciones(this);
    }
    return orElse();
  }
}

abstract class GetUbicaciones implements UbicacionEvent {
  factory GetUbicaciones() = _$GetUbicacionesImpl;
}

/// @nodoc
mixin _$UbicacionState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UbicacionsViewModel> ubicaciones)
        ubicacionLoaded,
    required TResult Function(String error) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult? Function(String error)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UbicacionLoaded value) ubicacionLoaded,
    required TResult Function(Failure value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult? Function(Failure value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UbicacionStateCopyWith<$Res> {
  factory $UbicacionStateCopyWith(
          UbicacionState value, $Res Function(UbicacionState) then) =
      _$UbicacionStateCopyWithImpl<$Res, UbicacionState>;
}

/// @nodoc
class _$UbicacionStateCopyWithImpl<$Res, $Val extends UbicacionState>
    implements $UbicacionStateCopyWith<$Res> {
  _$UbicacionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UbicacionStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl extends Initial {
  _$InitialImpl() : super._();

  @override
  String toString() {
    return 'UbicacionState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UbicacionsViewModel> ubicaciones)
        ubicacionLoaded,
    required TResult Function(String error) failure,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult? Function(String error)? failure,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UbicacionLoaded value) ubicacionLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult? Function(Failure value)? failure,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial extends UbicacionState {
  factory Initial() = _$InitialImpl;
  Initial._() : super._();
}

/// @nodoc
abstract class _$$LoadingImplCopyWith<$Res> {
  factory _$$LoadingImplCopyWith(
          _$LoadingImpl value, $Res Function(_$LoadingImpl) then) =
      __$$LoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LoadingImplCopyWithImpl<$Res>
    extends _$UbicacionStateCopyWithImpl<$Res, _$LoadingImpl>
    implements _$$LoadingImplCopyWith<$Res> {
  __$$LoadingImplCopyWithImpl(
      _$LoadingImpl _value, $Res Function(_$LoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LoadingImpl extends Loading {
  _$LoadingImpl() : super._();

  @override
  String toString() {
    return 'UbicacionState.loading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UbicacionsViewModel> ubicaciones)
        ubicacionLoaded,
    required TResult Function(String error) failure,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult? Function(String error)? failure,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UbicacionLoaded value) ubicacionLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult? Function(Failure value)? failure,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class Loading extends UbicacionState {
  factory Loading() = _$LoadingImpl;
  Loading._() : super._();
}

/// @nodoc
abstract class _$$UbicacionLoadedImplCopyWith<$Res> {
  factory _$$UbicacionLoadedImplCopyWith(_$UbicacionLoadedImpl value,
          $Res Function(_$UbicacionLoadedImpl) then) =
      __$$UbicacionLoadedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({List<UbicacionsViewModel> ubicaciones});
}

/// @nodoc
class __$$UbicacionLoadedImplCopyWithImpl<$Res>
    extends _$UbicacionStateCopyWithImpl<$Res, _$UbicacionLoadedImpl>
    implements _$$UbicacionLoadedImplCopyWith<$Res> {
  __$$UbicacionLoadedImplCopyWithImpl(
      _$UbicacionLoadedImpl _value, $Res Function(_$UbicacionLoadedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ubicaciones = null,
  }) {
    return _then(_$UbicacionLoadedImpl(
      null == ubicaciones
          ? _value._ubicaciones
          : ubicaciones // ignore: cast_nullable_to_non_nullable
              as List<UbicacionsViewModel>,
    ));
  }
}

/// @nodoc

class _$UbicacionLoadedImpl extends UbicacionLoaded {
  _$UbicacionLoadedImpl(final List<UbicacionsViewModel> ubicaciones)
      : _ubicaciones = ubicaciones,
        super._();

  final List<UbicacionsViewModel> _ubicaciones;
  @override
  List<UbicacionsViewModel> get ubicaciones {
    if (_ubicaciones is EqualUnmodifiableListView) return _ubicaciones;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ubicaciones);
  }

  @override
  String toString() {
    return 'UbicacionState.ubicacionLoaded(ubicaciones: $ubicaciones)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UbicacionLoadedImpl &&
            const DeepCollectionEquality()
                .equals(other._ubicaciones, _ubicaciones));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(_ubicaciones));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UbicacionLoadedImplCopyWith<_$UbicacionLoadedImpl> get copyWith =>
      __$$UbicacionLoadedImplCopyWithImpl<_$UbicacionLoadedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UbicacionsViewModel> ubicaciones)
        ubicacionLoaded,
    required TResult Function(String error) failure,
  }) {
    return ubicacionLoaded(ubicaciones);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult? Function(String error)? failure,
  }) {
    return ubicacionLoaded?.call(ubicaciones);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (ubicacionLoaded != null) {
      return ubicacionLoaded(ubicaciones);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UbicacionLoaded value) ubicacionLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return ubicacionLoaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult? Function(Failure value)? failure,
  }) {
    return ubicacionLoaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (ubicacionLoaded != null) {
      return ubicacionLoaded(this);
    }
    return orElse();
  }
}

abstract class UbicacionLoaded extends UbicacionState {
  factory UbicacionLoaded(final List<UbicacionsViewModel> ubicaciones) =
      _$UbicacionLoadedImpl;
  UbicacionLoaded._() : super._();

  List<UbicacionsViewModel> get ubicaciones;
  @JsonKey(ignore: true)
  _$$UbicacionLoadedImplCopyWith<_$UbicacionLoadedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$FailureImplCopyWith<$Res> {
  factory _$$FailureImplCopyWith(
          _$FailureImpl value, $Res Function(_$FailureImpl) then) =
      __$$FailureImplCopyWithImpl<$Res>;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$$FailureImplCopyWithImpl<$Res>
    extends _$UbicacionStateCopyWithImpl<$Res, _$FailureImpl>
    implements _$$FailureImplCopyWith<$Res> {
  __$$FailureImplCopyWithImpl(
      _$FailureImpl _value, $Res Function(_$FailureImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = null,
  }) {
    return _then(_$FailureImpl(
      null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$FailureImpl extends Failure {
  _$FailureImpl(this.error) : super._();

  @override
  final String error;

  @override
  String toString() {
    return 'UbicacionState.failure(error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FailureImpl &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      __$$FailureImplCopyWithImpl<_$FailureImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(List<UbicacionsViewModel> ubicaciones)
        ubicacionLoaded,
    required TResult Function(String error) failure,
  }) {
    return failure(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult? Function(String error)? failure,
  }) {
    return failure?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(List<UbicacionsViewModel> ubicaciones)? ubicacionLoaded,
    TResult Function(String error)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Initial value) initial,
    required TResult Function(Loading value) loading,
    required TResult Function(UbicacionLoaded value) ubicacionLoaded,
    required TResult Function(Failure value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Initial value)? initial,
    TResult? Function(Loading value)? loading,
    TResult? Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult? Function(Failure value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Initial value)? initial,
    TResult Function(Loading value)? loading,
    TResult Function(UbicacionLoaded value)? ubicacionLoaded,
    TResult Function(Failure value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class Failure extends UbicacionState {
  factory Failure(final String error) = _$FailureImpl;
  Failure._() : super._();

  String get error;
  @JsonKey(ignore: true)
  _$$FailureImplCopyWith<_$FailureImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
