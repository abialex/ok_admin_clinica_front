import 'package:admin_clinica_front/app/common/models/usuario/user_response_data_model.dart';
import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/config/routes/router.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:admin_clinica_front/app/data/repository/storage/ilocal_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageBaseDesktop extends StatelessWidget {
  final Color backgroundColor;
  final String? title;
  final Widget? bodyWidget;
  final Widget? footerWidget;
  final Function()? onTapFloating;
  final bool showMenu;
  const PageBaseDesktop({
    super.key,
    this.backgroundColor = AppConstColors.lightGray,
    this.title,
    this.bodyWidget,
    this.footerWidget,
    this.onTapFloating,
    this.showMenu = true,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AppTextGlobal.labelLargeText(text: title ?? "Título", colorText: AppConstColors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(
              Icons.exit_to_app,
              color: AppConstColors.white,
              size: 30,
            ),
          )
        ],
        centerTitle: true,
        backgroundColor: AppConstColors.slgPrincipal,
        leading: showMenu ? _buildIconMenu() : const SizedBox.shrink(),
      ),
      floatingActionButton: onTapFloating != null
          ? FloatingActionButton(
              backgroundColor: AppConstColors.slg01,
              onPressed: onTapFloating,
              child: const Icon(Icons.add),
            )
          : null,
      drawer: const AppDrawerDesktop(),
      backgroundColor: backgroundColor,
      bottomNavigationBar: footerWidget,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: bodyWidget,
      ),
    );
  }

  Builder _buildIconMenu() {
    return Builder(
      builder: (BuildContext context) {
        return IconButton(
          icon: const Icon(
            Icons.menu,
            color: AppConstColors.white,
          ),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
        );
      },
    );
  }
}

class AppDrawerDesktop extends StatelessWidget {
  const AppDrawerDesktop({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final navbarCubit = context.read<NavigatorCubit>();
    // final themeCubit = context.watch<ThemeCubit>();
    final auth = locator<ILocalRepository>();
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppConstColors.slgPrincipal,
            ),
            child: DrawerHeader(
              child: FutureBuilder<UserResponseDataModel?>(
                future: auth.getUsuario(),
                builder: (BuildContext context, AsyncSnapshot<UserResponseDataModel?> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AppTextGlobal.labelLightText(
                          text: snapshot.data?.nombres.toUpperCase() ?? "- -",
                          fontSize: 16,
                          colorText: AppConstColors.slg01,
                        ),
                        AppTextGlobal.labelSmallText(
                          text: "${snapshot.data?.rol ?? "- -"}  ",
                          fontWeight: FontWeight.w600,
                          colorText: AppConstColors.slg01,
                        ),
                      ],
                    );
                  }
                },
              ),
            ),
          ),
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, i) => AppBox.h12,
                itemCount: navbarCubit.state.modulesList.length + 1,
                separatorBuilder: (_, index) {
                  final item = navbarCubit.state.modulesList[index];
                  return ListTile(
                    autofocus: navbarCubit.state.delayIndex == index,
                    leading: Icon(item.icon),
                    title: Text(item.titulo),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, context.read<NavigatorCubit>().state.modulesList[index].routePage);
                      context.read<NavigatorCubit>().updateIndexDelay(index);

                      // Navegar a HomeScreen
                    },
                  );
                }),
          ),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text("Cerrar Sesión"),
            onTap: () async {
              final navbarCubit = context.read<NavigatorCubit>();
              navbarCubit.updateIndexDelay(1);
              Navigator.pushReplacementNamed(context, Routes.login);
              await auth.clearSession();

              // Navegar a HomeScreen
            },
          )
        ],
      ),
    );
  }
}

class ConfigurationBody {
  final Color backgroundColor;
  final EdgeInsets padding;

  // double get perimetro => padding + heightScreen;

  ConfigurationBody({
    required this.backgroundColor,
    required this.padding,
  });
}
