import 'package:admin_clinica_front/common/enums/control_cita_tipo_enum.dart';
import 'package:admin_clinica_front/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_sliver_list.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/detallado_dialog.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';

class GraficoCitaAsistentaControl extends StatelessWidget {
  const GraficoCitaAsistentaControl({
    super.key,
    required this.itemsList,
    required this.tipoControlCita,
  });
  final List<CitaPromedioDateTime> itemsList;
  final ControlCitaTipoEnum tipoControlCita;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (itemsList.length != 1)
          Expanded(
            child: AppSliverList<CitaPromedioDateTime>(
              scrollDirection: Axis.horizontal,
              items: List.generate(itemsList.length, (index) => itemsList[index]),
              itemBuilder: (context, item) {
                return GestureDetector(
                  onTap: () {
                    if (item.citas.isEmpty) return;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DetallesDialog(
                          citasDia: item.citas,
                          promedioTime: item.promedio,
                          tipoControlCita: tipoControlCita,
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: Column(
                      children: [
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: AppTextGlobal.labelMediumText(
                                    text: item.citas.isEmpty ? '' : convertDoubleToTimeString2(item.promedio),
                                    fontSize: 11,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                AppBox.h6,
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  color: AppConstColors.blueAccent,
                                  height: constraints.maxHeight * (item.promedio / (60 * 4)).clamp(0, 0.9),
                                  child: AppTextGlobal.labelSmallText(
                                    text: '${item.cantidad}\ncitas',
                                    fontSize: 11,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    colorText: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (item.cantidad != 0)
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            color: AppConstColors.blueSecondary,
                            child: AppTextGlobal.labelSmallText(text: item.cantidad.toString(), fontSize: 11, maxLines: 2, textAlign: TextAlign.center, colorText: AppConstColors.white),
                          ),
                        Container(
                          color: AppConstColors.lightBackgroundColor,
                          child: AppTextGlobal.labelMediumText(
                            text: item.date.toFormaMMddSlash(),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        else
          Expanded(child: Center(child: AppTextGlobal.labelLargeText(text: "Seleccione el rango de fechas")))
      ],
    );
  }
}

String convertDoubleToTimeString2(double timeInMinutes) {
  int totalSeconds = (timeInMinutes * 60).round(); // Convertir minutos a segundos
  int hours = totalSeconds ~/ 3600; // Obtener las horas
  int minutes = (totalSeconds % 3600) ~/ 60; // Obtener los minutos restantes
  // int seconds = totalSeconds % 60; // Obtener los segundos restantes
  if (hours == 0) return '${minutes}m';
  if (minutes == 0) return '${hours}h';
  return '${hours}h ${minutes}m';
}
