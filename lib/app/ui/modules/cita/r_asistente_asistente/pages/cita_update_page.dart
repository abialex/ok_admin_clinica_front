import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/data/entities/estado_cita.dart';
import 'package:admin_clinica_front/app/data/entities/tipo_cita.dart';
import 'package:admin_clinica_front/app/common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_construccion.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_update_bloc/cita_update_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_update_bloc/cita_update_event.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_update_bloc/cita_update_state.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/r_asistente_recepcion/forms/cita_update_agil.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../common/widget/page/page_mixin_base.dart';

class CitaUpdateAsistenteAsistentePage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaUpdateAsistenteAsistentePage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      title: "MODIFICAR CITA",
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final citaCreateBloc = context.read<CitaUpdateBloc>();
    final citaBloc = context.read<CitaBloc>();
    final ubicacionesPersonal = context.read<UsuarioBloc>().state.usuario?.ubicaciones ?? [];
    if (ubicacionesPersonal.isEmpty) {
      citaCreateBloc.add(CitaUpdateEvent.citaUpdateError("No tiene ubicaciones asignadas, consulte al administrador"));
    }
    if (ubicacionesPersonal.length > 1) {
      citaCreateBloc.add(CitaUpdateEvent.citaUpdateError("Tiene mas de una ubicación asignada, consulte al administrador"));
    }

    return PageBasePhone(
      headerWidget: const HeaderMobile(
        title: "MODIFICAR CITA",
        logoutActive: false,
      ),
      showNavbar: false,
      bodySliver: SliverToBoxAdapter(
        child: BlocBuilder<CitaUpdateBloc, CitaUpdateState>(
          builder: (context, state) {
            return state.map(
              initial: (stt) {
                return const SizedBox.shrink();
              },
              loading: (stt) {
                return const SizedBox.shrink();
              },
              citaAgilSetup: (stt) {
                return Column(
                  children: [
                    AppBox.h10,
                    if (stt.citaViewModel.datosPaciente != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.person,
                            color: AppConstColors.slg01,
                          ),
                          Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.citaViewModel.datosPaciente!.toUpperCase()))),
                          AppBox.w6,
                        ],
                      ),
                    if (stt.citaViewModel.pacienteDatos != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.person,
                            color: AppConstColors.slg01,
                          ),
                          Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.citaViewModel.pacienteDatos!.toUpperCase()))),
                          AppBox.w6,
                        ],
                      ),
                    AppBox.h10,
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // AppTextGlobal.labelLightText(text: "Estado:"),
                        Container(
                          alignment: Alignment.center,
                          width: 110,
                          padding: const EdgeInsets.symmetric(
                            vertical: 2.5,
                            horizontal: 5,
                          ),
                          decoration: BoxDecoration(
                            color: stt.citaViewModel.estado.color,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(
                                10,
                              ),
                            ),
                          ),
                          child: AppTextGlobal.labelLightText(
                            text: stt.citaViewModel.estadoString,
                            colorText: AppConstColors.white,
                            fontSize: 14,
                          ).animate().flip(),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.av_timer_rounded,
                              color: AppConstColors.slg01,
                            ),
                            // AppTextGlobal.labelLightText(text: "Hora:"),
                            AppBox.w2,
                            AppTextGlobal.labelLightText(text: stt.citaViewModel.fechaHoraCita.toFormatHHmm()),
                          ],
                        )
                      ],
                    ),
                    AppBox.h10,
                    () {
                      switch (stt.citaViewModel.tipo) {
                        case TipoCita.tentativa:
                          return const ConstruccionAnimated();
                        case TipoCita.agil:
                          return CitaUpdateFormAgil(
                            cita: stt.citaViewModel,
                          );
                        case TipoCita.completa:
                          return const ConstruccionAnimated();
                        case TipoCita.ocupada:
                          return const ConstruccionAnimated();
                        default:
                          return const Text("data");
                      }
                    }()
                  ],
                );
              },
              citaUpdateSuccess: (stt) {
                citaBloc.add(GetCitas(CitaRequestViewModel(
                  doctorId: stt.doctorId,
                  ubicacionesId: stt.ubicacionesId,
                  fechaHoraCita: stt.fechaCita,
                )));
                return Center(
                    child: Column(
                  children: [
                    AppBox.h20,
                    CircleAvatar(
                      backgroundColor: AppConstColors.lightBackgroundColor,
                      maxRadius: 120,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SvgPicture.asset(
                          AppConstSvgs.logo,
                          color: AppConstColors.slgPrincipal,
                        ),
                      ),
                    )
                        .animate(
                          onPlay: (controller) => controller.loop(),
                        )
                        .rotate(
                          delay: 2.seconds,
                          duration: 1.5.seconds,
                        ),
                    AppBox.h20,
                    AppTextGlobal.labelLightText(text: "SE MODIFICÓ CORRECTAMENTE"),
                    AppBox.h20,
                    ButtonSuccess(
                      text: "VER CITAS",
                      onClick: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ));
              },
              failure: (stt) {
                return AppTextGlobal.errorlightText(text: stt.error, maxLines: 2);
              },
            );
          },
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("ss"),
      ),
      body: const Text("Sin implementar"),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     final api = locator<DoctorApi>();
      //     final storage = locator<ILocalRepository>();
      //     storage.saveToken("token 47a868ce1c2c87cd80a68771405553f2fbe4c5d9");
      //     final result = await api.getDoctorsByIdUbicacionFromAsistente();
      //     result.fold((left) => print(left), (right) => print(right));
      //     // dialog.showDialog(titulo: "s", texto: "s");
      //   },
      //   tooltip: 'Increment',
      //   child: const Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
