import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_ocupada/cita_ocupada_create.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/config/app_cita_config.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/data/entities/estado_cita.dart';
import 'package:admin_clinica_front/app/common/enums/tipo_accion_enum.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_hora_bloc/cita_hora_bloc.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_index_bloc/cita_index_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class CitaDoctorCard extends StatelessWidget {
  final CitaDTO cita;

  const CitaDoctorCard({super.key, required this.cita});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CitaIndexBloc(),
      child: BlocBuilder<CitaIndexBloc, CitaIndexState>(
        builder: (context, state) {
          final bloc = context.read<CitaIndexBloc>();
          return Container(
              margin: const EdgeInsets.symmetric(
                vertical: 15,
                horizontal: 5,
              ),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppConstColors.slg01,
                  width: 0.3,
                ),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 5),
                  ),
                ],
              ),
              child: state.map(
                initial: (stt) {
                  bloc.add(CitaIndexEvent.initial(cita));
                  return const SizedBox.shrink();
                },
                loading: (stt) {
                  return const Padding(
                    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    child: Center(child: CircularProgressIndicator()),
                  );
                },
                citaLoaded: (stt) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppBox.h10,
                                  if (cita.datosPaciente != null)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: AppConstColors.slg01,
                                        ),
                                        // AppTextGlobal.labelLightText(text: "Paciente SLG:"),
                                        Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.cita.datosPaciente!.toUpperCase()))),
                                        AppBox.w6,
                                      ],
                                    ),
                                  if (cita.paciente != null)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: AppConstColors.slg01,
                                        ),
                                        // AppTextGlobal.labelLightText(text: "Paciente Libre:"),
                                        Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.cita.paciente?.nombres?.toUpperCase() ?? 'N.A'))),
                                        AppBox.w6,
                                      ],
                                    ),
                                  AppBox.h10,
                                  if (cita.razon != null)
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Row(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              AppTextGlobal.labelLightText(text: "Razón:", fontSize: 13),
                                              AppBox.w4,
                                              Expanded(
                                                  child: AppTextGlobal.lightText(
                                                text: stt.cita.razon ?? 'sin razón',
                                                fontSize: 13,
                                                maxLines: 2,
                                              )),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 90,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2.5,
                                            horizontal: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: stt.cita.estadoEnum.color,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: AppTextGlobal.labelLightText(
                                            text: stt.cita.estadoString,
                                            colorText: AppConstColors.white,
                                            fontSize: 12,
                                          ).animate().flip(),
                                        ),
                                      ],
                                    ),
                                  if (cita.razonOcupado != null) ...[
                                    const SizedBox(height: 5.0),
                                    Text('Razón Ocupado: ${stt.cita.razonOcupado}'),
                                  ],
                                  // AppBox.h4,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Positioned(
                        left: -0,
                        top: -15,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            color: AppConstColors.white,
                            border: Border(
                              left: BorderSide(
                                color: AppConstColors.slg01,
                                width: 0.3,
                              ),
                              top: BorderSide(
                                color: AppConstColors.slg01,
                                width: 0.3,
                              ),
                              right: BorderSide(
                                color: AppConstColors.slg01,
                                width: 0.2999,
                                // width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.av_timer_rounded,
                                color: AppConstColors.slg01,
                              ),
                              // AppTextGlobal.labelLightText(text: "Hora:"),
                              AppBox.w2,
                              AppTextGlobal.labelLightText(text: stt.cita.fechaHoraCitaDate.toFormatHHmm()),
                            ],
                          ),
                        ),
                      ),
                      // *tipó
                      // Positioned(
                      //   bottom: 2,
                      //   right: 2,
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                      //     decoration: const BoxDecoration(
                      //       // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      //       color: Colors.transparent,
                      //     ),
                      //     child: Row(
                      //       crossAxisAlignment: CrossAxisAlignment.center,
                      //       mainAxisAlignment: MainAxisAlignment.center,
                      //       children: [
                      //         // AppTextGlobal.labelLightText(text: "Tipo:"),
                      //         // AppBox.w4,
                      //         AppTextGlobal.lightText(
                      //           text: stt.cita.tipoString,
                      //           fontSize: 12,
                      //           colorText: AppConstColors.grey,
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // *celular
                      // Positioned(
                      //   bottom: 0,
                      //   left: sizeButtonLeft + 10,
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                      //     decoration: const BoxDecoration(
                      //       // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      //       color: AppColors.white,
                      //     ),
                      //     child: Row(
                      //       children: [
                      //         if (stt.cita.celular != null) ...[
                      //           const Icon(
                      //             Icons.phone,
                      //             color: AppColors.grey,
                      //             size: 14,
                      //           ),
                      //           AppBox.w4,
                      //           AppTextGlobal.lightText(
                      //             text: stt.cita.celular!,
                      //             fontSize: 12,
                      //             colorText: AppColors.grey,
                      //           ),
                      //         ] else ...[
                      //           Transform.rotate(
                      //             angle: 3.1416 * 0.5,
                      //             child: const Icon(
                      //               Icons.phone_disabled_sharp,
                      //               color: AppColors.lightGray,
                      //               size: 16,
                      //             ),
                      //           ),
                      //           AppBox.w4,
                      //           AppTextGlobal.lightText(
                      //             text: "Sin registrar",
                      //             fontSize: 14,
                      //             colorText: AppColors.lightGray,
                      //           ),
                      //         ]
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  );
                },
                citaEliminada: (value) {
                  return const SizedBox.shrink();
                },
                failure: (stt) {
                  return Container(
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 20,
                      ),
                      child: Column(
                        children: [
                          AppTextGlobal.errorlightText(text: stt.error),
                          AppBox.h4,
                          ButtonSuccess(
                            text: "recargar",
                            onClick: () {
                              bloc.add(CitaIndexEvent.getCita(cita.id));
                            },
                          )
                        ],
                      ));
                },
              ));
        },
      ),
    );
  }

  SliverToBoxAdapter _buildOptionsBottomModal({
    required String text,
    required Function() onTap,
  }) {
    return SliverToBoxAdapter(
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 10,
          ),
          margin: const EdgeInsets.symmetric(vertical: 10),
          decoration: const BoxDecoration(
            color: AppConstColors.slg01,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              AppBox.w10,
              const Icon(
                Icons.circle,
                color: AppConstColors.white,
                size: 10,
              ),
              AppBox.w10,
              AppTextGlobal.lightText(
                text: text,
                colorText: AppConstColors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  GestureDetector _buildActionState({Function()? onTap, required Widget Function() builder}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(5),
        child: builder(),
      ),
    );
  }

  Future<void> nextCita(BuildContext context, CitaDTO cita) async {
    final bloc = context.read<CitaIndexBloc>();
    final dialogCubit = context.read<DialogMessageCubit>();
    late String titulo;
    late String texto;
    late TipoAccionEnum tipoAccion;
    switch (cita.estadoEnum) {
      case EstadoCita.pendiente:
        titulo = "¿Seguro(a) de confirmar?";
        texto = "la cita estará pendiente para que el doctor acepte, una vez confirmada la cita ya no se podrá modificar.";
        tipoAccion = TipoAccionEnum.confirmar;

      case EstadoCita.confirmado:
        titulo = "¿Seguro(a) de querer validar?";
        texto = "Está permitido validar si el doctor no inició la atención";
        dialogCubit.showWarningAlert(
            texto: texto,
            onAceptar: () {
              bloc.add(CitaIndexEvent.nextCita(cita, TipoAccionEnum.validar));
            });

        return;
      case EstadoCita.atendiendo:
        titulo = "Todavía en atención!";
        texto = "el doctor no ha finalizado la cita";
        dialogCubit.showInfoAlert(texto: texto);
        return;

      case EstadoCita.finalizado:
        titulo = "¿Seguro(a) de validar?";
        texto = "¿El paciente está en recepción?";
        tipoAccion = TipoAccionEnum.validar;
      case EstadoCita.validado:
        titulo = "la cita ya ha concluido";
        texto = ":)";
        dialogCubit.showInfoAlert(texto: titulo);
        return;

      default:
        texto = "Estado no soportado en este caso";
        titulo = "Permisos de asistenta de recepción";
        dialogCubit.showErrorAlert(texto: texto);
        return;
    }
    dialogCubit.showConfirmationAlert(
      texto: texto,
      onAceptar: () {
        bloc.add(CitaIndexEvent.nextCita(cita, tipoAccion));
      },
    );
  }
}

class CitasGroupedByHourDoctor extends StatelessWidget {
  final List<CitaDTO> citas;
  final Function(int, String)? onAdd;
  final CitaOcupadaCreateModel Function(int) onBlock;
  final Function(int)? onRelease;

  const CitasGroupedByHourDoctor({
    super.key,
    required this.citas,
    this.onAdd,
    required this.onBlock,
    this.onRelease,
  });

  @override
  Widget build(BuildContext context) {
    for (var horaItem in CitaConfig.horaList) {
      horaItem.listItems.clear();
      horaItem.listItems.addAll(citas.where((element) => element.fechaHoraCitaDate.hour == horaItem.hora).toList());
    }

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: CitaConfig.horaList.map((hora) {
        return BlocProvider(
          create: (context) => CitaHoraBloc(),
          child: BlocBuilder<CitaHoraBloc, CitaHoraState>(
            builder: (context, state) {
              return AnimatedSwitcher(
                duration: 0.75.seconds,
                child: state.map(
                  initial: (stt) {
                    context.read<CitaHoraBloc>().add(CitaHoraEvent.initial(hora.listItems));
                    return const SizedBox.shrink();
                  },
                  loading: (stt) {
                    return Container(
                      decoration: const BoxDecoration(
                        color: AppConstColors.lightBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppConstColors.slg01),
                            SvgPicture.asset(
                              AppConstSvgs.logo,
                              height: 25,
                              color: AppConstColors.slgPrincipal,
                            )
                                .animate(
                                  onPlay: (controller) => controller.loop(),
                                )
                                .rotate(
                                  duration: 1.25.seconds,
                                ),
                            const SizedBox.shrink()
                          ],
                        ),
                      ),
                    );
                  },
                  citaBloqueada: (stt) {
                    return Container(
                      key: UniqueKey(),
                      decoration: const BoxDecoration(
                        color: AppConstColors.redSunat,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppConstColors.white),
                                AppBox.w8,
                                Expanded(
                                  child: stt.razonOcupado != null
                                      ? AppTextGlobal.labelLightText(
                                          text: stt.razonOcupado!,
                                          colorText: AppConstColors.white,
                                          textAlign: TextAlign.center,
                                          fontSize: 11,
                                          maxLines: 2,
                                        )
                                      : AppTextGlobal.labelLightText(
                                          text: stt.razonOcupado ?? "OCUPADO",
                                          colorText: AppConstColors.white,
                                          textAlign: TextAlign.center,
                                        ),
                                ),
                                AppBox.w8,
                              ],
                            ),
                          ),
                          // Column(
                          //   crossAxisAlignment: CrossAxisAlignment.stretch,
                          // ),
                        ],
                      ),
                    );
                  },
                  citaLibre: (stt) {
                    return Container(
                      key: UniqueKey(),
                      decoration: const BoxDecoration(
                        color: AppConstColors.lightBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppConstColors.slg01),
                                Row(
                                  children: [
                                    // Visibility(
                                    //   visible: stt.cita.isEmpty,
                                    //   child: GestureDetector(
                                    //     onTap: () {
                                    //       context.read<CitaHoraBloc>().add(CitaHoraEvent.blockCita(onBlock(hora.hora)));
                                    //     },
                                    //     child: const CircleAvatar(
                                    //       minRadius: 2.5,
                                    //       backgroundColor: AppColors.redSunat,
                                    //       foregroundColor: AppColors.white,
                                    //       child: Icon(Icons.block),
                                    //     ),
                                    //   ),
                                    // ),
                                    AppBox.w8,
                                    // GestureDetector(
                                    //   onTap: () {
                                    //     onAdd?.call(hora.hora, hora.horaString);
                                    //   },
                                    //   child: const CircleAvatar(
                                    //     minRadius: 2.5,
                                    //     backgroundColor: AppColors.slg01,
                                    //     foregroundColor: AppColors.white,
                                    //     child: Icon(Icons.add),
                                    //   ),
                                    // )
                                  ],
                                ),
                                AppTextGlobal.labelLightText(text: stt.cita.length.toString(), colorText: AppConstColors.lightGray),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: stt.cita.map((cita) => CitaDoctorCard(cita: cita)).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                  failure: (stt) {
                    return Container(
                      key: UniqueKey(),
                      decoration: const BoxDecoration(
                        color: AppConstColors.lightBackgroundColor,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      margin: const EdgeInsets.symmetric(
                        vertical: 5,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppConstColors.slg01),
                            AppTextGlobal.errorlightText(text: stt.error),
                            const SizedBox.shrink(),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        );
      }).toList(),
    );
  }
}
