import 'package:admin_clinica_front/ui/core/router.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/global_widget/text/app_text_font_normal.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../global_widget/bottomSheet/button_sheet.dart';
import '../../../global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import '../../../global_widget/page/page_mixin_base.dart';
import '../../../global_widget/text/app_text_font_weight.dart';

class DoctorListAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  const DoctorListAsistenteRecepcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final dialogCubit = context.read<DialogMessageCubit>();
    final doctorBloc = context.read<DoctorBloc>();
    return BlocBuilder<DoctorBloc, DoctorState>(
      bloc: doctorBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      headerWidget: Text("Sin implementar"),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final doctorbloc = context.read<DoctorBloc>();
    return PageBasePhone(
      floatingWidget: FloatingActionButton(
        backgroundColor: AppColors.blueSecondary,
        foregroundColor: AppColors.white,
        onPressed: () {
          Navigator.pushNamed(
            context,
            Routes.base_asistenteRecepcion + Routes.doctor_add,
          );
        },
        child: const Icon(Icons.add),
      ),
      headerWidget: const Text("Asistente Recepcion"),
      title: "Doctor page",
      bodySliver: doctorbloc.state.map(
        initial: (sst) {
          doctorbloc.add(GetDoctors());
          return const SliverToBoxAdapter(child: SizedBox.shrink());
        },
        loading: (sst) {
          return const SliverToBoxAdapter(child: Text("cargando"));
        },
        doctorsLoaded: (stt) {
          return SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = stt.doctors[index];

                return GestureDetector(
                  onTap: () {
                    ButtonSheet.showCustomBottomSheet<DoctorsViewModel>(
                      context,
                      widgetBuilder: (context) {
                        return Column(
                          children: [
                            Container(
                              height: 5.0,
                              width: 50.0,
                              margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                              decoration: const BoxDecoration(
                                color: AppColors.dark,
                                borderRadius: BorderRadius.all(Radius.circular(2.5)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                // const AppTextFontWeight(text: "Doctor:"),
                                AppTextFontWeight(text: "${item.nombres} ${item.apellidos}"),
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
                                  decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                  child: const Row(
                                    children: [
                                      Icon(
                                        Icons.circle,
                                        color: AppColors.blueSecondary,
                                        size: 15,
                                      ),
                                      AppTextFontNormal(
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
                      color: AppColors.lightGray,
                      borderRadius: BorderRadius.all(
                        Radius.circular(15),
                      ),
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const AppTextFontWeight(
                              text: "Nombres",
                            ),
                            AppTextFontNormal(text: item.nombres)
                          ],
                        ),
                        Row(
                          children: [
                            const AppTextFontWeight(
                              text: "Apellidos",
                            ),
                            AppTextFontNormal(text: item.apellidos)
                          ],
                        ),
                        Row(
                          children: [
                            const AppTextFontWeight(
                              text: "Username",
                            ),
                            AppTextFontNormal(text: item.username)
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
        // ubicacionLoaded: (value) {
        //   return
        // },
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    final dialog = context.read<DialogMessageCubit>();
    return Scaffold(
      backgroundColor: AppColors.cyan,
      appBar: AppBar(
        backgroundColor: AppColors.blueAccent,
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
          dialog.showDialog(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
