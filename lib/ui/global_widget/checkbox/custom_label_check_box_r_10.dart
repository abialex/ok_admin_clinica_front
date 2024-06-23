import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomLabelCheckBoxR10 extends StatefulWidget {
  const CustomLabelCheckBoxR10({
    required this.onChanged,
    required this.backgroundColor, //= AppConstColors.blueAccent,
    required this.iconBackgroundColor, // = AppConstColors.white,
    super.key,
    this.text,
    this.initialValue = false,
    this.value,
    this.sizeIcon = 16,
  });
  final String? text;
  final bool initialValue;
  final bool? value;
  final Color backgroundColor;
  final Color iconBackgroundColor;

  final double sizeIcon;
  final void Function() onChanged;

  @override
  State<CustomLabelCheckBoxR10> createState() => _CustomLabelCheckBoxR10State();
}

class _CustomLabelCheckBoxR10State extends State<CustomLabelCheckBoxR10> {
  late bool val;
  @override
  void initState() {
    super.initState();
    val = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          val = !val;
        });
        widget.onChanged();
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (widget.text != null) AppTextGlobal.labelLightText(text: widget.text!) else const SizedBox.shrink(),
          AnimatedContainer(
            decoration: BoxDecoration(
              color: widget.value ?? val ? AppColors.blueAccent : Colors.transparent,
              border: Border.all(
                color: widget.backgroundColor,
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(7.5),
              ),
            ),
            duration: const Duration(milliseconds: 200),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            child: Container(
              alignment: Alignment.center,
              height: 20,
              width: 20,
              child: widget.value ?? val
                  ? Icon(
                      Icons.check,
                      size: widget.sizeIcon,
                      color: widget.iconBackgroundColor,
                    )
                  : const SizedBox.shrink(),
            ),
          ),
        ],
      ),
    );
  }
}
