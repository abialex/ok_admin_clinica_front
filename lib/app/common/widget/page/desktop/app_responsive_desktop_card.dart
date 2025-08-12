// ignore_for_file: inference_failure_on_instance_creation, must_be_immutable

import 'package:flutter/material.dart';

class AppResponsiveDesktopCard extends StatelessWidget {
  AppResponsiveDesktopCard({
    required this.widget,
    super.key,
  });

  Widget widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: Center(
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.55,
              child: widget,
            ),
          ),
        ),
      ],
    );
  }
}
