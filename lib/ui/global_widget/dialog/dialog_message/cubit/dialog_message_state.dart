part of 'dialog_message_cubit.dart';

@freezed
class DialogMessageState with _$DialogMessageState {
  const factory DialogMessageState(
      {@Default(false) bool show,
      @Default(false) bool onlyOptions,
      @Default("titulo") String titulo,
      @Default("texto") String texto,
      @Default(Icons.info_outline) IconData icon,
      @Default(AppColors.greenAccent) Color colorBackground,
      @Default(null) Function()? onAceptar,
      @Default(null) Function()? onCancelar}) = _DialogState;
}
