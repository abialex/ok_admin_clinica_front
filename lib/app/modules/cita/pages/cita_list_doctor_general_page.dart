// ignore_for_file: must_be_immutable
import 'package:admin_clinica_front/app/common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/service/doctor_api.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:admin_clinica_front/app/modules/cita/widget/app_calendar_widget.dart';
import 'package:admin_clinica_front/app/modules/cita/widget/cita_doctor_card.dart';
import 'package:admin_clinica_front/app/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/cita_bloc.dart';

class CitaListDoctorGeneralPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaListDoctorGeneralPage({super.key});
  var doctorList = <DoctorDto>[];
  var citaList = <CitaDTO>[];
  var request = CitaRequest(fechaHoraCita: DateTime.now().toFormatyyyyMMdd());

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorListBloc(),
      child: Builder(builder: (context) {
        final doctorBloc = context.read<DoctorListBloc>();
        final usuarioBloc = context.read<UsuarioBloc>();

        return MultiBlocListener(
          listeners: [
            BlocListener<DoctorListBloc, DoctorListState>(
              bloc: doctorBloc..add(DoctorListEvent.getDoctors()),
              listener: (context, state) {
                state.map(
                  initial: (value) {},
                  loading: (value) {},
                  doctorsLoaded: (value) {
                    final doctorSelected = value.doctors[0];
                    request = request.copyWith(
                      doctorId: doctorSelected.id,
                      ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                    );
                    doctorList.addAll(value.doctors);
                    usuarioBloc.setDoctorSelected(value.doctors[0]);

                    if (doctorSelected.is_active) {
                      request = request.copyWith(
                        ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                        doctorId: doctorSelected.id,
                      );
                      context.read<CitaBloc>().add(CitaEvent.getCitas(request));
                    } else {
                      context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                    }
                  },
                  failure: (value) {},
                );
              },
            ),
            BlocListener<CitaBloc, CitaState>(
              listener: (context, state) {
                state.map(
                  initial: (value) {},
                  loading: (value) {},
                  citaLoaded: (value) {
                    citaList
                      ..clear()
                      ..addAll(value.citas);
                  },
                  citaOcupadaCreated: (value) {
                    // context.read<CitaBloc>().add(CitaEvent.getCitas(request));
                  },
                  failure: (value) {},
                );
              },
            ),
          ],
          child: whatIs(context),
        );
      }),
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      title: "CITAS",
    );
  }

  void timer() {}
  @override
  PageBasePhone buildMobile(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();
    // final usuarioBloc = context.read<UsuarioBloc>();

    return PageBasePhone(
      maxEntend: 300,
      minEntend: 300,
      headerWidget: BlocProvider(
        create: (context) => TimerCubit(),
        child: Builder(builder: (context) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: HeaderMobile(
                  title: "CITAS",
                ),
              ),
              AppBox.h6,
              // BlocBuilder<DoctorListBloc, DoctorListState>(
              //   builder: (context, state) {
              //     return ListDoctorHorizontalScroll(
              //       doctorIdInitialSelected: request.doctorId,
              //       doctors: doctorList,
              //       onChanged: (doctor) {},
              //     );
              //   },
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                child: SizedBox(
                  height: 195,
                  child: AppCalendarWidget(
                    onDaySelected: (value) {
                      request = request.copyWith(fechaHoraCita: value.toFormatyyyyMMdd());
                      citaBloc.add(CitaEvent.getCitas(request));
                    },
                  ),
                ),
              ),
              BlocBuilder<TimerCubit, double>(
                builder: (context, state) {
                  return LinearProgressIndicator(
                    value: state,
                  );
                },
              ),
            ],
          );
        }),
      ),
      bodySliver: SliverToBoxAdapter(
        child: BlocBuilder<CitaBloc, CitaState>(
          builder: (context, state) {
            if (state is CitaLoading) {
              return SvgPicture.asset(
                AppConstSvgs.logo,
                height: 125,
                color: AppConstColors.slgPrincipal,
              )
                  .animate(
                    onPlay: (controller) => controller.loop(),
                  )
                  .rotate(
                    duration: 1.25.seconds,
                  );
            }
            return CitasGroupedByHourDoctor(
              citas: citaList,
              onAdd: (hora, horaString) {
                // context.read<CitaCreateBloc>().add(CitaCreateEvent.citaPreCreateLocal(doctorSelected, request.fechaHoraCitaDate!, hora, horaString));
                // Navigator.pushNamed(
                //   context,
                //   Routes.base_asistenteRecepcion + Routes.cita_add,
                // );
              },
              onBlock: (hora) {
                return CitaOcupadaCreateModel(doctorId: request.doctorId!, fechaHoraCita: request.fechaHoraCita!);
              },
              onRelease: (citaId) {
                // dialogCubit.showErrorAlert(texto: "sin implementar $citaId");
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("TABLET"),
      ),
      body: const SizedBox.shrink(),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = locator<DoctorApi>();
          final storage = locator<ILocalRepository>();
          storage.saveToken("token 47a868ce1c2c87cd80a68771405553f2fbe4c5d9");
          final result = await api.getDoctorsByIdUbicacionFromAsistente();
          result.fold((left) => print(left), (right) => print(right));
          // dialog.showDialog(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class TimerCubit extends Cubit<double> {
  TimerCubit() : super(0);

  void changeTimer(double mode) {
    emit(mode);
  }

  void resetTimer() {
    emit(0);
  }
}
