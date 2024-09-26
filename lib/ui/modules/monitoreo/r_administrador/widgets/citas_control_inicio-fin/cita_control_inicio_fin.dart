import 'package:admin_clinica_front/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/bloc/cita_list/cita_list_admin_bloc.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/citas_control_inicio-fin/cita_promedio_inicio_fin.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitaControlInicioFin extends StatelessWidget {
  const CitaControlInicioFin({
    super.key,
    required this.request,
  });

  final CitaRequestAdminViewModel request;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CitaListAdminBloc, CitaListAdminState>(
      builder: (context, state) {
        return state.map(initial: (stt) {
          return const SizedBox.shrink();
        }, loading: (stt) {
          return const Center(child: CircularProgressIndicator());
        }, citaLoaded: (stt) {
          final citasIncompletaDoctor = stt.citas.where((element) => (element.fechaInicio == null && element.fechaFin != null) || (element.fechaInicio != null && element.fechaFin == null)).toList();
          final citasCompletasDoctor = stt.citas.where((element) => element.fechaInicio != null && element.fechaFin != null);
          return Stack(
            children: [
              CitaPromedioInicioFinList(
                citas: () {
                  final dateList = getDatesBetween(request.fechaInicio ?? (request.fecha ?? DateTime.now()), request.fechaFin ?? (request.fecha ?? DateTime.now())).map((dateItem) {
                    final citasByToday = citasCompletasDoctor
                        .where(
                          (citaItem) => (citaItem.fechaHoraCita.isSameDate(dateItem)),
                        )
                        .toList();

                    //sacar promedio de hora la lista de citas
                    double promedioTime = citasByToday.fold(
                        0,
                        (previousValue, element) =>
                            previousValue + ((element.fechaFin?.hour ?? 0) * 60 + (element.fechaFin?.minute ?? 0) - (element.fechaInicio?.minute ?? 0) - (element.fechaInicio?.hour ?? 0) * 60));
                    if (citasByToday.isNotEmpty) promedioTime = promedioTime / citasByToday.length;
                    return CitaPromedioDateTime(
                      date: dateItem,
                      promedio: promedioTime,
                      cantidad: citasByToday.length,
                      citas: citasByToday,
                    );
                  }).toList();
                  return dateList;
                }(),
                request: request,
              ),
              Positioned(
                top: 0,
                right: 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        AppTextGlobal.lightText(text: "Citas incompletas Control de Doctor: "),
                        AppTextGlobal.labelLightText(text: citasIncompletaDoctor.length.toString()),
                      ],
                    ),
                  ],
                ),
              )
            ],
          );
        }, failure: (stt) {
          return const SizedBox.shrink();
        });
      },
    );
  }
}
