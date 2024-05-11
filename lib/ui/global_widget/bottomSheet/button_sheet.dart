import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/text/app_text_font_normal.dart';
import 'package:admin_clinica_front/ui/global_widget/text/app_text_font_weight.dart';
import 'package:flutter/material.dart';

class ButtonSheet {
  static void showCustomBottomSheet<T>(BuildContext context, {required Widget Function(BuildContext context) widgetBuilder}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Fondo transparente
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height) * 0.45,
          decoration: const BoxDecoration(
            color: AppColors.hintColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15.0),
              topRight: Radius.circular(15.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: widgetBuilder(context),
        );
      },
    );
  }
}

class instance extends StatelessWidget {
  const instance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          height: 5.0,
          width: 50.0,
          margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
          decoration: const BoxDecoration(
            color: AppColors.darkAppBar,
            borderRadius: BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
        Container(
          // color: OdebinColors.celeste_claro,
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 7,
                    child: AppTextFontWeight(
                      text: "Código ",
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: AppTextFontNormal(
                      text: "codigo",
                    ),
                  )
                ],
              ),
              // StyleUtils.widgetSpace5,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Expanded(
                    flex: 7,
                    child: AppTextFontNormal(
                      text: "Empresa",
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: AppTextFontNormal(
                      text: "codigo",
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        // StyleUtils.widgetSpace5,
        Expanded(
          child: CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) => Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                    ),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                      ),
                      decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_right,
                            color: AppColors.blueSecondary,
                            size: 35,
                          ),
                          AppTextFontNormal(
                            text: "sdasd",
                          ),
                        ],
                      ),
                    ),
                  ),
                  childCount: 5,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
