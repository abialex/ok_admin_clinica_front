import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_base.dart';
import 'package:flutter/material.dart';

class InputTextBuscar extends StatelessWidget {
  const InputTextBuscar({
    required this.hintText,
    required this.label,
    super.key,
    this.paddingVertical,
    this.function,
    this.initialText,
    this.onChanged,
    this.validator,
    this.maxLength,
    this.textInputType,
    this.inputFormatDesktop,
  });
  // Atributos Obligatorios
  final String hintText;
  // Atributos Opcionales
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final int? maxLength;
  final double? paddingVertical;
  final String? initialText;
  final TextInputType? textInputType;
  final InputFormatDesktopEnum? inputFormatDesktop;
  final String label;
  final void Function(String)? function;

  @override
  Widget build(BuildContext context) {
    return InputTextActionBase(
      label: label,
      hintText: hintText,
      iconData: Icons.search,
      function: (value) async {
        function?.call(value);
        return null;
      },
      inputFormatDeskptop: inputFormatDesktop,
      textInputType: textInputType,
      validator: validator,
      onChanged: onChanged,
      isOnTap: false,
      maxlength: maxLength,
      initialText: initialText,
    );
  }
}
