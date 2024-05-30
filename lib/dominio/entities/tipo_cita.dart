import 'dart:ui';

import 'package:admin_clinica_front/core/utils/app_colors.dart';

enum TipoCita {
  tentativa,
  agil,
  completa,
  ocupada,
}

extension TipoCitaExtension on TipoCita {
  String get name {
    switch (this) {
      case TipoCita.tentativa:
        return 'Agil';
      case TipoCita.agil:
        return 'Completa';
      case TipoCita.completa:
        return 'Tentativa';
      case TipoCita.ocupada:
        return 'Ocupada';
      default:
        return '';
    }
  }

  Color get color {
    switch (this) {
      case TipoCita.tentativa:
        return AppColors.orange;
      case TipoCita.agil:
        return AppColors.blue;
      case TipoCita.completa:
        return AppColors.green;
      case TipoCita.ocupada:
        return AppColors.grey;
      default:
        return AppColors.dark;
    }
  }

  static TipoCita fromNumber(int number) {
    switch (number) {
      case 1:
        return TipoCita.tentativa;
      case 2:
        return TipoCita.agil;
      case 3:
        return TipoCita.completa;
      case 4:
        return TipoCita.ocupada;
      default:
        throw ArgumentError('Invalid number for EstadoCita');
    }
  }

  static int fromEstado(TipoCita estado) {
    switch (estado) {
      case TipoCita.tentativa:
        return 1;
      case TipoCita.agil:
        return 2;
      case TipoCita.completa:
        return 3;
      case TipoCita.ocupada:
        return 4;
      default:
        throw ArgumentError('Invalid EstadoCita');
    }
  }
}
