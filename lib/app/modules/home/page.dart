import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/service/doctor_api.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_construccion.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:admin_clinica_front/app/modules/home/bloc/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget with ResponsiveWidgetMixin {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final homeBloc = context.read<HomeBloc>();
    return BlocBuilder<HomeBloc, HomeState>(
      bloc: homeBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      title: "HOME",
      bodyWidget: Center(child: ConstruccionAnimated()),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final navbarCubit = context.read<NavigatorCubit>();
    return PageBasePhone(
        headerWidget: const HeaderMobile(
          title: "HOME",
        ),
        bodySliver: SliverToBoxAdapter(
          child: Column(
            children: [
              if (navbarCubit.state.modulesList.isNotEmpty)
                GridView.builder(
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  itemCount: navbarCubit.state.modulesList.length - 1,
                  itemBuilder: (context, index) {
                    var indexHome = navbarCubit.state.modulesList.indexWhere((element) => element.titulo == "Home");
                    int adjustedIndex = index >= indexHome ? index + 1 : index; // Ajusta el índice para omitir el segundo elemento

                    final item = navbarCubit.state.modulesList[adjustedIndex];
                    if (item.titulo == "Home") {
                      return null;
                    }
                    return Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(2.5),
                          child: AppTextGlobal.labelMediumText(
                            text: item.titulo.toUpperCase(),
                            colorText: AppConstColors.grey,
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              context.read<NavigatorCubit>().updateIndexDelay(adjustedIndex);
                              Navigator.pushReplacementNamed(context, item.routePage);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: const EdgeInsets.all(10),
                              decoration: const BoxDecoration(
                                color: AppConstColors.slgPrincipal,
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // Positioned(
                                  //   right: 0,
                                  //   bottom: 0,
                                  //   child: Icon(
                                  //     item.icon,
                                  //     size: 40,
                                  //   ),
                                  // ),
                                  Positioned(
                                    left: 15,
                                    right: 15,
                                    child: FittedBox(
                                      child: Icon(
                                        item.icon,
                                        color: AppConstColors.white,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15,
                    crossAxisSpacing: 15,
                  ),
                ),
              AppBox.h20,
              Container(
                child: AppTextGlobal.labelLargeText(text: "."),
              )
            ],
          ),
        ));
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ss"),
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
