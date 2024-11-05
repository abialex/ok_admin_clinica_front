// ignore_for_file: must_be_immutable
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/cubits/timer_cubit.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/service/doctor_api.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_list_carousel_doctor.dart';
import 'package:admin_clinica_front/app/common/widget/app_list_doctor_horizontal_scroll.dart';
import 'package:admin_clinica_front/app/common/widget/app_loader_mini.dart';
import 'package:admin_clinica_front/app/common/cubits/count_isolate_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/date/app_calendar_time_line.dart';
import 'package:admin_clinica_front/app/common/widget/date/app_date_picker_cupertino.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/app/modules/cita/widget/cita_card_asist_recep.dart';
import 'package:admin_clinica_front/app/modules/cita/widget/cita_card_asist_recep_desktop.dart';
import 'package:admin_clinica_front/app/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../bloc/cita_bloc.dart';

class CitaListAsistenteDoctorPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaListAsistenteDoctorPage({super.key});
  var doctorList = <DoctorDto>[];
  var citaList = <CitaDTO>[];

  DateTime dateSelected = DateTime.now();
  DoctorDto? doctorSelected;
  var request = CitaRequest(fechaHoraCita: DateTime.now().toFormatyyyyMMdd());
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CountIsolateCubit(intervalAction: 60),
        ),
        BlocProvider(
          create: (context) => TimerCubit(),
        ),
        BlocProvider(
          create: (context) => DoctorListBloc(),
        ),
      ],
      child: Builder(builder: (context) {
        final usuarioBloc = context.read<UsuarioBloc>();
        final doctorBloc = context.read<DoctorListBloc>();
        request = request.copyWith(
          doctorId: usuarioBloc.state.doctorIdSelected?.id,
          ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
        );

        return MultiBlocListener(
          listeners: [
            BlocListener<DoctorListBloc, DoctorListState>(
              bloc: doctorBloc..add(DoctorListEvent.getDoctors()),
              listener: (context, state) {
                state.map(
                  initial: (value) {},
                  loading: (value) {},
                  doctorsLoaded: (value) {
                    doctorList.addAll(value.doctors);
                    doctorSelected = usuarioBloc.state.doctorIdSelected;
                    request = request.copyWith(doctorId: usuarioBloc.state.doctorIdSelected?.id);
                    if (value.doctors.any(
                      (element) => request.doctorId == element.id,
                    )) {
                      final doctorFound = value.doctors.firstWhere((element) => request.doctorId == element.id);
                      if (doctorFound.is_active) {
                        context.read<CitaBloc>().add(
                              CitaEvent.getCitas(request),
                            );
                      } else {
                        context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                      }
                    } else {
                      if (value.doctors.isNotEmpty) usuarioBloc.setDoctorSelected(value.doctors[0]);
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
    final citaBloc = context.read<CitaBloc>();
    final usuarioBloc = context.read<UsuarioBloc>();

    return PageBaseDesktop(
      title: "CITAS",
      backgroundColor: AppConstColors.white,
      bodyWidget: Builder(builder: (context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBox.h10,
            Row(
              children: [
                const Expanded(child: SizedBox.shrink()),
                Expanded(
                  flex: 10,
                  child: BlocBuilder<DoctorListBloc, DoctorListState>(
                    builder: (context, state) {
                      if (doctorList.isEmpty) {
                        return const SizedBox.shrink();
                      }
                      return SizedBox(
                        height: 60,
                        child: AppListCarouselDoctor(
                          doctorIdInitialSelected: request.doctorId,
                          doctors: doctorList,
                          onChanged: (doctor) {
                            request = request.copyWith(doctorId: doctor.id);
                            usuarioBloc.setDoctorSelected(doctor);
                            doctorSelected = doctor;
                            if (!doctor.is_active) {
                              context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                              return;
                            }
                            context.read<CitaBloc>().add(CitaEvent.getCitas(request));
                          },
                        ),
                      );
                    },
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
              ],
            ),
            AppCalendarTimeLine(
              onDateChange: (value) {
                request = request.copyWith(fechaHoraCita: value.toFormatyyyyMMdd());
                citaBloc.add(CitaEvent.getCitas(request));
              },
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
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
                        return CitasGroupedByHourAsistRecepDesktop(
                          citas: citaList,
                          onAdd: (hora, horaString) {
                            context.read<CitaCreateBloc>().add(CitaCreateEvent.citaPreCreateLocal(doctorSelected, request.fechaHoraCitaDate!, hora, horaString));
                            Navigator.pushNamed(
                              context,
                              Routes.base_asistenteRecepcion + Routes.cita_add,
                            );
                          },
                          onBlock: (hora) {
                            final fechaHora = (request.fechaHoraCitaDate?.copyWith(hour: hora));
                            return CitaOcupadaCreateModel(doctorId: request.doctorId!, fechaHoraCita: fechaHora!.toFormatyyyyMMddHHmmss());
                            // context.read<CitaBloc>().add(CitaEvent.blockCita());
                          },
                          onRelease: (citaId) {
                            // context.read<CitaBloc>().add(CitaEvent.freeCita(citaId));
                          },
                        ).animate().fade();
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      }),
    );
  }

  @override
  PageBasePhoneBeta buildMobile(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();
    final usuarioBloc = context.read<UsuarioBloc>();

    return PageBasePhoneBeta(
      headerWidget: const HeaderMobile(
        title: "CITAS",
      ),
      bodySliver: [
        SliverAppBar(
          expandedHeight: 110,
          collapsedHeight: 110,
          pinned: true,
          floating: false,
          shadowColor: AppConstColors.white,
          surfaceTintColor: AppConstColors.white,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // AppBox.h2,
                BlocBuilder<DoctorListBloc, DoctorListState>(
                  builder: (context, state) {
                    if (doctorList.isEmpty) {
                      context.read<CitaBloc>().add(CitaEvent.invalidCita('Seleccione opción "Doctor" para crear uno'));
                      return const Center(child: Text("No hay doctores activosss"));
                    }
                    if (doctorSelected != null) {
                      if (doctorList.any(
                        (element) => doctorSelected!.id == element.id,
                      )) {
                        doctorSelected = doctorList.firstWhere((element) => doctorSelected!.id == element.id);
                        if (doctorSelected!.is_active) {
                          context.read<CitaBloc>().add(
                                CitaEvent.getCitas(
                                  CitaRequest(
                                    doctorId: doctorSelected!.id,
                                    ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                    fechaHoraCita: DateTime.now().toFormatyyyyMMdd(),
                                  ),
                                ),
                              );
                        } else {
                          context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                        }
                      } else {
                        if (doctorList.isNotEmpty) usuarioBloc.setDoctorSelected(doctorList[0]);
                      }
                    }

                    return ListDoctorHorizontalScroll(
                      doctorIdInitialSelected: doctorSelected?.id,
                      doctors: doctorList,
                      onChanged: (doctor) {
                        doctorSelected = doctor;
                        usuarioBloc.setDoctorSelected(doctor);
                        if (!doctor.is_active) {
                          context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                          return;
                        }
                        context.read<CitaBloc>().add(CitaEvent.getCitas(
                              CitaRequest(
                                doctorId: doctor.id,
                                ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                fechaHoraCita: dateSelected.toFormatyyyyMMdd(),
                              ),
                            ));
                        context.read<CountIsolateCubit>().resetExternal();
                      },
                    );
                  },
                ),
                SizedBox(
                  height: 35,
                  child: Stack(
                    children: [
                      Transform.scale(
                        scale: 0.95,
                        child: AppDatePickerCupertino(
                          paddingLeftActivate: true,
                          initialDateTime: DateTime.now(),
                          onDateTimeChanged: (value) {
                            dateSelected = value;
                            if (doctorSelected != null) {
                              if (doctorSelected!.is_active) {
                                citaBloc.add(CitaEvent.getCitas(
                                  CitaRequest(
                                    doctorId: doctorSelected!.id,
                                    ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                    fechaHoraCita: value.toFormatyyyyMMdd(),
                                  ),
                                ));
                                context.read<CountIsolateCubit>().resetExternal();
                              }
                            }
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                AppBox.h6,
                BlocBuilder<TimerCubit, double>(
                  builder: (context, state) {
                    return LinearProgressIndicator(
                      value: state,
                    );
                  },
                ),
              ],
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: BlocBuilder<CitaBloc, CitaState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: 0.5.seconds,
                child: state.map(
                  citaOcupadaCreated: (value) {
                    return const SizedBox.shrink();
                  },
                  initial: (state) {
                    return GestureDetector(
                      onTap: () {
                        citaBloc.add(
                          CitaEvent.getCitas(
                            CitaRequest(
                              doctorId: doctorSelected?.id ?? 0,
                              ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                              fechaHoraCita: DateTime.now().toFormatyyyyMMdd(),
                            ),
                          ),
                        );
                      },
                      child: const SizedBox.shrink(),
                    );
                  },
                  loading: (state) {
                    // loaderCubit.show();
                    return const Center(
                      child: AppLoaderMini(
                        height: 70,
                      ),
                    );
                  },
                  citaLoaded: (state) {
                    // loaderCubit.hidden();
                    return CitasGroupedByHourAsistRecep(
                      citas: state.citas,
                      onAdd: (hora, horaString) {
                        context.read<CitaCreateBloc>().add(CitaCreateEvent.citaPreCreateLocal(doctorSelected, dateSelected, hora, horaString));
                        Navigator.pushNamed(
                          context,
                          Routes.base_asistenteRecepcion + Routes.cita_add,
                        );
                      },
                      onBlock: (hora) {
                        return CitaOcupadaCreateModel(doctorId: doctorSelected!.id, fechaHoraCita: dateSelected.copyWith(hour: hora).toIso8601String());
                      },
                      onRelease: (citaId) {
                        // dialogCubit.showErrorAlert(texto: "sin implementar $citaId");
                      },
                    );
                  },
                  failure: (state) {
                    // loaderCubit.hidden();

                    return Text(state.error);
                  },
                ),
              );
            },
          ),
        ),
      ],
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
