// ignore_for_file: must_be_immutable, lines_longer_than_80_chars, inference_failure_on_function_return_type

import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

class CustomDropdownFormField extends StatelessWidget {
  CustomDropdownFormField({
    required this.items,
    this.placeholder = '',
    this.label = '',
    this.validator,
    this.onChanged,
    this.autoValidateMode = AutovalidateMode.disabled,
    super.key,
  });

  String placeholder;
  String label;
  Function(String?)? onChanged;
  FormFieldValidator<String>? validator;
  AutovalidateMode autoValidateMode;
  Widget? sufixIcon;
  List<String> items;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 14,
              color: AppConstColors.blueSecondary,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField(
                  isExpanded: true,
                  isDense: false,
                  validator: validator,
                  onChanged: onChanged,
                  autovalidateMode: autoValidateMode,
                  items: items
                      .map(
                        (item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.normal,
                              color: AppConstColors.dark,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                      .toList(),
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: AppConstColors.white,
                    hintText: placeholder,
                    contentPadding: EdgeInsets.zero,
                    //floatingLabelAlignment: FloatingLabelAlignment.start,
                    //floatingLabelBehavior: FloatingLabelBehavior.always,
                    //alignLabelWithHint: true,
                    counterText: '',
                    //labelStyle:const TextStyle(
                    //  backgroundColor: Colors.transparent,
                    //  color: AppConstColors.blueAccent,
                    //  fontSize: 18,
                    //  fontWeight: FontWeight.bold,
                    //),
                    hintStyle: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppConstColors.grey,
                    ),
                    //floatingLabelStyle: TextStyle(
                    //  fontSize: 16,
                    //  fontWeight: FontWeight.bold,
                    //  //color: !enable ? Colors.black54 : AppConstColors.primary,
                    //),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppConstColors.grey,
                      ),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppConstColors.grey,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppConstColors.grey,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: const BorderSide(
                        color: AppConstColors.grey,
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
