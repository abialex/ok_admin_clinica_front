import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:flutter/material.dart';
import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../global_widget/page/page_mixin_base.dart';

class CitaAddPage extends StatelessWidget with ResponsiveWidgetMixin {
  const CitaAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      headerWidget: Text("dESKPTOP"),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    return PageBasePhone(
      title: "Cita add page",
      bodySliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.symmetric(vertical: 5),
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 7.5),
              decoration: const BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.all(
                  Radius.circular(15),
                ),
              ),
              child: const Column(
                children: [
                  Row(
                    children: [
                      Text("nombre"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("usuario"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("dni"),
                    ],
                  ),
                  Row(
                    children: [
                      Text("fechaNacimiento"),
                    ],
                  ),
                ],
              ),
            );
          },
          childCount: 20,
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("ss"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // const DialogCubitPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed :',
              ),
              Text(
                '3213123',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = locator<DoctorApi>();
          final storage = locator<ILocalRepository>();
          storage.saveToken("token 47a868ce1c2c87cd80a68771405553f2fbe4c5d9");
          final result = await api.getDoctorsByIdUbicacionFromAsistente();
          result.fold((left) => print(left), (right) => print(right));
          // dialog.showDialog(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
