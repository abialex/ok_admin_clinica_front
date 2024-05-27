import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_construccion.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_crear_bloc/cita_create_state.dart';
import 'package:admin_clinica_front/ui/modules/cita/cita_add/forms/cita_add_agil.dart';
import 'package:admin_clinica_front/ui/modules/cita/cita_add/forms/cita_add_ocupada.dart';
import 'package:admin_clinica_front/ui/modules/cita/widget/form_pages.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../global_widget/page/page_mixin_base.dart';

class CitaAddPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaAddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      headerWidget: Text("dESKPTOP"),
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
      citaCreateBloc.add(CitaCreateEvent.citaCreateError("Tiene mas de una ubicación asignada, consulte al administrador"));
    }

    return PageBasePhone(
      title: "S",
      headerWidget: const HeaderMobile(title: "CREAR CITA"),
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
                final doctorDatos = stt.doctorDatos != null ? "${stt.doctorDatos!.nombres} ${stt.doctorDatos!.apellidos}" : "SIN DOCTOR SELECCIONADO";
                return Column(
                  children: [
                    Container(
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 12.5, vertical: 7.5),
                      decoration: BoxDecoration(
                        color: AppColors.lightBackgroundColor,
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
                              // Expanded(
                              //   child: SvgPicture.asset(
                              //     AppConstSvgs.doctor,
                              //     height: 33,
                              //   )
                              //       .animate(
                              //         onPlay: (controller) => controller.loop(),
                              //       )
                              //       .scale(
                              //         curve: Curves.bounceIn,
                              //         delay: 2.seconds,
                              //         duration: 0.75.seconds,
                              //         begin: const Offset(1, 1),
                              //         end: const Offset(1.1, 1.1),
                              //       ),
                              // ),
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
                            ubicacionId: ubicacionesPersonal[0],
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
                citaBloc.add(GetCitas(CitaRequestViewModel(
                  doctorId: stt.doctorId,
                  ubicacionesId: stt.ubicacionesId,
                  fechaHoraCita: stt.fechaCita,
                )));
                return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Text("Cita creada"));
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
