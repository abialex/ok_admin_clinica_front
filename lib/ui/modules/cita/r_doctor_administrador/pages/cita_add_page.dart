import 'package:admin_clinica_front/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_construccion.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_state.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_doctor_administrador/forms/cita_add_agil.dart';
import 'package:admin_clinica_front/ui/modules/cita/r_doctor_administrador/forms/cita_add_ocupada.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/form_pages.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../global_widget/page/page_mixin_base.dart';

class CitaAddDoctorAdminPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaAddDoctorAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      title: "CREAR DOCTORES",
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final citaCreateBloc = context.read<CitaCreateBloc>();
    final citaBloc = context.read<CitaBloc>();
    final ubicacionesPersonal = context.read<UsuarioBloc>().state.usuario?.ubicaciones ?? [];
    if (ubicacionesPersonal.isEmpty) {
      citaCreateBloc.add(CitaCreateEvent.citaCreateError("No tiene ubicaciones asignadas, consulte al administrador"));
    }
    if (ubicacionesPersonal.length > 1) {
      // citaCreateBloc.add(CitaCreateEvent.citaCreateError("Tiene mas de una ubicación asignada, consulte al administrador"));
    }
    String doctorDatos = "";

    return PageBasePhone(
      showNavbar: false,
      headerWidget: const HeaderMobile(
        title: "CREAR CITA",
        logoutActive: false,
      ),
      bodySliver: SliverToBoxAdapter(
        child: BlocBuilder<CitaCreateBloc, CitaCreateState>(
          builder: (context, state) {
            return state.map(
              initial: (stt) {
                return const SizedBox.shrink();
              },
              loading: (stt) {
                return const SizedBox.shrink();
              },
              citaUploadPreDatos: (stt) {
                doctorDatos = stt.doctorDatos != null ? "${stt.doctorDatos!.nombres} ${stt.doctorDatos!.apellidos}" : "SIN DOCTOR SELECCIONADO";
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
                      decoration: BoxDecoration(
                        color: AppConstColors.lightBackgroundColor,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.75), // Color de la sombra
                            spreadRadius: -2,
                            blurRadius: 5,
                            offset: const Offset(1.5, 1.5),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 7,
                                child: AppTextGlobal.labelLightText(
                                  text: doctorDatos,
                                  textAlign: TextAlign.center,
                                  fontSize: 14.5,
                                ).animate().scale(
                                      begin: const Offset(0.9, 0.9),
                                      end: const Offset(1, 1),
                                    ),
                              ),
                              // const Expanded(child: SizedBox.shrink())
                            ],
                          ),
                          AppBox.h10,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.timer_sharp),
                                  AppBox.w4,
                                  AppTextGlobal.labelLightText(text: stt.horaString),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(Icons.date_range),
                                  AppBox.w4,
                                  AppTextGlobal.labelLightText(text: stt.fechaCita.toFormatddMMyyyySlash()),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    AppBox.h10,
                    FormPages(
                      items: [
                        ItemPage(
                          titulo: "Ágil",
                          widget: CitaAddFormAgil(
                            doctorId: stt.doctorDatos!.id,
                            fechaCita: stt.fechaCita,
                            hora: stt.hora,
                          ),
                        ),
                        ItemPage(
                          titulo: "Completa",
                          widget: const ConstruccionAnimated(),
                        ),
                        ItemPage(
                          titulo: "Tentativa",
                          widget: const ConstruccionAnimated(),
                        ),
                        ItemPage(
                          titulo: "Ocupada",
                          widget: const CitaAddFormOcupada(),
                        )
                      ],
                    ),
                  ],
                );
              },
              citaCreateSuccess: (stt) {
                citaBloc.add(
                  GetCitas(
                    CitaRequestViewModel(
                      doctorId: stt.doctorId,
                      ubicacionesId: stt.ubicacionesId,
                      fechaHoraCita: stt.fechaCita,
                    ),
                  ),
                );
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppTextGlobal.lightText(text: ""),
                        AppTextGlobal.labelLightText(text: "CITA ÁGIL "),
                        AppTextGlobal.lightText(text: "para el "),
                        AppTextGlobal.labelLightText(text: stt.fechaCita.toFormatddMMyyyySlash()),
                        AppTextGlobal.lightText(text: " a las "),
                        AppTextGlobal.labelLightText(text: stt.fechaCita.toFormatHHmm()),
                      ],
                    ),
                    Row(
                      children: [
                        AppTextGlobal.lightText(text: "Dr(a). : "),
                        Expanded(child: AppTextGlobal.labelLightText(text: doctorDatos)),
                      ],
                    ),
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
