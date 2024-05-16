import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/custom_multi_select.dart';
import 'package:flutter/material.dart';

class MultiSelectForm<T> extends FormField<List<MultiSelectItem<T>>> {
  MultiSelectForm({
    required this.contexts,
    required this.items,
    required this.itemBuilder,
    required this.validatorParent,
    super.key,
    this.onSelect,
    List<MultiSelectItem<T>>? itemsSelected,
  }) : super(
          initialValue: itemsSelected ?? [],
          validator: validatorParent,
          builder: (FormFieldState<List<MultiSelectItem<T>>> state) {
            List<MultiSelectItem<T>> listSelect = state.value ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(5),
                    border: state.hasError ? Border.all(color: AppColors.redAccent) : null,
                  ),
                  child: MultiSelect<T>(
                    items: items,
                    itemBuilder: itemBuilder,
                    onSelect: (p0) {
                      listSelect = p0;
                      state.didChange(listSelect); // Actualiza el estado del FormField
                    },
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 11),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(color: Colors.red),
                    ),
                  ),
              ],
            );
          },
        );

  final List<MultiSelectItem<T>> items;
  final Widget Function(
    BuildContext context,
    T item,
    bool isSelect,
  ) itemBuilder;
  final void Function(List<MultiSelectItem<T>>)? onSelect;
  final BuildContext contexts;
  final String? Function(List<MultiSelectItem<T>>?)? validatorParent;
}
