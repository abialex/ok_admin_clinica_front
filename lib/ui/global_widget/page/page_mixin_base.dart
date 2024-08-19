import 'package:flutter/cupertino.dart';

import 'page_base_desktop.dart';
import 'page_base_phone.dart';

mixin ResponsiveWidgetMixin on StatelessWidget {
  Widget whatIs(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          child: () {
            if (constraints.maxWidth < 600) {
              return buildMobile(context);
            } else if (constraints.maxWidth < 1200) {
              return buildMobile(context);
            } else {
              return buildDesktop(context);
            }
          }(),
        );
      },
    );
  }

  Widget buildMobile(BuildContext context);

  PageBaseDesktop buildDesktop(BuildContext context);

  Widget buildTablet(BuildContext context);
}

mixin ResponsiveFullWidgetMixin on StatefulWidget {
  Widget whatIs(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 50),
          child: () {
            if (constraints.maxWidth < 600) {
              return buildMobile(context);
            } else if (constraints.maxWidth < 1200) {
              return buildDesktop(context);
            } else {
              return buildDesktop(context);
            }
          }(),
        );
      },
    );
  }

  PageBasePhone buildMobile(BuildContext context);

  PageBaseDesktop buildDesktop(BuildContext context);

  Widget buildTablet(BuildContext context);
}
