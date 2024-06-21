import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/theme/app_theme.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_base.dart';
import 'package:flutter/material.dart';

class InputTextDate extends StatefulWidget {
  const InputTextDate({
    required this.hintText,
    required this.label,
    required this.minDate,
    required this.maxDate,
    this.initialDate,
    super.key,
    this.paddingVertical,
    this.changeDate,
    this.helper,
    this.validator,
    this.initialText,
    this.controller,
  });
  final String? initialText;
  final String hintText;
  final DateTime minDate;
  final DateTime maxDate;
  final double? paddingVertical;
  final String? helper;
  final void Function(String, DateTime)? changeDate;
  final String label;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final DateTime? initialDate;

  @override
  State<InputTextDate> createState() => _InputTextDateState();
}

class _InputTextDateState extends State<InputTextDate> {
  late DateTime? selectedDate;
  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
  }

  Future<DateTime?> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      locale: const Locale('es', 'ES'),
      initialEntryMode: DatePickerEntryMode.inputOnly,
      keyboardType: TextInputType.phone,
      helpText: widget.helper,
      confirmText: 'Aceptar',
      cancelText: 'Cancelar',
      context: context,
      initialDate: selectedDate, // Referencia la fecha inicial
      firstDate: widget.minDate, // Fecha mínima disponible para selección
      lastDate: widget.maxDate, // Fecha máxima disponible para selección
      builder: (context, child) {
        return Theme(
          data: AppTheme().themeLight(),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
      return picked;
    }
    if (selectedDate != null) {
      return selectedDate;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return InputTextActionBase(
      controller: widget.controller,
      validator: widget.validator,
      label: widget.label,
      paddingVertical: widget.paddingVertical,
      iconData: Icons.date_range,
      initialText: widget.initialText ?? selectedDate?.toFormatddMMyyyySlash(),
      hintText: widget.hintText,
      isOnTap: true,
      function: (value) async {
        final dateSelect = await _selectDate(context);
        if (dateSelect != null) {
          final dateSelectString = dateSelect.toFormatddMMyyyySlash();
          widget.changeDate?.call(dateSelectString, dateSelect);
          return dateSelectString;
        } else {
          return "";
        }
      },
      textInputColor: AppTextGlobal.labelLightText(text: '').style,
    );
  }
}
