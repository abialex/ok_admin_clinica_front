import 'dart:ui';

import 'package:admin_clinica_front/core/utils/app_colors.dart';

enum EstadoCita {
  pendiente,
  confirmado,
  atendiendo,
  finalizado,
  validado,
  cancelado,
}

extension EstadoCitaExtension on EstadoCita {
  String get name {
    switch (this) {
      case EstadoCita.pendiente:
        return 'Pendiente';
      case EstadoCita.confirmado:
        return 'Confirmado';
      case EstadoCita.atendiendo:
        return 'Atendiendo';
      case EstadoCita.finalizado:
        return 'Finalizado';
      case EstadoCita.validado:
        return 'Validado';
      case EstadoCita.cancelado:
        return 'Cancelado';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case EstadoCita.pendiente:
        return AppColors.orange;
      case EstadoCita.confirmado:
        return AppColors.blue;
      case EstadoCita.atendiendo:
        return AppColors.green;
      case EstadoCita.finalizado:
        return AppColors.grey;
      case EstadoCita.validado:
        return AppColors.purple;
      case EstadoCita.cancelado:
        return AppColors.red;
      default:
        return AppColors.dark;
    }
  }

  double get percent {
    switch (this) {
      case EstadoCita.pendiente:
        return 0;
      case EstadoCita.confirmado:
        return 0.25;
      case EstadoCita.atendiendo:
        return 0.5;
      case EstadoCita.finalizado:
        return 0.75;
      case EstadoCita.validado:
        return 1;
      case EstadoCita.cancelado:
        return 0;
      default:
        return 0;
    }
  }

  static EstadoCita fromNumber(int number) {
    switch (number) {
      case 1:
        return EstadoCita.pendiente;
      case 2:
        return EstadoCita.confirmado;
      case 3:
        return EstadoCita.atendiendo;
      case 4:
        return EstadoCita.finalizado;
      case 5:
        return EstadoCita.validado;
      case 6:
        return EstadoCita.cancelado;
      default:
        throw ArgumentError('Invalid number for EstadoCita');
    }
  }

  static int fromEstado(EstadoCita estado) {
    switch (estado) {
      case EstadoCita.pendiente:
        return 1;
      case EstadoCita.confirmado:
        return 2;
      case EstadoCita.atendiendo:
        return 3;
      case EstadoCita.finalizado:
        return 4;
      case EstadoCita.validado:
        return 5;
      case EstadoCita.cancelado:
        return 6;
      default:
        throw ArgumentError('Invalid EstadoCita');
    }
  }
}
