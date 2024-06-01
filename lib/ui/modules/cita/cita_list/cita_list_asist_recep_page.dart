// ignore_for_file: must_be_immutable
import 'dart:async';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/cubits/count_isolate_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/date/app_date_picker_cupertino.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/cita_card.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/doctor_carrusel_card.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injections.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../core/router.dart';
import '../../../global_widget/page/page_mixin_base.dart';
import '../bloc/cita_bloc.dart';

class CitaListAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaListAsistenteRecepcionPage({super.key});
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
    return const PageBaseDesktop(
      headerWidget: Text("dESKPTOP"),
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
      maxEntend: 195,
      minEntend: 195,
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
                  title: "CITAS",
                ),
              ),
              // AppBox.h2,
              BlocProvider(
                create: (context) => DoctorListBloc(),
                child: BlocBuilder<DoctorListBloc, DoctorListState>(
                  builder: (context, state) {
                    final doctorBloc = context.read<DoctorListBloc>();
                    return SizedBox(
                      height: 60,
                      child: state.map(
                        initial: (stt) {
                          doctorBloc.add(GetDoctors());
                          return const SizedBox.shrink();
                        },
                        loading: (stt) {
                          return const Center(child: CircularProgressIndicator());
                        },
                        doctorsLoaded: (stt) {
                          doctorSelected = usuarioBloc.state.doctorIdSelected;
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
                            child: DoctorCarousel(
                              doctorIdInitialSelected: doctorSelected?.id,
                              doctors: stt.doctors,
                              onChanged: (doctor) {
                                timerStart(timerCubit, () {
                                  doctorSelected = doctor;
                                  usuarioBloc.setDoctorSelected(doctor);
                                  if (!doctor.isActive) {
                                    context.read<CitaBloc>().add(CitaEvent.invalidCita("Este doctor(a) está inactivo"));
                                    return;
                                  }
                                  context.read<CitaBloc>().add(CitaEvent.getCitas(
                                        CitaRequestViewModel(
                                          doctorId: doctor.id,
                                          ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                          fechaHoraCita: dateSelected,
                                        ),
                                      ));
                                  context.read<CountIsolateCubit>().resetExternal();
                                });
                              },
                            ),
                          );
                        },
                        failure: (stt) {
                          return Text(stt.error);
                        },
                      ),
                    );
                  },
                ),
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
                            if (doctorSelected!.isActive) {
                              timerStart(timerCubit, () {
                                citaBloc.add(CitaEvent.getCitas(
                                  CitaRequestViewModel(
                                    doctorId: doctorSelected!.id,
                                    ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                    fechaHoraCita: value,
                                  ),
                                ));
                                context.read<CountIsolateCubit>().resetExternal();
                              });
                            }
                          }
                        },
                      ),
                    ),
                    Positioned(
                      left: 0,
                      bottom: 0,
                      top: 0,
                      child: BlocBuilder<CountIsolateCubit, int>(
                        builder: (context, state) {
                          return Stack(
                            children: [
                              const Icon(
                                Icons.restart_alt,
                                size: 32,
                                color: AppColors.grey,
                              ),
                              Positioned.fill(
                                child: Container(
                                  alignment: Alignment.center,
                                  child: AppTextGlobal.lightText(
                                    text: "$state",
                                    fontSize: 10,
                                    colorText: AppColors.grey,
                                  ),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    )
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
                return CitasGroupedByHour(
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
