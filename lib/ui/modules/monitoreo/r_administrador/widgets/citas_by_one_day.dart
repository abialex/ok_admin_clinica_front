import 'package:admin_clinica_front/common/enums/control_cita_tipo_enum.dart';
import 'package:admin_clinica_front/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
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
    required this.tipoControlCita,
  });

  final List<CitaViewModel> citasToday;
  final double promedioTimeToday;
  final ControlCitaTipoEnum tipoControlCita;

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
                            border: Border.all(color: AppConstColors.slg01),
                            borderRadius: BorderRadius.circular(15),
                            color: AppConstColors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              () {
                                switch (tipoControlCita) {
                                  case ControlCitaTipoEnum.inicioToFin:
                                    return _inicioToFin(item);
                                  case ControlCitaTipoEnum.confirmadoToValidado:
                                    return _confirmadoToValidado(item);
                                  default:
                                    return const Text("Tipo no definido");
                                }
                              }(),
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

  Widget _inicioToFin(CitaViewModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaInicio?.toFormatHHm12h() ?? '--'),
            AppBox.w10,
            AppTextGlobal.lightText(text: "- Hora de Inicio", textAlign: TextAlign.left),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaFin?.toFormatHHm12h() ?? '--'),
            AppBox.w4,
            AppTextGlobal.lightText(text: "- Hora Fin", textAlign: TextAlign.left),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: "Tiempo:", textAlign: TextAlign.left),
            AppBox.w4,
            AppTextGlobal.lightText(
              text: convertDoubleToTimeString2(((item.fechaFin?.hour ?? 0) * 60 + (item.fechaFin?.minute ?? 0) - (item.fechaInicio?.minute ?? 0) - (item.fechaInicio?.hour ?? 0) * 60)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _confirmadoToValidado(CitaViewModel item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaConfirmacion?.toFormatHHm12h() ?? '--'),
            AppBox.w4,
            AppTextGlobal.lightText(text: "- Hora de Confirmación", textAlign: TextAlign.left),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaValidacion?.toFormatHHm12h() ?? '--'),
            AppBox.w4,
            AppTextGlobal.lightText(text: "- Hora de Validación", textAlign: TextAlign.left),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: "Tiempo:", textAlign: TextAlign.left),
            AppBox.w10,
            AppTextGlobal.lightText(
              text: convertDoubleToTimeString2(
                  ((item.fechaValidacion?.hour ?? 0) * 60 + (item.fechaValidacion?.minute ?? 0) - (item.fechaConfirmacion?.minute ?? 0) - (item.fechaConfirmacion?.hour ?? 0) * 60)),
            ),
          ],
        ),
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
