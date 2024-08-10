import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/citas_by_one_day.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';

//! falta agregar controlar el label de fecha inicio/ fecha fin / fecha  confirmacion
class DetallesDialog extends StatelessWidget {
  const DetallesDialog({super.key, required this.citasDia, required this.promedioTime});

  final List<CitaViewModel> citasDia;
  final double promedioTime;

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
                      border: Border.all(color: AppColors.blueAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
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
                    ),
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
}
