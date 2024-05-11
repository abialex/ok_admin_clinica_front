import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/dropdown_multiselect.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_buscar.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_date.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/modules/ubicacion/bloc/ubicacion_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/ubicacion_view/ubicacion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import '../../../global_widget/page/page_mixin_base.dart';
import '../bloc/doctor_bloc.dart';

class DoctorAddAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  const DoctorAddAsistenteRecepcionPage({super.key});

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
    // final doctorBloc = context.read<DoctorBloc>();
    final ubicacionBloc = context.read<UbicacionBloc>();

    return PageBasePhone(
      title: "Doctor Add",
      headerWidget: const Text("Agregar doctor"),
      bodySliver: SliverToBoxAdapter(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AppBox.h10,
            const InputTextBuscar(label: "DNI", hintText: "Ingrese DNI"),
            AppBox.h10,
            const InputTextBase(label: "Nombres", hintText: "Ingrese Nombres"),
            AppBox.h10,
            const InputTextBase(label: "Apellidos", hintText: "Ingrese Apellidos"),
            AppBox.h10,
            const InputTextBase(label: "DNI", hintText: "Ingrese DNI"),
            AppBox.h10,
            const InputTextBase(label: "CELULAR", hintText: "Ingrese un celular"),
            AppBox.h10,
            InputTextDate(
              label: "FECHA NACIMIENTO",
              hintText: "Fecha nacimiento",
              maxDate: DateTime.now(),
              minDate: DateTime(1940),
              changeDate: (p0, p1) {},
            ),
            AppBox.h10,
            Row(
              children: [
                AppTextGlobal.labelLightText(text: "UBICACIÓN"),
                AppBox.w4,
                AppTextGlobal.errorlightText(text: "ubicaciones a la que pertenece"),
              ],
            ),
            AppBox.h10,
            BlocBuilder<UbicacionBloc, UbicacionState>(
              bloc: ubicacionBloc,
              builder: (context, state) {
                return state.map(
                  initial: (stt) {
                    ubicacionBloc.add(GetUbicaciones());
                    return const Text("initial");
                  },
                  loading: (stt) {
                    return const Text("loading");
                  },
                  ubicacionLoaded: (stt) {
                    final ubicacionesList = stt.ubicaciones
                        .map(
                          (e) => MultiSelectItem<UbicacionsViewModel>(
                            id: e.id,
                            item: e,
                          ),
                        )
                        .toList();
                    return MultiSelect<UbicacionsViewModel>(
                      listItems: ubicacionesList,
                      onSelect: (p0) {
                        print(p0);
                      },
                      itemBuilder: (context, item) {
                        return Container(
                          child: AppTextGlobal.labelLightText(text: item.nombre),
                        );
                      },
                    );
                  },
                  failure: (stt) {
                    return const Text("error");
                  },
                );
              },
            ),
          ],
        ),
      ),
      footerSliver: Container(
        height: 75,
        padding: const EdgeInsets.only(top: 30),
        color: AppColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                const Expanded(
                  child: ButtonCancel(
                    text: "Cancelar",
                  ),
                ),
                AppBox.w10,
                const Expanded(
                  child: ButtonSuccess(
                    text: "Agregar",
                  ),
                )
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
