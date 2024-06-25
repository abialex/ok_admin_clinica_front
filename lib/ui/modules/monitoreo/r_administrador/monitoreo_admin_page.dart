import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_mixin_base.dart';
import 'package:flutter/material.dart';

class MonitoreoAdminPage extends StatelessWidget with ResponsiveWidgetMixin {
  const MonitoreoAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      title: "Monitoreo",
      bodyWidget: Text("data"),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    throw const PageBasePhoneBeta(
      bodySliver: [Text("data")],
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("TABLET"),
      ),
      body: const SizedBox.shrink(),
    );
  }
}
