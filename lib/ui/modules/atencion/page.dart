// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/config/routes/router.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/cubits/count_isolate_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/ui/modules/atencion/widget/atencion_card_doctor.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../config/app_dependecy_injection.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';

class AtencionPage extends StatelessWidget with ResponsiveWidgetMixin {
  AtencionPage({super.key});
  DateTime dateSelected = DateTime.now();
  DoctorsViewModel? doctorSelected;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CountIsolateCubit(intervalAction: 60),
      child: whatIs(context),
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      title: "ATENCIÓN",
    );
  }

  void timer() {}
  @override
  PageBasePhone buildMobile(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();
    final usuarioBloc = context.read<UsuarioBloc>();
    Timer? timer;
    Timer? timerprog;

    void timerStart(TimerCubit timerCubit, Function() func) {
      timer?.cancel();
      timerprog?.cancel();
      timerCubit.resetTimer();
      timerprog = Timer.periodic(const Duration(milliseconds: 10), (timer) {
        timerCubit.changeTimer(timerCubit.state + 0.13 / 6);
        if (timerCubit.state >= 1) {
          timer.cancel();
          timerCubit.resetTimer();
        }
      });
      timer = Timer(const Duration(milliseconds: 850), func);
    }

    return PageBasePhone(
      maxEntend: 165,
      minEntend: 165,
      headerWidget: BlocProvider(
        create: (context) => TimerCubit(),
        child: Builder(builder: (context) {
          final timerCubit = context.read<TimerCubit>();
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Expanded(
                child: HeaderMobile(
                  subTitle: "Doctor",
                  title: "ATENCIÓN",
                ),
              ),
              // AppBox.h2,
              BlocProvider(
                create: (context) => DoctorListBloc(),
                child: BlocBuilder<DoctorListBloc, DoctorListState>(
                  builder: (context, state) {
                    final doctorBloc = context.read<DoctorListBloc>();
                    return SizedBox(
                      height: 5,
                      child: state.map(
                        initial: (stt) {
                          doctorBloc.add(GetDoctors());
                          return const SizedBox.shrink();
                        },
                        loading: (stt) {
                          return const SizedBox.shrink();
                        },
                        doctorsLoaded: (stt) {
                          usuarioBloc.setDoctorSelected(stt.doctors[0]);
                          doctorSelected = stt.doctors[0];
                          if (doctorSelected != null) {
                            if (doctorSelected!.isActive) {
                              context.read<CitaBloc>().add(
                                    CitaEvent.getCitas(
                                      CitaRequestViewModel(
                                        doctorId: doctorSelected!.id,
                                        ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                        fechaHoraCita: DateTime.now(),
                                      ),
                                    ),
                                  );
                            } else {
                              context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                            }
                          }

                          doctorSelected = usuarioBloc.state.doctorIdSelected;
                          return BlocListener<CountIsolateCubit, int>(
                              listener: (context, state) {
                                if (state % context.read<CountIsolateCubit>().intervalAction == 0) {
                                  timerStart(timerCubit, () {
                                    if (doctorSelected != null) {
                                      if (stt.doctors.any(
                                        (element) => doctorSelected!.id == element.id,
                                      )) {
                                        doctorSelected = stt.doctors.firstWhere((element) => doctorSelected!.id == element.id);
                                        if (doctorSelected!.isActive) {
                                          context.read<CitaBloc>().add(
                                                CitaEvent.getCitas(
                                                  CitaRequestViewModel(
                                                    doctorId: doctorSelected!.id,
                                                    ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                                    fechaHoraCita: DateTime.now(),
                                                  ),
                                                ),
                                              );
                                        } else {
                                          context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                                        }
                                      }
                                    }
                                  });
                                }
                              },
                              child: const SizedBox.shrink());
                        },
                        failure: (stt) {
                          return Text(stt.error);
                        },
                      ),
                    );
                  },
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                height: 60,
                child: BlocBuilder<CountIsolateCubit, int>(
                  builder: (context, state) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Expanded(
                          flex: 3,
                          child: Row(
                            children: [
                              Expanded(
                                child: AppTextGlobal.labelLightText(
                                  text: "CITAS DE HOY ",
                                  maxLines: 2,
                                  textAlign: TextAlign.center,
                                  fontSize: 22,
                                )
                                    .animate(
                                      onPlay: (controller) => controller.loop(reverse: true),
                                    )
                                    .slide(
                                      delay: 3.seconds,
                                      duration: 0.5.seconds,
                                      curve: Curves.bounceIn,
                                      begin: const Offset(0, 0),
                                      end: const Offset(0, -0.25),
                                    ),
                              )
                            ],
                          ),
                        ),
                        AppBox.w10,
                        Expanded(
                          flex: 2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                child: AppTextGlobal.lightText(
                                  text: "$state",
                                  fontSize: 50,
                                  colorText: AppConstColors.grey,
                                ),
                              ),
                              AppBox.w6,
                              GestureDetector(
                                onTap: () {
                                  if (doctorSelected!.isActive) {
                                    citaBloc.add(
                                      CitaEvent.getCitas(
                                        CitaRequestViewModel(
                                          doctorId: doctorSelected?.id ?? 0,
                                          ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                          fechaHoraCita: DateTime.now(),
                                        ),
                                      ),
                                    );
                                    context.read<CountIsolateCubit>().resetExternal();
                                  } else {
                                    context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                                  }
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                                  decoration: BoxDecoration(
                                    color: AppConstColors.slg01,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: const Icon(
                                    Icons.restore,
                                    color: AppConstColors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  },
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
          );
        }),
      ),
      bodySliver: SliverToBoxAdapter(
        child: BlocBuilder<CitaBloc, CitaState>(
          builder: (context, state) {
            return state.map(
              initial: (state) {
                return GestureDetector(
                  onTap: () {
                    citaBloc.add(
                      CitaEvent.getCitas(
                        CitaRequestViewModel(
                          doctorId: doctorSelected?.id ?? 0,
                          ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                          fechaHoraCita: DateTime.now(),
                        ),
                      ),
                    );
                  },
                  child: const SizedBox.shrink(),
                );
              },
              loading: (state) {
                // loaderCubit.show();
                return const Center(child: CircularProgressIndicator());
              },
              citaLoaded: (state) {
                // loaderCubit.hidden();
                return CitasGroupedByHourAtencionDoctor(
                  citas: state.citas,
                  onAdd: (hora, horaString) {
                    context.read<CitaCreateBloc>().add(CitaCreateEvent.citaPreCreateLocal(doctorSelected, dateSelected, hora, horaString));
                    Navigator.pushNamed(
                      context,
                      Routes.base_asistenteRecepcion + Routes.cita_add,
                    );
                  },
                  onBlock: (hora) {
                    return CitaOcupadaCreateViewModel(doctorId: doctorSelected!.id, fechaHoraCita: dateSelected.copyWith(hour: hora));
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
