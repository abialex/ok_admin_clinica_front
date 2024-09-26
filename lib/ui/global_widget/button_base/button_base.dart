import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:flutter/material.dart';

class ButtonCustomBase extends StatelessWidget {
  final Color backgroundColor;
  final Color textColor;
  final String text;
  final double? height;
  final void Function()? onClick;
  final EdgeInsets padding;
  final double? width;
  const ButtonCustomBase(
      {super.key,
      required this.backgroundColor,
      required this.textColor,
      required this.text,
      this.padding = const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 10,
      ),
      this.height,
      this.onClick,
      this.width});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        padding: padding,
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.all(width: 0.3, color: AppConstColors.grey),
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.75), // Color de la sombra
              spreadRadius: -2,
              blurRadius: 5,
              offset: const Offset(1.5, 1.5),
            ),
          ],
        ),
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
