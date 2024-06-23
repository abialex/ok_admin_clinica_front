import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:flutter/material.dart';

class AppBottomModal {
  static showBottomModal(BuildContext context, {required Widget header, required Widget body}) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent, // Fondo transparente
      builder: (BuildContext context) {
        return Container(
          constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height) * 0.55,
          decoration: const BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Container(
                height: 5.0,
                width: 50.0,
                margin: const EdgeInsets.only(top: 10.0, bottom: 5.0),
                decoration: const BoxDecoration(
                  color: AppColors.dark,
                  borderRadius: BorderRadius.all(Radius.circular(2.5)),
                ),
              ),
              Container(
                alignment: Alignment.center,
                // color: OdebinColors.celeste_claro,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: header,
              ),
              AppBox.h20,
              Expanded(child: body

                  // CustomScrollView(
                  //   slivers: [
                  //     SliverList(
                  //       delegate: SliverChildBuilderDelegate(
                  //         (context, index) => Container(
                  //           padding: const EdgeInsets.symmetric(
                  //             vertical: 5,
                  //           ),
                  //           child: Container(
                  //             padding: const EdgeInsets.symmetric(
                  //               vertical: 10,
                  //             ),
                  //             decoration: const BoxDecoration(color: AppColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                  //             child: Row(
                  //               children: [
                  //                 const Icon(
                  //                   Icons.arrow_right,
                  //                   color: AppColors.blueAccent,
                  //                   size: 35,
                  //                 ),
                  //                 AppTextGlobal.lightText(text: " ControllerVentas"),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //         childCount: 10,
                  //       ),
                  //     ),
                  //   ],
                  // ),

                  ),
            ],
          ),
        );
      },
    );
  }
}
