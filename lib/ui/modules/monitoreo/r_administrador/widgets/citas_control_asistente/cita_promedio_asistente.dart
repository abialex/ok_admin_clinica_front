import 'package:admin_clinica_front/ui/cubits/index_cubit.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/bloc/cita_list/cita_list_admin_bloc.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/citas_by_one_day.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/citas_by_range_days.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitaPromedioAsistentaList extends StatelessWidget {
  const CitaPromedioAsistentaList({
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
              citas: citas,
              request: request,
            )
          : GraficoByOneDay(
              citasToday: citas.expand((element) => element.citas).toList(),
              promedioTimeToday: citas.expand((element) => element.citas).fold(
                      0,
                      (previousValue, element) =>
                          previousValue +
                          ((element.fechaValidacion?.hour ?? 0) * 60 +
                              (element.fechaValidacion?.minute ?? 0) -
                              (element.fechaConfirmacion?.minute ?? 0) -
                              (element.fechaConfirmacion?.hour ?? 0) * 60)) /
                  (citas.isEmpty ? 1 : citas.expand((element) => element.citas).length),
            ),
    );
  }
}
