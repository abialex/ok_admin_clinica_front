import 'package:admin_clinica_front/ui/global_widget/app_construccion.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_mixin_base.dart';
import 'package:flutter/material.dart';

class OtrosPage extends StatelessWidget with ResponsiveWidgetMixin {
  const OtrosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      title: "OTROS",
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    return PageBasePhone(
        headerWidget: const HeaderMobile(title: "OTROS"),
        bodySliver: const SliverToBoxAdapter(
          child: ConstruccionAnimated(),
        ));
  }

  @override
  Widget buildTablet(BuildContext context) {
    // TODO: implement buildTablet
    throw UnimplementedError();
  }
}
