import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/service/doctor_api.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/common/widget/app_loader_mini.dart';
import 'package:admin_clinica_front/app/common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/app/modules/doctor/bloc/doctor_update_bloc.dart';
import 'package:admin_clinica_front/app/modules/doctor/widget/doctor_card_desktop.dart';
import 'package:admin_clinica_front/app/modules/doctor/widget/doctor_asistente_administrador_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorListAsistenteAdministradorPage extends StatelessWidget with ResponsiveWidgetMixin {
  const DoctorListAsistenteAdministradorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    context.read<DoctorListBloc>().add(GetDoctors());

    return PageBaseDesktop(
      onTapFloating: () {
        Navigator.pushNamed(
          context,
          Routes.base_asistenteRecepcion + Routes.doctor_add,
        );
      },
      title: "DOCTORES",
      bodyWidget: BlocBuilder<DoctorListBloc, DoctorListState>(
        builder: (context, state) {
          return AnimatedSwitcher(
            duration: 0.5.seconds,
            child: state.map(
              initial: (sst) {
                return const SizedBox.shrink();
              },
              loading: (sst) {
                return const Center(
                  child: AppLoaderMini(
                    height: 50,
                  ),
                );
              },
              doctorsLoaded: (stt) {
                if (stt.doctors.isEmpty) {
                  return const Center(
                    child: Text("Agregue un doctor"),
                  );
                }
                return Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Container(
                          alignment: Alignment.center,
                          child: Wrap(
                              spacing: 10,
                              // crossAxisAlignment: WrapCrossAlignment.end,
                              // runAlignment: WrapAlignment.start,
                              runSpacing: 10,
                              children: List.generate(
                                stt.doctors.length,
                                (index) {
                                  final item = stt.doctors[index];
                                  return SizedBox(
                                    width: 500,
                                    child: DeskDoctorsCard(
                                        onUpdate: (doctorId) {
                                          final doctorUpdateBloc = context.read<DoctorUpdateBloc>();
                                          doctorUpdateBloc.add(DoctorUpdateEvent.getDoctor(doctorId));
                                          Navigator.pushNamed(context, Routes.base_asistenteRecepcion + Routes.doctor_update);
                                        },
                                        doctor: item),
                                  );
                                },
                              )),
                        ),
                      ),
                    ),
                  ],
                );
              },
              failure: (stt) {
                return SliverToBoxAdapter(child: Text(stt.error));
              },
            ),
          );
        },
      ),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    context.read<DoctorListBloc>().add(GetDoctors());

    return PageBasePhone(
      floatingWidget: FloatingActionButton(
        backgroundColor: AppConstColors.slg01,
        foregroundColor: AppConstColors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.base_asistenteRecepcion + Routes.doctor_add,
          );
        },
        mini: true,
        child: const Icon(Icons.add),
      ),
      headerWidget: const HeaderMobile(
        title: "DOCTORES",
      ),
      bodySliver: SliverToBoxAdapter(
        child: BlocBuilder<DoctorListBloc, DoctorListState>(
          builder: (context, state) {
            return AnimatedSwitcher(
              duration: 0.5.seconds,
              child: state.map(
                initial: (sst) {
                  return const SizedBox.shrink();
                },
                loading: (sst) {
                  return const Center(
                    child: AppLoaderMini(
                      height: 50,
                    ),
                  );
                },
                doctorsLoaded: (stt) {
                  if (stt.doctors.isEmpty) {
                    return const Center(
                      child: Text("Agregue un doctor"),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: stt.doctors.length,
                    itemBuilder: (context, index) {
                      final item = stt.doctors[index];
                      return DoctorAsistenteAdministradorCard(
                          onUpdate: (doctorId) {
                            Navigator.pop(context);
                            final doctorUpdateBloc = context.read<DoctorUpdateBloc>();
                            doctorUpdateBloc.add(DoctorUpdateEvent.getDoctor(doctorId));
                            Navigator.pushNamed(context, Routes.base_asistenteRecepcion + Routes.doctor_update);
                          },
                          doctor: item);
                    },
                  );
                },
                failure: (stt) {
                  return SliverToBoxAdapter(child: Text(stt.error));
                },
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    final dialog = context.read<DialogMessageCubit>();
    return Scaffold(
      backgroundColor: AppConstColors.cyan,
      appBar: AppBar(
        backgroundColor: AppConstColors.blueAccent,
        title: const Text("ss"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // const DialogCubitPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed :',
              ),
              Text(
                '3213123',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = locator<DoctorApi>();
          final storage = locator<ILocalRepository>();
          storage.saveToken("token 1f9579b30ba59f8dc25a853528d3adac2609f69d");
          final result = await api.getDoctorsByIdUbicacionFromAsistente();
          result.fold((left) => print(left), (right) => print(right));
          dialog.showCustomAlert(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
