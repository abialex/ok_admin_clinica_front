import 'package:admin_clinica_front/common/enums/control_cita_tipo_enum.dart';
import 'package:admin_clinica_front/ui/cubits/index_cubit.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/bloc/cita_list/cita_list_admin_bloc.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/citas_by_one_day.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/citas_by_range_days.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitaPromedioInicioFinList extends StatelessWidget {
  const CitaPromedioInicioFinList({
    super.key,
    required this.citas,
    required this.request,
  });
  final List<CitaPromedioDateTime> citas;
  final CitaRequestAdminViewModel request;

  @override
  Widget build(BuildContext context) {
    return BlocListener<IndexCubit, int>(
      listener: (context, state) {
        context.read<CitaListAdminBloc>().add(InitialCitaListAdmin());
      },
      child: context.watch<IndexCubit>().state == 1
          ? GraficoByRangeDays(
              tipoControlCita: ControlCitaTipoEnum.inicioToFin,
              citas: citas,
              request: request,
            )
          : GraficoByOneDay(
              tipoControlCita: ControlCitaTipoEnum.inicioToFin,
              citasToday: citas.expand((element) => element.citas).toList(),
              promedioTimeToday: citas.map((e) => e.promedio).reduce((value, element) => value + element),
            ),
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
