// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'usuario_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UsuarioEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UsuarioLoginResponseViewModel? usuario)
        setupUsuario,
    required TResult Function(UsuarioLoginResponseViewModel usuario) setUsuario,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult? Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetupUsuarioEvent value) setupUsuario,
    required TResult Function(SetUsuarioEvent value) setUsuario,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupUsuario,
    TResult? Function(SetUsuarioEvent value)? setUsuario,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupUsuario,
    TResult Function(SetUsuarioEvent value)? setUsuario,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioEventCopyWith<$Res> {
  factory $UsuarioEventCopyWith(
          UsuarioEvent value, $Res Function(UsuarioEvent) then) =
      _$UsuarioEventCopyWithImpl<$Res, UsuarioEvent>;
}

/// @nodoc
class _$UsuarioEventCopyWithImpl<$Res, $Val extends UsuarioEvent>
    implements $UsuarioEventCopyWith<$Res> {
  _$UsuarioEventCopyWithImpl(this._value, this._then);

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
    extends _$UsuarioEventCopyWithImpl<$Res, _$StartedImpl>
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
    return 'UsuarioEvent.started()';
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
        setupUsuario,
    required TResult Function(UsuarioLoginResponseViewModel usuario) setUsuario,
  }) {
    return started();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult? Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
  }) {
    return started?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
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
    required TResult Function(SetupUsuarioEvent value) setupUsuario,
    required TResult Function(SetUsuarioEvent value) setUsuario,
  }) {
    return started(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupUsuario,
    TResult? Function(SetUsuarioEvent value)? setUsuario,
  }) {
    return started?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupUsuario,
    TResult Function(SetUsuarioEvent value)? setUsuario,
    required TResult orElse(),
  }) {
    if (started != null) {
      return started(this);
    }
    return orElse();
  }
}

abstract class _Started implements UsuarioEvent {
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
    extends _$UsuarioEventCopyWithImpl<$Res, _$SetupUsuarioEventImpl>
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
    return 'UsuarioEvent.setupUsuario(usuario: $usuario)';
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
        setupUsuario,
    required TResult Function(UsuarioLoginResponseViewModel usuario) setUsuario,
  }) {
    return setupUsuario(usuario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult? Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
  }) {
    return setupUsuario?.call(usuario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
    required TResult orElse(),
  }) {
    if (setupUsuario != null) {
      return setupUsuario(usuario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetupUsuarioEvent value) setupUsuario,
    required TResult Function(SetUsuarioEvent value) setUsuario,
  }) {
    return setupUsuario(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupUsuario,
    TResult? Function(SetUsuarioEvent value)? setUsuario,
  }) {
    return setupUsuario?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupUsuario,
    TResult Function(SetUsuarioEvent value)? setUsuario,
    required TResult orElse(),
  }) {
    if (setupUsuario != null) {
      return setupUsuario(this);
    }
    return orElse();
  }
}

abstract class SetupUsuarioEvent implements UsuarioEvent {
  const factory SetupUsuarioEvent(
      final UsuarioLoginResponseViewModel? usuario) = _$SetupUsuarioEventImpl;

  UsuarioLoginResponseViewModel? get usuario;
  @JsonKey(ignore: true)
  _$$SetupUsuarioEventImplCopyWith<_$SetupUsuarioEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SetUsuarioEventImplCopyWith<$Res> {
  factory _$$SetUsuarioEventImplCopyWith(_$SetUsuarioEventImpl value,
          $Res Function(_$SetUsuarioEventImpl) then) =
      __$$SetUsuarioEventImplCopyWithImpl<$Res>;
  @useResult
  $Res call({UsuarioLoginResponseViewModel usuario});
}

/// @nodoc
class __$$SetUsuarioEventImplCopyWithImpl<$Res>
    extends _$UsuarioEventCopyWithImpl<$Res, _$SetUsuarioEventImpl>
    implements _$$SetUsuarioEventImplCopyWith<$Res> {
  __$$SetUsuarioEventImplCopyWithImpl(
      _$SetUsuarioEventImpl _value, $Res Function(_$SetUsuarioEventImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? usuario = null,
  }) {
    return _then(_$SetUsuarioEventImpl(
      null == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioLoginResponseViewModel,
    ));
  }
}

/// @nodoc

class _$SetUsuarioEventImpl implements SetUsuarioEvent {
  const _$SetUsuarioEventImpl(this.usuario);

  @override
  final UsuarioLoginResponseViewModel usuario;

  @override
  String toString() {
    return 'UsuarioEvent.setUsuario(usuario: $usuario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetUsuarioEventImpl &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetUsuarioEventImplCopyWith<_$SetUsuarioEventImpl> get copyWith =>
      __$$SetUsuarioEventImplCopyWithImpl<_$SetUsuarioEventImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() started,
    required TResult Function(UsuarioLoginResponseViewModel? usuario)
        setupUsuario,
    required TResult Function(UsuarioLoginResponseViewModel usuario) setUsuario,
  }) {
    return setUsuario(usuario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? started,
    TResult? Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult? Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
  }) {
    return setUsuario?.call(usuario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? started,
    TResult Function(UsuarioLoginResponseViewModel? usuario)? setupUsuario,
    TResult Function(UsuarioLoginResponseViewModel usuario)? setUsuario,
    required TResult orElse(),
  }) {
    if (setUsuario != null) {
      return setUsuario(usuario);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Started value) started,
    required TResult Function(SetupUsuarioEvent value) setupUsuario,
    required TResult Function(SetUsuarioEvent value) setUsuario,
  }) {
    return setUsuario(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Started value)? started,
    TResult? Function(SetupUsuarioEvent value)? setupUsuario,
    TResult? Function(SetUsuarioEvent value)? setUsuario,
  }) {
    return setUsuario?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Started value)? started,
    TResult Function(SetupUsuarioEvent value)? setupUsuario,
    TResult Function(SetUsuarioEvent value)? setUsuario,
    required TResult orElse(),
  }) {
    if (setUsuario != null) {
      return setUsuario(this);
    }
    return orElse();
  }
}

abstract class SetUsuarioEvent implements UsuarioEvent {
  const factory SetUsuarioEvent(final UsuarioLoginResponseViewModel usuario) =
      _$SetUsuarioEventImpl;

  UsuarioLoginResponseViewModel get usuario;
  @JsonKey(ignore: true)
  _$$SetUsuarioEventImplCopyWith<_$SetUsuarioEventImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$UsuarioState {
  bool get isValid => throw _privateConstructorUsedError; //valid form
  bool get fetching => throw _privateConstructorUsedError; //solicitando
  UsuarioLoginResponseViewModel? get usuario =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isValid, bool fetching, UsuarioLoginResponseViewModel? usuario)
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid, bool fetching,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid, bool fetching,
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
  $UsuarioStateCopyWith<UsuarioState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UsuarioStateCopyWith<$Res> {
  factory $UsuarioStateCopyWith(
          UsuarioState value, $Res Function(UsuarioState) then) =
      _$UsuarioStateCopyWithImpl<$Res, UsuarioState>;
  @useResult
  $Res call(
      {bool isValid, bool fetching, UsuarioLoginResponseViewModel? usuario});
}

/// @nodoc
class _$UsuarioStateCopyWithImpl<$Res, $Val extends UsuarioState>
    implements $UsuarioStateCopyWith<$Res> {
  _$UsuarioStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? fetching = null,
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
      usuario: freezed == usuario
          ? _value.usuario
          : usuario // ignore: cast_nullable_to_non_nullable
              as UsuarioLoginResponseViewModel?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $UsuarioStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool isValid, bool fetching, UsuarioLoginResponseViewModel? usuario});
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$UsuarioStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isValid = null,
    Object? fetching = null,
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
      {this.isValid = false, this.fetching = false, this.usuario = null});

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
  final UsuarioLoginResponseViewModel? usuario;

  @override
  String toString() {
    return 'UsuarioState.initial(isValid: $isValid, fetching: $fetching, usuario: $usuario)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.isValid, isValid) || other.isValid == isValid) &&
            (identical(other.fetching, fetching) ||
                other.fetching == fetching) &&
            (identical(other.usuario, usuario) || other.usuario == usuario));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isValid, fetching, usuario);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            bool isValid, bool fetching, UsuarioLoginResponseViewModel? usuario)
        initial,
  }) {
    return initial(isValid, fetching, usuario);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(bool isValid, bool fetching,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
  }) {
    return initial?.call(isValid, fetching, usuario);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(bool isValid, bool fetching,
            UsuarioLoginResponseViewModel? usuario)?
        initial,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(isValid, fetching, usuario);
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

abstract class _Initial implements UsuarioState {
  const factory _Initial(
      {final bool isValid,
      final bool fetching,
      final UsuarioLoginResponseViewModel? usuario}) = _$InitialImpl;

  @override
  bool get isValid;
  @override //valid form
  bool get fetching;
  @override //solicitando
  UsuarioLoginResponseViewModel? get usuario;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
