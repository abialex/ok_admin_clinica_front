import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_sliver_list.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/cupertino.dart';

//! falta lo mismo aquí
class GraficoByOneDay extends StatelessWidget {
  const GraficoByOneDay({
    super.key,
    required this.citasToday,
    required this.promedioTimeToday,
  });

  final List<CitaViewModel> citasToday;
  final double promedioTimeToday;

  @override
  Widget build(BuildContext context) {
    return citasToday.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: AppSliverList(
                    items: citasToday,
                    itemBuilder: (context, item) {
                      return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 2.5,
                            horizontal: 150,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.slg01),
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTextGlobal.lightText(text: "Hora de Confirmación", textAlign: TextAlign.left),
                                          AppBox.w10,
                                          AppTextGlobal.lightText(text: item.fechaConfirmacion?.toFormatHHm12h() ?? '--'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTextGlobal.lightText(text: "Hora de Validación", textAlign: TextAlign.left),
                                          AppBox.w10,
                                          AppTextGlobal.lightText(text: item.fechaValidacion?.toFormatHHm12h() ?? '--'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTextGlobal.lightText(text: "Tiempo:", textAlign: TextAlign.left),
                                          AppBox.w10,
                                          AppTextGlobal.lightText(
                                            text: convertDoubleToTimeString2(((item.fechaValidacion?.hour ?? 0) * 60 +
                                                (item.fechaValidacion?.minute ?? 0) -
                                                (item.fechaConfirmacion?.minute ?? 0) -
                                                (item.fechaConfirmacion?.hour ?? 0) * 60)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // AppTextGlobal.labelLightText(text: item.doctor),
                                  // Text(item.razon ?? 'ss'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppTextGlobal.labelLightText(text: item.doctor),
                                  Text(item.razon ?? 'ss'),
                                ],
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextGlobal.lightText(text: "Promedio Atención: "),
                  AppTextGlobal.labelLightText(
                    text: (convertDoubleToTimeString2(promedioTimeToday)),
                  ),
                ],
              )
            ],
          )
        : Center(child: AppTextGlobal.labelLightText(text: 'No hay citas'));
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
