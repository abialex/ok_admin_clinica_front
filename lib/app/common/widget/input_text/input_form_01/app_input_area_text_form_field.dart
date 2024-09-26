// ignore_for_file: must_be_immutable

import 'package:admin_clinica_front/app/common/widget/input_text/input_form_01/base_text_form_field.dart';
import 'package:flutter/material.dart';

class AppInputTextAreaFormField extends StatelessWidget {
  AppInputTextAreaFormField({
    required this.controller,
    this.prefixIcon,
    this.sufixIcon,
    this.placeHolderText,
    this.label,
    super.key,
  });
  TextEditingController controller;
  Widget? prefixIcon;
  Widget? sufixIcon;
  String? placeHolderText;
  String? label;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 656, minWidth: 200),
      child: CustomTextFormField(
        maxLines: 5,
        controller: controller,
        label: label ?? '',
        placeholder: placeHolderText ?? '',
        sufixIcon: const SizedBox.shrink(),
      ),
    );
  }
}
