import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PageBaseDesktop extends StatelessWidget {
  final Color backgroundColor;
  final Widget? headerWidget;
  final Widget? bodyWidget;
  final Widget? footerWidget;
  const PageBaseDesktop({
    super.key,
    this.backgroundColor = AppColors.lightGray,
    this.headerWidget,
    this.bodyWidget,
    this.footerWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: backgroundColor,
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            child: Column(
              children: [
                headerWidget == null
                    ? const SizedBox.shrink()
                    : Container(
                        height: 60,
                        color: Colors.limeAccent[100],
                        child: Padding(
                          padding: const EdgeInsets.all(0),
                          child: headerWidget!,
                        ),
                      ),
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
          ),
        ),
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
