// ignore_for_file: prefer_const_constructors

import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/data/entities/estado_cita.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTimeLineCitaMini extends StatelessWidget {
  final List<EstadoCita> itemList;
  final EstadoCita itemSelected;
  final double estadoPercent;
  const AppTimeLineCitaMini({
    super.key,
    required this.itemList,
    required this.itemSelected,
    required this.estadoPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 5, left: 0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            height: 22.5,
            child: LinearProgressIndicator(
              value: estadoPercent,
              color: AppConstColors.slg01,
              backgroundColor: AppConstColors.lightGray,
            ),
          ),
          Positioned.fill(
            // top: 2.5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(itemList.length, (index) {
                // final item = itemList[index];
                final indexSelected = itemList.indexWhere((element) => element == itemSelected);
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: 15,
                      padding: EdgeInsets.all(2.5),
                      child: Container(
                        decoration: BoxDecoration(shape: BoxShape.circle, color: indexSelected >= index ? AppConstColors.slg01 : AppConstColors.lightGray),
                      ),
                    ),
                    Positioned(
                      bottom: -5,
                      left: -20,
                      right: -20,
                      child: AppTextGlobal.lightText(
                        text: itemList[index].name,
                        colorText: indexSelected >= index ? AppConstColors.slg01 : AppConstColors.dark,
                        fontSize: 10,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    )
                  ],
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
