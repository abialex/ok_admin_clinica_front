import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../core/router.dart';
import '../../../global_widget/page/page_mixin_base.dart';
import '../bloc/cita_bloc.dart';

class CitaListAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  const CitaListAsistenteRecepcionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();
    return BlocBuilder<CitaBloc, CitaState>(
      bloc: citaBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      headerWidget: Text("dESKPTOP"),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final citaBloc = context.read<CitaBloc>();

    return PageBasePhone(
        floatingWidget: FloatingActionButton(
          backgroundColor: AppColors.blueSecondary,
          foregroundColor: AppColors.white,
          onPressed: () {
            Navigator.pushNamed(
              context,
              Routes.base_asistenteRecepcion + Routes.cita_add,
            );
          },
          child: const Icon(Icons.add),
        ),
        title: "Cita Page PADRE",
        bodySliver: citaBloc.state.map(
          initial: (state) {
            citaBloc.add(CitaEvent.getCitas());
            return SliverToBoxAdapter(child: SizedBox.shrink());
          },
          loading: (state) {
            return SliverToBoxAdapter(child: Text("loading"));
          },
          citaLoaded: (state) {
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  final item = state.citas[index];
                  return Text(item.estado.toString());
                },
                childCount: state.citas.length,
              ),
            );
          },
          failure: (state) {
            return SliverToBoxAdapter(child: Text(state.error));
          },
        )
        //  SliverList(
        //   delegate: SliverChildBuilderDelegate(
        //     (context, index) => Text("s"),
        //     childCount: 5,
        //   ),
        // ),
        );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
