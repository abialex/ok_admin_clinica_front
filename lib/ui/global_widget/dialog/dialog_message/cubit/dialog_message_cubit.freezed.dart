// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dialog_message_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DialogMessageState {
  bool get show => throw _privateConstructorUsedError;
  bool get onlyOptions => throw _privateConstructorUsedError;
  String get titulo => throw _privateConstructorUsedError;
  String get texto => throw _privateConstructorUsedError;
  IconData get icon => throw _privateConstructorUsedError;
  Color get colorBackground => throw _privateConstructorUsedError;
  dynamic Function()? get onAceptar => throw _privateConstructorUsedError;
  dynamic Function()? get onCancelar => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DialogMessageStateCopyWith<DialogMessageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DialogMessageStateCopyWith<$Res> {
  factory $DialogMessageStateCopyWith(
          DialogMessageState value, $Res Function(DialogMessageState) then) =
      _$DialogMessageStateCopyWithImpl<$Res, DialogMessageState>;
  @useResult
  $Res call(
      {bool show,
      bool onlyOptions,
      String titulo,
      String texto,
      IconData icon,
      Color colorBackground,
      dynamic Function()? onAceptar,
      dynamic Function()? onCancelar});
}

/// @nodoc
class _$DialogMessageStateCopyWithImpl<$Res, $Val extends DialogMessageState>
    implements $DialogMessageStateCopyWith<$Res> {
  _$DialogMessageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = null,
    Object? onlyOptions = null,
    Object? titulo = null,
    Object? texto = null,
    Object? icon = null,
    Object? colorBackground = null,
    Object? onAceptar = freezed,
    Object? onCancelar = freezed,
  }) {
    return _then(_value.copyWith(
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyOptions: null == onlyOptions
          ? _value.onlyOptions
          : onlyOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      titulo: null == titulo
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      colorBackground: null == colorBackground
          ? _value.colorBackground
          : colorBackground // ignore: cast_nullable_to_non_nullable
              as Color,
      onAceptar: freezed == onAceptar
          ? _value.onAceptar
          : onAceptar // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
      onCancelar: freezed == onCancelar
          ? _value.onCancelar
          : onCancelar // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DialogStateImplCopyWith<$Res>
    implements $DialogMessageStateCopyWith<$Res> {
  factory _$$DialogStateImplCopyWith(
          _$DialogStateImpl value, $Res Function(_$DialogStateImpl) then) =
      __$$DialogStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool show,
      bool onlyOptions,
      String titulo,
      String texto,
      IconData icon,
      Color colorBackground,
      dynamic Function()? onAceptar,
      dynamic Function()? onCancelar});
}

/// @nodoc
class __$$DialogStateImplCopyWithImpl<$Res>
    extends _$DialogMessageStateCopyWithImpl<$Res, _$DialogStateImpl>
    implements _$$DialogStateImplCopyWith<$Res> {
  __$$DialogStateImplCopyWithImpl(
      _$DialogStateImpl _value, $Res Function(_$DialogStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? show = null,
    Object? onlyOptions = null,
    Object? titulo = null,
    Object? texto = null,
    Object? icon = null,
    Object? colorBackground = null,
    Object? onAceptar = freezed,
    Object? onCancelar = freezed,
  }) {
    return _then(_$DialogStateImpl(
      show: null == show
          ? _value.show
          : show // ignore: cast_nullable_to_non_nullable
              as bool,
      onlyOptions: null == onlyOptions
          ? _value.onlyOptions
          : onlyOptions // ignore: cast_nullable_to_non_nullable
              as bool,
      titulo: null == titulo
          ? _value.titulo
          : titulo // ignore: cast_nullable_to_non_nullable
              as String,
      texto: null == texto
          ? _value.texto
          : texto // ignore: cast_nullable_to_non_nullable
              as String,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as IconData,
      colorBackground: null == colorBackground
          ? _value.colorBackground
          : colorBackground // ignore: cast_nullable_to_non_nullable
              as Color,
      onAceptar: freezed == onAceptar
          ? _value.onAceptar
          : onAceptar // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
      onCancelar: freezed == onCancelar
          ? _value.onCancelar
          : onCancelar // ignore: cast_nullable_to_non_nullable
              as dynamic Function()?,
    ));
  }
}

/// @nodoc

class _$DialogStateImpl implements _DialogState {
  const _$DialogStateImpl(
      {this.show = false,
      this.onlyOptions = false,
      this.titulo = "titulo",
      this.texto = "texto",
      this.icon = Icons.info_outline,
      this.colorBackground = AppColors.greenAccent,
      this.onAceptar = null,
      this.onCancelar = null});

  @override
  @JsonKey()
  final bool show;
  @override
  @JsonKey()
  final bool onlyOptions;
  @override
  @JsonKey()
  final String titulo;
  @override
  @JsonKey()
  final String texto;
  @override
  @JsonKey()
  final IconData icon;
  @override
  @JsonKey()
  final Color colorBackground;
  @override
  @JsonKey()
  final dynamic Function()? onAceptar;
  @override
  @JsonKey()
  final dynamic Function()? onCancelar;

  @override
  String toString() {
    return 'DialogMessageState(show: $show, onlyOptions: $onlyOptions, titulo: $titulo, texto: $texto, icon: $icon, colorBackground: $colorBackground, onAceptar: $onAceptar, onCancelar: $onCancelar)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DialogStateImpl &&
            (identical(other.show, show) || other.show == show) &&
            (identical(other.onlyOptions, onlyOptions) ||
                other.onlyOptions == onlyOptions) &&
            (identical(other.titulo, titulo) || other.titulo == titulo) &&
            (identical(other.texto, texto) || other.texto == texto) &&
            (identical(other.icon, icon) || other.icon == icon) &&
            (identical(other.colorBackground, colorBackground) ||
                other.colorBackground == colorBackground) &&
            (identical(other.onAceptar, onAceptar) ||
                other.onAceptar == onAceptar) &&
            (identical(other.onCancelar, onCancelar) ||
                other.onCancelar == onCancelar));
  }

  @override
  int get hashCode => Object.hash(runtimeType, show, onlyOptions, titulo, texto,
      icon, colorBackground, onAceptar, onCancelar);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DialogStateImplCopyWith<_$DialogStateImpl> get copyWith =>
      __$$DialogStateImplCopyWithImpl<_$DialogStateImpl>(this, _$identity);
}

abstract class _DialogState implements DialogMessageState {
  const factory _DialogState(
      {final bool show,
      final bool onlyOptions,
      final String titulo,
      final String texto,
      final IconData icon,
      final Color colorBackground,
      final dynamic Function()? onAceptar,
      final dynamic Function()? onCancelar}) = _$DialogStateImpl;

  @override
  bool get show;
  @override
  bool get onlyOptions;
  @override
  String get titulo;
  @override
  String get texto;
  @override
  IconData get icon;
  @override
  Color get colorBackground;
  @override
  dynamic Function()? get onAceptar;
  @override
  dynamic Function()? get onCancelar;
  @override
  @JsonKey(ignore: true)
  _$$DialogStateImplCopyWith<_$DialogStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
