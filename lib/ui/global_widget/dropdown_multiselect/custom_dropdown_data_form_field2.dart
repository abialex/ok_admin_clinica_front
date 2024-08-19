// ignore_for_file: must_be_immutable, inference_failure_on_function_return_type, lines_longer_than_80_chars

import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class CustomDropdownDataFormField2<T> extends StatelessWidget {
  CustomDropdownDataFormField2({
    required this.items,
    required this.displayFunction,
    this.placeholder = '',
    this.label = '',
    this.validator,
    this.onChanged,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.defaultValue,
    super.key,
  });

  final List<T> items;
  String placeholder;
  String label;
  final String Function(T) displayFunction;
  final T? defaultValue;
  Function(T?)? onChanged;
  FormFieldValidator<T>? validator;
  AutovalidateMode autoValidateMode;
  Widget? sufixIcon;

  @override
  Widget build(BuildContext context) {
    final selectedValue = defaultValue != null && items.contains(defaultValue) ? defaultValue : null;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.blueSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField2<T>(
                  isExpanded: true,
                  isDense: false,
                  validator: validator,
                  onChanged: onChanged,
                  autovalidateMode: autoValidateMode,
                  value: selectedValue,
                  items: items
                      .map(
                        (item) => DropdownMenuItem<T>(
                          value: item,
                          child: Text(
                            displayFunction(item),
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: AppColors.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  dropdownStyleData: DropdownStyleData(
                    maxHeight: 150,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                  ),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: ' $placeholder',
                    contentPadding: EdgeInsets.zero,
                    counterText: '',
                    hintStyle: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: AppColors.grey,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppColors.grey,
                      ),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: Colors.red,
                      ),
                    ),
                    suffixIcon: sufixIcon,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
