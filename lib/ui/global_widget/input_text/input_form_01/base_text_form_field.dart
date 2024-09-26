// ignore_for_file: must_be_immutable, lines_longer_than_80_chars, inference_failure_on_function_return_type

import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    required this.controller,
    this.placeholder = '',
    this.label = '',
    this.validator,
    this.onChanged,
    this.obscureText = false,
    this.enable = true,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.keyboardType = TextInputType.text,
    this.inputFormatters,
    this.sufixIcon,
    this.prefixIcon,
    this.onTap,
    this.readOnly = false,
    this.maxLines = 1,
    super.key,
  });

  TextEditingController controller;
  String placeholder;
  String label;
  ValueChanged<String>? onChanged;
  FormFieldValidator<String>? validator;
  bool obscureText;
  bool enable;
  AutovalidateMode autoValidateMode;
  Widget? sufixIcon;
  Widget? prefixIcon;
  TextInputType? keyboardType;
  List<TextInputFormatter>? inputFormatters;
  Function()? onTap;
  bool readOnly;
  int maxLines;

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
                child: TextFormField(
                  maxLines: maxLines,
                  enabled: enable,
                  controller: controller,
                  validator: validator,
                  onChanged: onChanged,
                  obscureText: obscureText,
                  autovalidateMode: autoValidateMode,
                  keyboardType: keyboardType,
                  inputFormatters: inputFormatters,
                  onTap: onTap,
                  readOnly: readOnly,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: AppConstColors.white,
                    hintText: placeholder,
                    contentPadding: const EdgeInsets.only(
                      top: 5,
                      bottom: 15,
                      left: 10,
                      right: 10,
                    ),
                    floatingLabelAlignment: FloatingLabelAlignment.start,
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    alignLabelWithHint: true,
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
                      color: AppConstColors.darkGray,
                    ),
                    floatingLabelStyle: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: !enable ? Colors.black54 : AppConstColors.primary,
                    ),
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
                    prefixIcon: prefixIcon,
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
