import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../core/router.dart';
import '../../../global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import '../../../global_widget/page/page_base_desktop.dart';
import '../../../global_widget/page/page_base_phone.dart';
import '../../../global_widget/page/page_mixin_base.dart';
import '../bloc/doctor_bloc.dart';

class DoctorUpdateAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  const DoctorUpdateAsistenteRecepcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorBloc = context.read<DoctorBloc>();
    return BlocBuilder<DoctorBloc, DoctorState>(
      bloc: doctorBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      headerWidget: Text("Sin implementar"),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final doctorBloc = context.read<DoctorBloc>();
    return PageBasePhone(
      title: "Doctor update",
      bodySliver: SliverToBoxAdapter(
        child: Column(
          children: [
            Container(
              child: Text("DOCTOR update"),
            ),
            Container(
              child: Text("DOCTOR ADD"),
            ),
          ],
        ),
      ),
      footerSliver: Container(
        padding: const EdgeInsets.only(bottom: 20),
        color: Colors.blueAccent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                ElevatedButton(
                    onPressed: () async {
                      await doctorBloc.updateDoctor();
                      Navigator.pushNamed(context, Routes.doctor_list);
                    },
                    child: Text("update doctor")),
                Text('Footer para botone de este page', style: TextStyle(color: Colors.white, fontSize: 24)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    final dialog = context.read<DialogMessageCubit>();
    return Scaffold(
      backgroundColor: AppColors.cyan,
      appBar: AppBar(
        backgroundColor: AppColors.blueAccent,
        title: const Text("ss"),
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
          storage.saveToken("token 1f9579b30ba59f8dc25a853528d3adac2609f69d");
          final result = await api.getDoctorsByIdUbicacionFromAsistente();
          result.fold((left) => print(left), (right) => print(right));
          dialog.showDialog(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
