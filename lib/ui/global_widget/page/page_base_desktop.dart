import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/cubits/theme_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/custom_navbar_navigation/cubit/navigator_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageBaseDesktop extends StatelessWidget {
  final Color backgroundColor;
  final String? title;
  final Widget? bodyWidget;
  final Widget? footerWidget;
  const PageBaseDesktop({
    super.key,
    this.backgroundColor = AppColors.lightGray,
    this.title,
    this.bodyWidget,
    this.footerWidget,
  });

  @override
  Widget build(BuildContext context) {
    final navbarCubit = context.read<NavigatorCubit>();
    final themeCubit = context.watch<ThemeCubit>();

    return Scaffold(
      appBar: AppBar(
        title: AppTextGlobal.labelLargeText(text: title ?? "Título"),
        actions: [Text("click")],
        centerTitle: true,
      ),
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              decoration: const BoxDecoration(
                color: AppColors.slgPrincipal,
              ),
              child: DrawerHeader(
                child: Text(
                  'Asistente recepción',
                  style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 20),
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
                    print(index);
                    return ListTile(
                      autofocus: navbarCubit.state.delayIndex == index,
                      leading: Icon(item.icon),
                      title: Text(item.titulo),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.pushReplacementNamed(context, context.read<NavigatorCubit>().state.modulesList[index].routePage);
                        // Navegar a HomeScreen
                      },
                    );
                  }),
            ),
            ListTile(
              leading: Icon(Icons.abc),
              title: Text("item.titulo"),
              onTap: () {
                themeCubit.toggle();

                // Navegar a HomeScreen
              },
            )
          ],
        ),
      ),
      backgroundColor: backgroundColor,
      body: Column(
        children: [
          bodyWidget == null
              ? const SizedBox.shrink()
              : Expanded(
                  flex: 30,
                  child: Container(
                    alignment: Alignment.center,
                    //color: Colors.limeAccent[100],
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: bodyWidget!,
                  ),
                ),
          footerWidget == null
              ? const SizedBox.shrink()
              : Container(
                  height: 70,
                  alignment: Alignment.center,
                  //color: Colors.deepPurpleAccent[100],
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: footerWidget!,
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
