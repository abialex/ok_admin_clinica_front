// ignore_for_file: lines_longer_than_80_chars

import 'package:admin_clinica_front/app/common/cubits/index_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/checkbox/app_check_box_label_blue_r_10.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ItemCustom<T> {
  ItemCustom({
    required this.id,
    required this.itemName,
    required this.item,
  });
  final int id;
  final String itemName;
  final T item;
}

class CheckBoxListCubitWidget<T> extends StatelessWidget {
  const CheckBoxListCubitWidget({
    required this.items,
    this.autoCubit = true,
    super.key,
    this.paddingBetweenSteps = 60,
    this.onChanged,
    this.isRequiredSelected = false,
    this.fontSize,
  });
  final void Function(int?, String?, T?)? onChanged;
  final List<ItemCustom<T>> items;
  final double paddingBetweenSteps;
  final bool autoCubit;
  final bool isRequiredSelected;
  final double? fontSize;

  @override
  Widget build(BuildContext context) {
    final navigationCubitParent = context.read<IndexCubit?>();
    assert(
      autoCubit || navigationCubitParent != null,
      'Could not find Cubit for $CheckBoxListCubitWidget  when autoCubit is False',
    );
    return BlocProvider(
      create: (context) => autoCubit ? IndexCubit() : navigationCubitParent!,
      child: BlocBuilder<IndexCubit, int>(
        builder: (context, state) {
          final navigationCubit = context.read<IndexCubit>();
          return Column(
            children: [
              Wrap(
                // mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  items.length,
                  (index) {
                    return SizedBox(
                      child: Container(
                        // alignment: Alignment.center,
                        padding: const EdgeInsets.all(7.5),
                        child: GestureDetector(
                          onTap: () {
                            navigationCubit.goto(index);
                            if (!isRequiredSelected) {
                              if (state == index) {
                                //si presiona la misma casilla, desmarca
                                navigationCubit.goto(-1);
                                onChanged?.call(
                                  null,
                                  null,
                                  null,
                                );
                                return;
                              }
                            }
                            onChanged?.call(
                              items[index].id,
                              items[index].itemName,
                              items[index].item,
                            );
                          },
                          child: AbsorbPointer(
                            child: CheckBoxLabelBlueR10(
                              value: state == index,
                              onChanged: () {},
                              text: items[index].itemName,
                              fontSize: fontSize,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              // AppBox.h10,
            ],
          );
        },
      ),
    );
  }
}
