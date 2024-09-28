import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/common/widget/app_loader_mini.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../config/app_dependecy_injection.dart';
import '../../../../common/constants/app_const_colors.dart';
import '../../../../common/service/doctor_api.dart';
import '../../../../data/repository/storage/ilocal_repository.dart';
import '../../../../common/widget/bottomSheet/button_sheet.dart';
import '../../../../common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import '../../../../common/widget/page/page_mixin_base.dart';

class DoctorListAdminPage extends StatelessWidget with ResponsiveWidgetMixin {
  const DoctorListAdminPage({super.key});

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
    return PageBaseDesktop(
      title: "DOCTORES",
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
                            AppTextGlobal.lightText(text: item.username)
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
