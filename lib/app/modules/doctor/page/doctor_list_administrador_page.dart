import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/widget/bottomSheet/button_sheet.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/common/widget/app_loader_mini.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/app/modules/doctor/bloc/doctor_update_bloc.dart';
import 'package:admin_clinica_front/app/modules/doctor/widget/doctor_card_desktop.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorListAdministradorPage extends StatelessWidget with ResponsiveWidgetMixin {
  const DoctorListAdministradorPage({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorBloc = context.read<DoctorListBloc>();
    return BlocBuilder<DoctorListBloc, DoctorListState>(
      bloc: doctorBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
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
                return Center(child: Text(stt.error));
              },
            ),
          );
        },
      ),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final doctorbloc = context.read<DoctorListBloc>();
    return PageBasePhone(
      floatingWidget: FloatingActionButton(
        backgroundColor: AppConstColors.blueSecondary,
        foregroundColor: AppConstColors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.base_asistenteRecepcion + Routes.doctor_add,
          );
        },
        child: const Icon(Icons.add),
      ),
      bodySliver: doctorbloc.state.map(
        initial: (stt) {
          doctorbloc.add(GetDoctors());
          return const SizedBox.shrink();
        },
        loading: (stt) {
          return const SliverToBoxAdapter(
              child: Center(
            child: AppLoaderMini(
              height: 50,
            ),
          ));
        },
        doctorsLoaded: (stt) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = stt.doctors[index];
                return GestureDetector(
                  onTap: () {
                    ButtonSheet.showCustomBottomSheet(
                      context,
                      widgetBuilder: (context) {
                        return Column(
                          children: [
                            Container(
                              height: 5.0,
                              width: 50.0,
                              margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                              decoration: const BoxDecoration(
                                color: AppConstColors.dark,
                                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // const AppTextFontWeight(text: "Doctor:"),
                                AppTextGlobal.lightText(text: "${item.nombres} ${item.apellidos}"),
                              ],
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(context, Routes.doctor_update);
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 5,
                                ),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    vertical: 10,
                                  ),
                                  decoration: const BoxDecoration(color: AppConstColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.circle,
                                        color: AppConstColors.blueSecondary,
                                        size: 15,
                                      ),
                                      AppTextGlobal.lightText(
                                        text: "Actualizar",
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    decoration: const BoxDecoration(
                      color: AppConstColors.lightGray,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            AppTextGlobal.labelLightText(
                              text: "Nombres",
                            ),
                            AppTextGlobal.lightText(text: item.nombres)
                          ],
                        ),
                        Row(
                          children: [
                            AppTextGlobal.labelLightText(
                              text: "Apellidos",
                            ),
                            AppTextGlobal.lightText(text: item.apellidos)
                          ],
                        ),
                        Row(
                          children: [
                            AppTextGlobal.labelLightText(
                              text: "Username",
                            ),
                            AppTextGlobal.lightText(text: item.username ?? 'sin user')
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
              childCount: stt.doctors.length,
            ),
          );
        },
        failure: (stt) {
          return SliverToBoxAdapter(child: Text(stt.error));
        },
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    // TODO: implement buildTablet for tablet devices
    return buildMobile(context);
  }
}
