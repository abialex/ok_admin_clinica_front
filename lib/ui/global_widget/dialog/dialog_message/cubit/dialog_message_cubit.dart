import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'dialog_message_cubit.freezed.dart';
part 'dialog_message_state.dart';

class DialogMessageCubit extends Cubit<DialogMessageState> {
  DialogMessageCubit() : super(const DialogMessageState());

  showDialog(
      {required String titulo,
      required String texto,
      Function()? onAceptar,
      Function()? onCancelar,
      Color colorBackground = AppColors.greenAccent,
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

  disguiseDialog() {
    emit(state.copyWith(show: false, colorBackground: AppColors.greenAccent));
  }
}
