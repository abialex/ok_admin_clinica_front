import 'dart:ui';

import 'package:admin_clinica_front/common/constants/app_const_colors.dart';

enum ControlCitaTipoEnum {
  confirmadoToInicio,
  inicioToFin,
  finToValidado,
  confirmadoToValidado,
}

extension TipoCitaExtension on ControlCitaTipoEnum {
  String get name {
    switch (this) {
      case ControlCitaTipoEnum.confirmadoToInicio:
        return 'confirmadoToInicio';
      case ControlCitaTipoEnum.inicioToFin:
        return 'inicioToFin';
      case ControlCitaTipoEnum.finToValidado:
        return 'finToValidado';
      case ControlCitaTipoEnum.confirmadoToValidado:
        return 'confirmadoToValidado';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case ControlCitaTipoEnum.confirmadoToInicio:
        return AppConstColors.orange;
      case ControlCitaTipoEnum.inicioToFin:
        return AppConstColors.blue;
      case ControlCitaTipoEnum.finToValidado:
        return AppConstColors.green;
      case ControlCitaTipoEnum.confirmadoToValidado:
        return AppConstColors.grey;
      default:
        return AppConstColors.dark;
    }
  }

  static ControlCitaTipoEnum fromNumber(int number) {
    switch (number) {
      case 1:
        return ControlCitaTipoEnum.confirmadoToInicio;
      case 2:
        return ControlCitaTipoEnum.inicioToFin;
      case 3:
        return ControlCitaTipoEnum.finToValidado;
      case 4:
        return ControlCitaTipoEnum.confirmadoToValidado;
      default:
        throw ArgumentError('Invalid number for EstadoCita');
    }
  }

  static int fromEstado(ControlCitaTipoEnum estado) {
    switch (estado) {
      case ControlCitaTipoEnum.confirmadoToInicio:
        return 1;
      case ControlCitaTipoEnum.inicioToFin:
        return 2;
      case ControlCitaTipoEnum.finToValidado:
        return 3;
      case ControlCitaTipoEnum.confirmadoToValidado:
        return 4;
      default:
        throw ArgumentError('Invalid EstadoCita');
    }
  }
}
