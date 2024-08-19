import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/custom_multi_select.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class MultiSelectForm<T> extends FormField<List<MultiSelectItem<T>>> {
  MultiSelectForm({
    required this.contexts,
    required this.items,
    required this.itemBuilder,
    required this.validatorParent,
    this.isMultiSelect = true,
    super.key,
    this.onSelect,
    List<MultiSelectItem<T>>? itemsSelected,
  }) : super(
          initialValue: itemsSelected ?? [],
          validator: validatorParent,
          builder: (FormFieldState<List<MultiSelectItem<T>>> state) {
            List<MultiSelectItem<T>> listSelect = state.value ?? [];
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  decoration: BoxDecoration(
                    color: AppColors.lightGray,
                    borderRadius: BorderRadius.circular(5),
                    border: state.hasError ? Border.all(color: AppColors.redAccent) : null,
                  ),
                  child: MultiSelect<T>(
                    isMultiSelect: isMultiSelect,
                    items: items,
                    itemBuilder: itemBuilder,
                    itemsSelected: itemsSelected,
                    onSelect: (p0) {
                      listSelect = p0;
                      state.didChange(listSelect); // Actualiza el estado del FormField
                      onSelect?.call(p0);
                    },
                  ),
                ),
                if (state.hasError)
                  Padding(
                    padding: const EdgeInsets.only(top: 5, left: 11),
                    child: Text(
                      state.errorText!,
                      style: const TextStyle(color: AppColors.redAccent, fontSize: 12),
                    ).animate().shake(rotation: 0.02),
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
  final bool isMultiSelect;
}
