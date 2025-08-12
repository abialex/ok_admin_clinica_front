import 'package:admin_clinica_front/app/common/utils/responsive_app.dart';
import 'package:flutter/material.dart';

class AppResponsiveDesktop extends StatelessWidget {
  const AppResponsiveDesktop({
    required this.child,
    this.largeWidthPercent = 0.9,
    this.mediumWidthPercent = 0.5,
    this.maxHeightPercent = 0.8,
    this.backgroundColor,
    super.key,
  });
  final double largeWidthPercent;
  final double mediumWidthPercent;
  final double maxHeightPercent;
  final Widget child;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveApp.isLargeWeb(context) || ResponsiveApp.isMediumWeb(context);
    double dialogWidth;
    if (isDesktop) {
      dialogWidth = MediaQuery.of(context).size.width * mediumWidthPercent;
    } else {
      dialogWidth = MediaQuery.of(context).size.width * largeWidthPercent;
    }
    final maxHeight = MediaQuery.of(context).size.height * maxHeightPercent;
    return Center(
      child: Container(
        alignment: Alignment.center,
        width: dialogWidth,
        constraints: BoxConstraints(
          maxHeight: maxHeight,
        ),
        child: child,
      ),
    );
  }
}
