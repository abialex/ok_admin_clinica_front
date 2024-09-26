// ignore_for_file: prefer_const_constructors

import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/dominio/entities/estado_cita.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:flutter/material.dart';

class AppTimeLine extends StatelessWidget {
  final List<EstadoCita> itemList;
  final EstadoCita itemSelected;
  final double estadoPercent;
  const AppTimeLine({
    super.key,
    required this.itemList,
    required this.itemSelected,
    required this.estadoPercent,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // alignment: Alignment.center,
      padding: const EdgeInsets.only(bottom: 15, left: 0),
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 19.25),
            height: 40,
            child: LinearProgressIndicator(
              value: estadoPercent,
              color: AppConstColors.slg01,
              backgroundColor: AppConstColors.lightGray,
            ),
          ),
          Positioned.fill(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(itemList.length, (index) {
                // final item = itemList[index];
                final indexSelected = itemList.indexWhere((element) => element == itemSelected);
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(
                      backgroundColor: indexSelected >= index ? AppConstColors.slg01 : AppConstColors.lightGray,
                      maxRadius: 12,
                      child: indexSelected >= index
                          ? Icon(
                              Icons.check,
                              size: 14,
                            )
                          : AppTextGlobal.lightText(text: (index + 1).toString(), colorText: AppConstColors.white, fontSize: 11),
                    ),
                    Positioned(
                      bottom: -15,
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
