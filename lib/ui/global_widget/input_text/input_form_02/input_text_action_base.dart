// ignore_for_file: prefer_const_constructors

import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextActionBase extends StatefulWidget {
  const InputTextActionBase({
    required this.iconData,
    required this.isOnTap,
    required this.label,
    super.key,
    this.initialText,
    this.hintText,
    this.function,
    this.validator,
    this.onChanged,
    this.paddingVertical,
    this.maxlength,
    this.inputFormatDeskptop,
    this.textInputType,
    this.textInputColor,
    this.autoValidateMode = AutovalidateMode.disabled,
    this.controller,
  });
  // Atributos Obligatorios
  final IconData iconData;
  final bool isOnTap;
  // Atributos Opcionales
  final String? initialText;
  final String? hintText;
  final double? paddingVertical;
  final Future<String?> Function(String)? function;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final int? maxlength;
  final InputFormatDesktopEnum? inputFormatDeskptop;
  final TextInputType? textInputType;
  final TextStyle? textInputColor;
  final AutovalidateMode autoValidateMode;
  final String label;
  final TextEditingController? controller;

  @override
  State<InputTextActionBase> createState() => _InputTextActionBaseState();
}

class _InputTextActionBaseState extends State<InputTextActionBase> {
  late TextEditingController valueController;
  String? validatorMensajeCustom;
  @override
  void initState() {
    super.initState();
    valueController = widget.controller ?? TextEditingController();
    valueController.text = widget.initialText ?? '';
  }

  //para pc
  TextInputFormatter _inputFormattedDesktop(InputFormatDesktopEnum? state) {
    switch (state) {
      case InputFormatDesktopEnum.letras:
        return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\s]'));
      case InputFormatDesktopEnum.numeros:
        return FilteringTextInputFormatter.allow(RegExp('[0-9]'));
      case InputFormatDesktopEnum.ambos:
        return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\s0-9.,-]'));
      default:
        return FilteringTextInputFormatter.allow(RegExp(r'[a-zA-ZáÁéÉíÍóÓúÚüÜñÑ\s0-9.,-]'));
    }
  }

  @override
  void dispose() {
    valueController.dispose(); // Limpia el controlador
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        if (!widget.isOnTap) {
          return;
        }
        valueController.text = await widget.function?.call(valueController.text) ?? '';
      },
      child: AbsorbPointer(
        absorbing: widget.isOnTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppTextGlobal.labelLightText(
              text: widget.label,
            ),
            AppBox.h4,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    autovalidateMode: widget.autoValidateMode,
                    keyboardType: widget.textInputType,
                    inputFormatters: [
                      _inputFormattedDesktop(widget.inputFormatDeskptop),
                      LengthLimitingTextInputFormatter(
                        widget.maxlength,
                      ),
                    ],
                    onChanged: widget.onChanged,
                    validator: widget.validator,
                    cursorColor: AppColors.blueSecondary,
                    style: widget.textInputColor,
                    decoration: InputDecoration(
                      isDense: true,
                      errorMaxLines: 2,
                      // suffixIconConstraints: BoxConstraints(),
                      // suffixIconColor: OdebinColors.blanco_principal,
                      suffixIcon: GestureDetector(
                        onTap: () {
                          widget.function?.call(valueController.text);
                        },
                        child: buildSuffixIcon(),
                      ),
                      filled: true,
                      isCollapsed: false,
                      fillColor: AppColors.lightGray,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: AppColors.redAccent,
                        ),
                      ),
                      errorStyle: TextStyle(color: AppColors.redAccent),
                      hintText: widget.hintText,
                      hintStyle: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.darkGray,
                      ),
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        // bottom: (widget.paddingVertical ?? 0),
                        // top: (widget.paddingVertical ?? 0),
                      ),
                      floatingLabelAlignment: FloatingLabelAlignment.start,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                    ),
                    controller: valueController,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSuffixIcon() {
    return Container(
      // padding: EdgeInsets.all(
      //   0,
      // ),
      decoration: BoxDecoration(
        color: AppColors.blueAccent,
        borderRadius: BorderRadius.all(
          Radius.circular(5),
        ),
      ),
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Padding(
          padding: const EdgeInsets.all(5),
          child: Icon(
            widget.iconData,
            color: AppColors.white,
          ),
        ),
      ),
    );
  }
}

enum InputFormatDesktopEnum {
  numeros,
  letras,
  ambos,
}
