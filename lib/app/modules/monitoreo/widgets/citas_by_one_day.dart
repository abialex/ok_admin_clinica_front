import 'package:admin_clinica_front/app/common/enums/control_cita_tipo_enum.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_sliver_list.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:flutter/cupertino.dart';

//! falta lo mismo aquí
class GraficoByOneDay extends StatelessWidget {
  const GraficoByOneDay({
    super.key,
    required this.citasToday,
    required this.promedioTimeToday,
    required this.tipoControlCita,
  });

  final List<CitaDTO> citasToday;
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
                                  AppTextGlobal.labelLightText(text: item.doctor ?? 'n.a'),
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

  Widget _inicioToFin(CitaDTO item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaInicioDate?.toFormatHHm12h() ?? '--'),
            AppBox.w10,
            AppTextGlobal.lightText(text: "- Hora de Inicio", textAlign: TextAlign.left),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaFinDate?.toFormatHHm12h() ?? '--'),
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
              text: convertDoubleToTimeString2(((item.fechaFinDate?.hour ?? 0) * 60 + (item.fechaFinDate?.minute ?? 0) - (item.fechaInicioDate?.minute ?? 0) - (item.fechaInicioDate?.hour ?? 0) * 60)),
            ),
          ],
        ),
      ],
    );
  }

  Widget _confirmadoToValidado(CitaDTO item) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaConfirmacionDate?.toFormatHHm12h() ?? '--'),
            AppBox.w4,
            AppTextGlobal.lightText(text: "- Hora de Confirmación", textAlign: TextAlign.left),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppTextGlobal.lightText(text: item.fechaValidacionDate?.toFormatHHm12h() ?? '--'),
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
                  ((item.fechaValidacionDate?.hour ?? 0) * 60 + (item.fechaValidacionDate?.minute ?? 0) - (item.fechaConfirmacionDate?.minute ?? 0) - (item.fechaConfirmacionDate?.hour ?? 0) * 60)),
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
