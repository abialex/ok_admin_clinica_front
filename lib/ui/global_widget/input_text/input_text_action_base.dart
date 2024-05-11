// ignore_for_file: prefer_const_constructors

import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputTextActionBase extends StatefulWidget {
  const InputTextActionBase({
    required this.iconData,
    required this.isOnTap,
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

  @override
  State<InputTextActionBase> createState() => _InputTextActionBaseState();
}

class _InputTextActionBaseState extends State<InputTextActionBase> {
  final valueController = TextEditingController();
  String? validatorMensajeCustom;
  @override
  void initState() {
    super.initState();
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
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: TextFormField(
                    // maxLength: 2,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    //expresion regular
                    keyboardType: widget.textInputType,
                    // maxLength: widget.maxlength,
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
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: OutlineInputBorder(
                        // borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: BorderSide(
                          color: Colors.transparent,
                          width: 0,
                        ),
                      ),
                      hintText: widget.hintText,
                      contentPadding: EdgeInsets.only(
                        left: 10,
                        // bottom: (widget.paddingVertical ?? 0),
                        // top: (widget.paddingVertical ?? 0),
                      ),
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
