// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$HomeEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UsuarioLoginResponseViewModel? usuario)
        setupDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetupUsuarioEvent value) setupDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupDoctors,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupDoctors,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeEventCopyWith<$Res> {
  factory $HomeEventCopyWith(HomeEvent value, $Res Function(HomeEvent) then) =
      _$HomeEventCopyWithImpl<$Res, HomeEvent>;
}

/// @nodoc
class _$HomeEventCopyWithImpl<$Res, $Val extends HomeEvent>
    implements $HomeEventCopyWith<$Res> {
  _$HomeEventCopyWithImpl(this._value, this._then);

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
    extends _$HomeEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'HomeEvent.started()';
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
    required TResult Function(UsuarioLoginResponseViewModel? usuario)
        setupDoctors,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupDoctors,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupDoctors,
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
    required TResult Function(SetupUsuarioEvent value) setupDoctors,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupDoctors,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupDoctors,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements HomeEvent {
  const factory _Started() = _$StartedImpl;
}

/// @nodoc
abstract class _$$SetupUsuarioEventImplCopyWith<$Res> {
  factory _$$SetupUsuarioEventImplCopyWith(_$SetupUsuarioEventImpl value,
          $Res Function(_$SetupUsuarioEventImpl) then) =
      __$$SetupUsuarioEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UsuarioLoginResponseViewModel? usuario});
}

/// @nodoc
class __$$SetupUsuarioEventImplCopyWithImpl<$Res>
    extends _$HomeEventCopyWithImpl<$Res, _$SetupUsuarioEventImpl>
    implements _$$SetupUsuarioEventImplCopyWith<$Res> {
  __$$SetupUsuarioEventImplCopyWithImpl(_$SetupUsuarioEventImpl _value,
      $Res Function(_$SetupUsuarioEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = freezed,
  }) {
    return _then(_$SetupUsuarioEventImpl(
      freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioLoginResponseViewModel?,
    ));
  }
}

/// @nodoc

class _$SetupUsuarioEventImpl implements SetupUsuarioEvent {
  const _$SetupUsuarioEventImpl(this.usuario);

  @override
  final UsuarioLoginResponseViewModel? usuario;

  @override
  String toString() {
    return 'HomeEvent.setupDoctors(usuario: $usuario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetupUsuarioEventImpl &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetupUsuarioEventImplCopyWith<_$SetupUsuarioEventImpl> get copyWith =>
      __$$SetupUsuarioEventImplCopyWithImpl<_$SetupUsuarioEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UsuarioLoginResponseViewModel? usuario)
        setupDoctors,
  }) {
    return setupDoctors(usuario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupDoctors,
  }) {
    return setupDoctors?.call(usuario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupDoctors,
    required TResult orElse(),
  }) {
    if (setupDoctors != null) {
      return setupDoctors(usuario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetupUsuarioEvent value) setupDoctors,
  }) {
    return setupDoctors(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupDoctors,
  }) {
    return setupDoctors?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupDoctors,
    required TResult orElse(),
  }) {
    if (setupDoctors != null) {
      return setupDoctors(this);
    }
    return orElse();
  }
}

abstract class SetupUsuarioEvent implements HomeEvent {
  const factory SetupUsuarioEvent(
      final UsuarioLoginResponseViewModel? usuario) = _$SetupUsuarioEventImpl;

  UsuarioLoginResponseViewModel? get usuario;
  @JsonKey(ignore: true)
  _$$SetupUsuarioEventImplCopyWith<_$SetupUsuarioEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HomeState {
  bool get isValid => throw _privateConstructorUsedError; //valid form
  bool get fetching => throw _privateConstructorUsedError; //solicitando
  String? get messageError => throw _privateConstructorUsedError; //solicitando
  UsuarioLoginResponseViewModel? get usuario =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isValid, bool fetching, String? messageError,
            UsuarioLoginResponseViewModel? usuario)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid, bool fetching, String? messageError,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid, bool fetching, String? messageError,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $HomeStateCopyWith<HomeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HomeStateCopyWith<$Res> {
  factory $HomeStateCopyWith(HomeState value, $Res Function(HomeState) then) =
      _$HomeStateCopyWithImpl<$Res, HomeState>;
  @useResult
  $Res call(
      {bool isValid,
      bool fetching,
      String? messageError,
      UsuarioLoginResponseViewModel? usuario});
}

/// @nodoc
class _$HomeStateCopyWithImpl<$Res, $Val extends HomeState>
    implements $HomeStateCopyWith<$Res> {
  _$HomeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? fetching = null,
    Object? messageError = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_value.copyWith(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioLoginResponseViewModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $HomeStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid,
      bool fetching,
      String? messageError,
      UsuarioLoginResponseViewModel? usuario});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$HomeStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? fetching = null,
    Object? messageError = freezed,
    Object? usuario = freezed,
  }) {
    return _then(_$InitialImpl(
      isValid: null == isValid
          ? _value.isValid
          : isValid // ignore: cast_nullable_to_non_nullable
              as bool,
      fetching: null == fetching
          ? _value.fetching
          : fetching // ignore: cast_nullable_to_non_nullable
              as bool,
      messageError: freezed == messageError
          ? _value.messageError
          : messageError // ignore: cast_nullable_to_non_nullable
              as String?,
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioLoginResponseViewModel?,
    ));
  }
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl(
      {this.isValid = false,
      this.fetching = false,
      this.messageError = null,
      this.usuario = null});

  @override
  @JsonKey()
  final bool isValid;
//valid form
  @override
  @JsonKey()
  final bool fetching;
//solicitando
  @override
  @JsonKey()
  final String? messageError;
//solicitando
  @override
  @JsonKey()
  final UsuarioLoginResponseViewModel? usuario;

  @override
  String toString() {
    return 'HomeState.initial(isValid: $isValid, fetching: $fetching, messageError: $messageError, usuario: $usuario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.fetching, fetching) ||
                other.fetching == fetching) &&
            (identical(other.messageError, messageError) ||
                other.messageError == messageError) &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, isValid, fetching, messageError, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(bool isValid, bool fetching, String? messageError,
            UsuarioLoginResponseViewModel? usuario)
        initial,
  }) {
    return initial(isValid, fetching, messageError, usuario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid, bool fetching, String? messageError,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
  }) {
    return initial?.call(isValid, fetching, messageError, usuario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid, bool fetching, String? messageError,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isValid, fetching, messageError, usuario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements HomeState {
  const factory _Initial(
      {final bool isValid,
      final bool fetching,
      final String? messageError,
      final UsuarioLoginResponseViewModel? usuario}) = _$InitialImpl;

  @override
  bool get isValid;
  @override //valid form
  bool get fetching;
  @override //solicitando
  String? get messageError;
  @override //solicitando
  UsuarioLoginResponseViewModel? get usuario;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
