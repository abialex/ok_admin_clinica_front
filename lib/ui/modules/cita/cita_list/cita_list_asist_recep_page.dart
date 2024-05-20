import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/cita_card.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/doctor_carrusel_card.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_list_bloc.dart';
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
    citaBloc.add(CitaEvent.getCitas());
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
    final doctorBloc = context.read<DoctorListBloc>();

    return PageBasePhone(
      onReachedTop: () {
        doctorBloc.add(GetDoctors());
      },

      maxEntend: 170,
      minEntend: 170,
      floatingWidget: FloatingActionButton(
        mini: true,
        backgroundColor: AppColors.slg01,
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
      headerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Expanded(
            child: HeaderMobile(
              subTitle: "Doctor",
              title: "CITAS",
            ),
          ),
          // AppBox.h2,
          SizedBox(
            height: 80,
            child: BlocBuilder<DoctorListBloc, DoctorListState>(
              builder: (context, state) {
                return state.map(
                  initial: (stt) {
                    doctorBloc.add(GetDoctors());
                    return const SizedBox.shrink();
                  },
                  loading: (stt) {
                    return const SizedBox.shrink();
                  },
                  doctorsLoaded: (stt) {
                    return DoctorCarousel(doctors: stt.doctors);
                  },
                  failure: (stt) {
                    return Text(stt.error);
                  },
                );
              },
            ),
          ),
        ],
      ),
      bodySliver: SliverToBoxAdapter(
        child: citaBloc.state.map(
          initial: (state) {
            citaBloc.add(CitaEvent.getCitas());
            return const SizedBox.shrink();
          },
          loading: (state) {
            return const Text("loading");
          },
          citaLoaded: (state) {
            return CitasGroupedByHour(
              citas: state.citas,
            );
          },
          failure: (state) {
            return Text(state.error);
          },
        ),
      ),

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
        title: const Text("TABLET"),
      ),
      body: const SizedBox.shrink(),
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
