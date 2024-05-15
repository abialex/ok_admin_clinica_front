import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/blocs/sunat/sunat_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_base.dart';
import 'package:admin_clinica_front/ui/view_models/services_view/services_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppSunatWidget extends StatelessWidget {
  const AppSunatWidget({super.key, required this.onTap});

  final void Function(SunatPersonaViewModel?) onTap;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SunatCubit(),
      child: BlocBuilder<SunatCubit, SunatState>(
        builder: (context, state) {
          final sunatCubit = context.read<SunatCubit>();
          return Column(
            children: [
              InputTextActionBase(
                iconData: Icons.search_outlined,
                isOnTap: false,
                label: "Sunat",
                inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                maxlength: 8,
                hintText: "Ingrese dni de la persona",
                textInputType: TextInputType.number,
                function: (value) async {
                  final persona = await sunatCubit.getPersonaByDni(value);
                  onTap(persona);
                  return null;
                },
              ),
              AppBox.h4,
              state.map(
                initial: (stt) {
                  return const SizedBox.shrink();
                },
                loading: (stt) {
                  return const Center(child: CircularProgressIndicator());
                },
                sunatPersonaLoaded: (stt) {
                  return AppTextGlobal.labelLightText(text: "SUNAT: ${stt.sunatPersona.nombres.isEmpty ? "Sin datos" : stt.sunatPersona.toString()} ");
                },
                failure: (stt) {
                  return AppTextGlobal.errorlightText(text: stt.error);
                },
              )
            ],
          );
        },
      ),
    );
  }
}
