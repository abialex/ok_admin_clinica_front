// ignore_for_file: must_be_immutable
import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/cita_card.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/doctor_carrusel_card.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../core/router.dart';
import '../../../global_widget/page/page_mixin_base.dart';
import '../bloc/cita_bloc.dart';

class CitaListAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaListAsistenteRecepcionPage({super.key});
  DateTime dateSelected = DateTime.now();
  @override
  Widget build(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();
    final usuarioBloc = context.read<UsuarioBloc>();
    if (usuarioBloc.state.doctorIdSelected != null) {
      citaBloc.add(
        CitaEvent.getCitas(
          CitaRequestViewModel(
            doctorId: usuarioBloc.state.doctorIdSelected!,
            ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
            fechaHoraCita: DateTime.now(),
          ),
        ),
      );
    }
    return BlocBuilder<CitaBloc, CitaState>(
      bloc: citaBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      headerWidget: Text("dESKPTOP"),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();
    final doctorBloc = context.read<DoctorListBloc>();
    final usuarioBloc = context.read<UsuarioBloc>();

    return PageBasePhone(
      onReachedTop: () {
        doctorBloc.add(GetDoctors());
      },

      maxEntend: 195,
      minEntend: 195,
      floatingWidget: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.slg01,
        foregroundColor: AppColors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.base_asistenteRecepcion + Routes.cita_add,
          );
        },
        child: const Icon(Icons.add),
      ),
      title: "Cita Page PADRE",
      headerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: HeaderMobile(
              subTitle: "Doctor",
              title: "CITAS",
            ),
          ),
          // AppBox.h2,
          SizedBox(
            height: 60,
            child: BlocBuilder<DoctorListBloc, DoctorListState>(
              builder: (context, state) {
                return state.map(
                  initial: (stt) {
                    doctorBloc.add(GetDoctors());
                    return const SizedBox.shrink();
                  },
                  loading: (stt) {
                    return const SizedBox.shrink();
                  },
                  doctorsLoaded: (stt) {
                    return DoctorCarousel(
                      doctorIdInitialSelected: usuarioBloc.state.doctorIdSelected,
                      doctors: stt.doctors,
                      onChanged: (doctor) {
                        citaBloc.add(
                          CitaEvent.getCitas(
                            CitaRequestViewModel(
                              doctorId: doctor.id,
                              ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                              fechaHoraCita: dateSelected,
                            ),
                          ),
                        );
                        usuarioBloc.add(UsuarioEvent.setupDoctorIdSelected(doctor.id));
                      },
                    );
                  },
                  failure: (stt) {
                    return Text(stt.error);
                  },
                );
              },
            ),
          ),
          SizedBox(
            height: 35,
            child: Row(
              children: [
                Text("data"),
                Expanded(
                  child: Transform.scale(
                    scale: 0.95,
                    child: CupertinoDatePicker(
                      // key: UniqueKey(),
                      initialDateTime: dateSelected,
                      onDateTimeChanged: (value) {
                        dateSelected = value;
                        if (usuarioBloc.state.doctorIdSelected != null) {
                          citaBloc.add(
                            CitaEvent.getCitas(
                              CitaRequestViewModel(
                                doctorId: usuarioBloc.state.doctorIdSelected!,
                                ubicacionesId: usuarioBloc.state.usuario?.ubicaciones ?? [],
                                fechaHoraCita: dateSelected,
                              ),
                            ),
                          );
                        }
                      },
                      dateOrder: DatePickerDateOrder.ymd,
                      mode: CupertinoDatePickerMode.date,
                      use24hFormat: true,
                      minimumYear: 2023,
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      dateSelected = DateTime.now();
                    },
                    child: Text("data")),
              ],
            ),
          ),
          AppBox.h10,
        ],
      ),
      bodySliver: SliverToBoxAdapter(
        child: citaBloc.state.map(
          initial: (state) {
            // citaBloc.add(CitaEvent.getCitas(CitaRequestViewModel(doctorId: 1, ubicacionId: 1, fechaHoraCita: DateTime.now())));
            return const SizedBox.shrink();
          },
          loading: (state) {
            return const Text("loading");
          },
          citaLoaded: (state) {
            return CitasGroupedByHour(
              citas: state.citas,
            );
          },
          failure: (state) {
            return Text(state.error);
          },
        ),
      ),

      //  SliverList(
      //   delegate: SliverChildBuilderDelegate(
      //     (context, index) => Text("s"),
      //     childCount: 5,
      //   ),
      // ),
    );
  }

  // Container _buildError(AsyncSnapshot<int?> snapshot) {
  //   return Container(
  //       margin: const EdgeInsets.all(10),
  //       padding: const EdgeInsets.all(10),
  //       decoration: const BoxDecoration(
  //         color: AppColors.red,
  //         borderRadius: BorderRadius.all(
  //           Radius.circular(10),
  //         ),
  //       ),
  //       child: Text(
  //         'Error: ${snapshot.error}',
  //         style: const TextStyle(color: AppColors.white),
  //       ));
  // }

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
