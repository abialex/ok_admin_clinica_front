import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'desk_dialog_cubit.freezed.dart';
part 'desk_dialog_state.dart';

class DeskDialogCubit extends Cubit<DeskDialogState> {
  DeskDialogCubit() : super(const DeskDialogState());

  showCustomAlert(
      {required String titulo,
      required String texto,
      Function()? onAceptar,
      Function()? onCancelar,
      Color colorBackground = AppConstColors.slg01,
      bool onlyOptions = false,
      IconData icon = Icons.info_outline}) {
    emit(state.copyWith(
      show: true,
      titulo: titulo,
      texto: texto,
      onAceptar: onAceptar,
      onCancelar: onCancelar,
      colorBackground: colorBackground,
      icon: icon,
      onlyOptions: onlyOptions,
    ));
  }

  showSuccessAlert({
    required String texto,
    Function()? onAceptar,
    Function()? onCancelar,
  }) {
    emit(state.copyWith(
      show: true,
      onlyOptions: true,
      titulo: "Éxito",
      colorBackground: AppConstColors.green,
      icon: Icons.check,
      texto: texto,
      onAceptar: onAceptar,
      onCancelar: onCancelar,
    ));
  }

  showInfoAlert({
    required String texto,
    Function()? onAceptar,
    Function()? onCancelar,
  }) {
    emit(state.copyWith(
      show: true,
      onlyOptions: true,
      titulo: "Info",
      colorBackground: AppConstColors.slg01,
      icon: Icons.info,
      texto: texto,
      onAceptar: onAceptar,
      onCancelar: onCancelar,
    ));
  }

  showWarningAlert({
    required String texto,
    Function()? onAceptar,
    Function()? onCancelar,
  }) {
    emit(state.copyWith(
      show: true,
      onlyOptions: false,
      titulo: "Advertencia",
      colorBackground: AppConstColors.yellow,
      icon: Icons.warning,
      texto: texto,
      onAceptar: onAceptar,
      onCancelar: onCancelar,
    ));
  }

  showErrorAlert({
    required String texto,
    Function()? onAceptar,
    Function()? onCancelar,
  }) {
    emit(state.copyWith(
      show: true,
      onlyOptions: true,
      titulo: "Error",
      colorBackground: AppConstColors.red,
      icon: Icons.error,
      texto: texto,
      onAceptar: onAceptar,
      onCancelar: onCancelar,
    ));
  }

  showConfirmationAlert({
    required String texto,
    Function()? onAceptar,
    Function()? onCancelar,
  }) {
    emit(state.copyWith(
      show: true,
      onlyOptions: false,
      titulo: "Confirmar",
      colorBackground: AppConstColors.blue,
      icon: Icons.question_mark_rounded,
      texto: texto,
      onAceptar: onAceptar,
      onCancelar: onCancelar,
    ));
  }

  disguiseDialog() {
    emit(state.copyWith(show: false, colorBackground: AppConstColors.greenAccent));
  }
}
