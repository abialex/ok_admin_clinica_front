import 'package:flutter/widgets.dart';

class AppTextBase extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color colorText;
  const AppTextBase({
    super.key,
    required this.text,
    required this.fontSize,
    required this.fontWeight,
    required this.colorText,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontWeight: fontWeight,
        color: colorText,
        fontSize: fontSize,
      ),
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
    );
  }
}
