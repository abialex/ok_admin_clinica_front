import 'package:admin_clinica_front/core/theme/app_theme.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_base.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InputTextDate extends StatefulWidget {
  const InputTextDate({
    required this.hintText,
    required this.label,
    required this.minDate,
    required this.maxDate,
    super.key,
    this.paddingVertical,
    this.changeDate,
    this.helper,
  });
  final String hintText;
  final DateTime minDate;
  final DateTime maxDate;
  final double? paddingVertical;
  final String? helper;
  final void Function(String, DateTime)? changeDate;
  final String label;

  @override
  State<InputTextDate> createState() => _InputTextDateState();
}

class _InputTextDateState extends State<InputTextDate> {
  DateTime selectedDate = DateTime.now();
  Future<DateTime> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      locale: const Locale('es', 'ES'),
      initialEntryMode: DatePickerEntryMode.inputOnly,
      helpText: widget.helper,
      confirmText: 'Aceptar',
      cancelText: 'Cancelar',
      context: context,
      initialDate: selectedDate, // Referencia la fecha inicial
      firstDate: widget.minDate, // Fecha mínima disponible para selección
      lastDate: widget.maxDate, // Fecha máxima disponible para selección
      builder: (context, child) {
        return Theme(
          data: AppTheme().theme(),
          child: child!,
        );
      },
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
    return selectedDate;
  }

  @override
  Widget build(BuildContext context) {
    return InputTextActionBase(
      label: widget.label,
      paddingVertical: widget.paddingVertical,
      iconData: Icons.date_range,
      initialText: DateFormat('dd/MM/yyyy').format(selectedDate),
      isOnTap: true,
      function: (value) async {
        final dateSelect = await _selectDate(context);
        final dateSelectString = DateFormat('dd/MM/yyyy').format(dateSelect);
        widget.changeDate?.call(dateSelectString, dateSelect);
        return dateSelectString;
      },
      textInputColor: AppTextGlobal.labelLightText(text: '').style,
    );
  }
}
