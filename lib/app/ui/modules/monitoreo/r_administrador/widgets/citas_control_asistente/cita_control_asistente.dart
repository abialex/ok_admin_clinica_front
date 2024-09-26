import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/bloc/cita_list/cita_list_admin_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/r_administrador/widgets/citas_control_asistente/cita_promedio_asistente.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ControlAsistente extends StatelessWidget {
  const ControlAsistente({
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
          final citasIncompletasAsistenta =
              stt.citas.where((element) => (element.fechaConfirmacion == null && element.fechaValidacion != null) || element.fechaConfirmacion != null && element.fechaValidacion == null).toList();
          final citasCompletasAsistenta = stt.citas.where((element) => element.fechaConfirmacion != null && element.fechaValidacion != null);

          return Stack(
            children: [
              CitaPromedioAsistentaList(
                citas: () {
                  final dateList = getDatesBetween(request.fechaInicio ?? (request.fecha ?? DateTime.now()), request.fechaFin ?? (request.fecha ?? DateTime.now())).map((dateItem) {
                    final citasByToday = citasCompletasAsistenta
                        .where(
                          (citaItem) => (citaItem.fechaHoraCita.isSameDate(dateItem)),
                        )
                        .toList();

                    //sacar promedio de hora la lista de citas
                    double promedioTime = citasByToday.fold(
                        0,
                        (previousValue, element) =>
                            previousValue +
                            ((element.fechaValidacion?.hour ?? 0) * 60 +
                                (element.fechaValidacion?.minute ?? 0) -
                                (element.fechaConfirmacion?.minute ?? 0) -
                                (element.fechaConfirmacion?.hour ?? 0) * 60));
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
                        AppTextGlobal.lightText(text: "Citas incompletas Control de Asistenta: "),
                        AppTextGlobal.labelLightText(text: citasIncompletasAsistenta.length.toString()),
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

List<DateTime> getDatesBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> dates = [];
  DateTime currentDate = startDate;

  while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dates.add(currentDate);
    currentDate = currentDate.add(const Duration(days: 1));
  }

  return dates;
}
