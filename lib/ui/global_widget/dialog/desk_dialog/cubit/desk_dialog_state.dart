part of 'desk_dialog_cubit.dart';

@freezed
class DeskDialogState with _$DeskDialogState {
  const factory DeskDialogState(
      {@Default(false) bool show,
      @Default(false) bool onlyOptions,
      @Default("titulo") String titulo,
      @Default("texto") String texto,
      @Default(Icons.info_outline) IconData icon,
      @Default(AppColors.greenAccent) Color colorBackground,
      @Default(null) Function()? onAceptar,
      @Default(null) Function()? onCancelar}) = _DialogState;
}
