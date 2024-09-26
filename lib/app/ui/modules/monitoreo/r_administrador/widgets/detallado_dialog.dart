import 'package:admin_clinica_front/app/common/enums/control_cita_tipo_enum.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/r_administrador/widgets/citas_by_one_day.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';

class DetallesDialog extends StatelessWidget {
  const DetallesDialog({super.key, required this.citasDia, required this.promedioTime, required this.tipoControlCita});

  final List<CitaViewModel> citasDia;
  final double promedioTime;
  final ControlCitaTipoEnum tipoControlCita;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          children: [
            Column(
              children: List.generate(
                citasDia.length,
                (index) {
                  final cita = citasDia[index];
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppConstColors.blueAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: () {
                      switch (tipoControlCita) {
                        case ControlCitaTipoEnum.confirmadoToValidado:
                          return _buildConfirmacionToValidacion(cita);
                        case ControlCitaTipoEnum.inicioToFin:
                          return _buildInicioToFin(cita);
                        default:
                          return const Text("Tipo no definido");
                      }
                    }(),
                  );
                },
              ),
            ),
            AppBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextGlobal.lightText(text: "Promedio Atención: ", textAlign: TextAlign.center),
                AppTextGlobal.lightText(text: convertDoubleToTimeString2(promedioTime), textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfirmacionToValidacion(CitaViewModel cita) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cita.fechaValidacion?.toFormatyyyyMMddHHmmSlash() ?? '-'),
            const Text(' - '),
            Text(cita.fechaConfirmacion?.toFormatyyyyMMddHHmmSlash() ?? 'n'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.labelLightText(text: cita.doctor),
            AppBox.w10,
            Text(
              convertDoubleToTimeString2(
                  ((cita.fechaValidacion?.hour ?? 0) * 60 + (cita.fechaValidacion?.minute ?? 0) - (cita.fechaConfirmacion?.minute ?? 0) - (cita.fechaConfirmacion?.hour ?? 0) * 60)),
            ),
          ],
        ),
        Row(
          children: [
            AppTextGlobal.lightText(text: cita.razon ?? " N.A"),
          ],
        ),
      ],
    );
  }

  Widget _buildInicioToFin(CitaViewModel cita) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(cita.fechaFin?.toFormatyyyyMMddHHmmSlash() ?? '-'),
            const Text(' - '),
            Text(cita.fechaInicio?.toFormatyyyyMMddHHmmSlash() ?? 'n'),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.labelLightText(text: cita.doctor),
            AppBox.w10,
            Text(
              convertDoubleToTimeString2(((cita.fechaFin?.hour ?? 0) * 60 + (cita.fechaFin?.minute ?? 0) - (cita.fechaInicio?.minute ?? 0) - (cita.fechaInicio?.hour ?? 0) * 60)),
            ),
          ],
        ),
        Row(
          children: [
            AppTextGlobal.lightText(text: cita.razon ?? " N.A"),
          ],
        ),
      ],
    );
  }
}
