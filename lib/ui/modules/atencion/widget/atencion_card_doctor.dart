import 'package:admin_clinica_front/core/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/utils/app_cita_config.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/dominio/entities/estado_cita.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_base.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_hora_bloc/cita_hora_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_index_bloc/cita_index_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class AtencionCardDoctor extends StatelessWidget {
  final CitasViewModel cita;

  const AtencionCardDoctor({super.key, required this.cita});

  @override
  Widget build(BuildContext context) {
    const sizeButtonLeft = 25.0;
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
                  color: AppColors.slg01,
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
                          Container(
                            decoration: const BoxDecoration(
                              color: AppColors.slg01,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            width: sizeButtonLeft,
                            child: const Icon(Icons.abc),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppBox.h20,
                                  if (cita.datosPaciente != null)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: AppColors.slg01,
                                        ),
                                        // AppTextGlobal.labelLightText(text: "Paciente SLG:"),
                                        Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.cita.datosPaciente!.toUpperCase()))),
                                        AppBox.w6,
                                      ],
                                    ),
                                  if (cita.pacienteDatos != null)
                                    Row(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        const Icon(
                                          Icons.person,
                                          color: AppColors.slg01,
                                        ),
                                        // AppTextGlobal.labelLightText(text: "Paciente Libre:"),
                                        Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.cita.pacienteDatos!.toUpperCase()))),
                                        AppBox.w6,
                                      ],
                                    ),
                                  AppBox.h10,

                                  if (cita.razon != null)
                                    Row(
                                      children: [
                                        AppTextGlobal.labelLightText(text: "Razón:", fontSize: 13),
                                        AppBox.w4,
                                        AppTextGlobal.lightText(text: stt.cita.razon!, fontSize: 13),
                                      ],
                                    ),
                                  if (cita.razonOcupado != null) ...[
                                    const SizedBox(height: 5.0),
                                    Text('Razón Ocupado: ${stt.cita.razonOcupado}'),
                                  ],
                                  AppBox.h4,

                                  Row(
                                    mainAxisSize: MainAxisSize.min,
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
                                            color: stt.cita.estado.color,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: AppTextGlobal.labelLightText(
                                            text: stt.cita.estadoString,
                                            colorText: AppColors.white,
                                            fontSize: 14,
                                          ).animate().flip()),
                                    ],
                                  ),

                                  // if (cita.fechaConfirmacion != null) ...[
                                  //   const SizedBox(height: 5.0),
                                  //   Text('Fecha de Confirmación: ${cita.fechaConfirmacion}'),
                                  // ],
                                  // if (cita.fechaValidacion != null) ...[
                                  //   const SizedBox(height: 5.0),
                                  //   Text('Fecha de Validación: ${cita.fechaValidacion}'),
                                  // ],
                                  // if (cita.fechaInicio != null) ...[
                                  //   const SizedBox(height: 5.0),
                                  //   Text('Fecha de Inicio: ${cita.fechaInicio}'),
                                  // ],
                                  // if (cita.fechaFin != null) ...[
                                  //   const SizedBox(height: 5.0),
                                  //   Text('Fecha de Fin: ${cita.fechaFin}'),
                                  // ],

                                  AppBox.h10,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      // *hora
                      Positioned(
                        left: -0,
                        top: -15,
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2.5),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                            color: AppColors.white,
                            border: Border(
                              left: BorderSide(
                                color: AppColors.slg01,
                                width: 0.3,
                              ),
                              top: BorderSide(
                                color: AppColors.slg01,
                                width: 0.3,
                              ),
                              right: BorderSide(
                                color: AppColors.slg01,
                                width: 0.2999,
                                // width: 1,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              const Icon(
                                Icons.av_timer_rounded,
                                color: AppColors.slg01,
                              ),
                              // AppTextGlobal.labelLightText(text: "Hora:"),
                              AppBox.w2,
                              AppTextGlobal.labelLightText(text: stt.cita.fechaHoraCita.toFormatHHmm()),
                            ],
                          ),
                        ),
                      ),
                      // *tipó
                      Positioned(
                        bottom: 5,
                        right: 2.5,
                        child: () {
                          switch (stt.cita.estado) {
                            case EstadoCita.pendiente:
                              return _buildActionState(
                                onTap: () {
                                  // nextCita(context, stt.cita);
                                },
                                builder: () {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppTextGlobal.labelLightText(text: "No ha llegado", fontSize: 12),
                                    ],
                                  );
                                },
                              );

                            case EstadoCita.confirmado:
                              return _buildActionState(
                                onTap: () {
                                  nextCita(context, stt.cita);
                                },
                                builder: () {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppTextGlobal.labelLightText(text: "Empezar", fontSize: 18, colorText: AppColors.yellow),
                                      AppBox.w2,
                                      const Icon(
                                        Icons.warning,
                                        color: AppColors.yellow,
                                        size: 20,
                                      )
                                          .animate(
                                            onPlay: (controller) => controller.loop(reverse: true),
                                          )
                                          .shake(delay: 2.5.seconds, duration: 0.5.seconds),
                                    ],
                                  );
                                },
                              );

                            case EstadoCita.atendiendo:
                              return _buildActionState(
                                onTap: () {
                                  nextCita(context, stt.cita);
                                },
                                builder: () {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppTextGlobal.labelLightText(text: "Finalizar", fontSize: 18, colorText: EstadoCita.finalizado.color),
                                      AppBox.w2,
                                      SvgPicture.asset(
                                        AppConstSvgs.state_finalizado,
                                        height: 20,
                                        color: EstadoCita.finalizado.color,
                                      )
                                          .animate(
                                            onPlay: (controller) => controller.loop(reverse: true),
                                          )
                                          .shake(delay: 2.5.seconds, duration: 0.5.seconds),
                                    ],
                                  );
                                },
                              );

                            case EstadoCita.finalizado:
                              return _buildActionState(
                                onTap: () {
                                  nextCita(context, stt.cita);
                                },
                                builder: () {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      AppTextGlobal.labelLightText(text: "", fontSize: 12),
                                    ],
                                  );
                                },
                              );
                            case EstadoCita.validado:
                              return _buildActionState(
                                onTap: () {
                                  // nextCita(context, stt.cita);
                                },
                                builder: () {
                                  return Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      // AppTextGlobal.labelLightText(text: "Concluido", fontSize: 12),
                                      // AppBox.w2,
                                      SvgPicture.asset(
                                        AppConstSvgs.state_validado,
                                        height: 15,
                                        color: EstadoCita.validado.color,
                                      ),
                                    ],
                                  );
                                },
                              );

                            case EstadoCita.cancelado:
                              return const SizedBox.shrink();

                            default:
                              return ButtonCustomBase(
                                backgroundColor: stt.cita.estado.color,
                                textColor: AppColors.white,
                                text: "N.A",
                                onClick: () {
                                  // nextCita(context, stt.cita);
                                },
                              );
                          }
                        }(),
                      ),

                      // Positioned(
                      //   bottom: 2,
                      //   right: 2,
                      //   child: Container(
                      //     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                      //     decoration: const BoxDecoration(
                      //       // borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
                      //       color: AppColors.white,
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
                      //           colorText: AppColors.grey,
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

                      Positioned(
                        bottom: 0,
                        left: 0,
                        top: 17.5,
                        child: GestureDetector(
                          onTap: () {
                            // AppBottomModal.showBottomModal(
                            //   context,
                            //   header: Column(
                            //     children: [
                            //       AppBox.h10,
                            //       if (cita.datosPaciente != null)
                            //         Row(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.cita.datosPaciente!.toUpperCase()))),
                            //           ],
                            //         ),
                            //       if (cita.pacienteDatos != null)
                            //         Row(
                            //           crossAxisAlignment: CrossAxisAlignment.center,
                            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //           children: [
                            //             Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.cita.pacienteDatos!.toUpperCase()))),
                            //           ],
                            //         ),
                            //       AppBox.h10,
                            //       Row(
                            //         mainAxisSize: MainAxisSize.max,
                            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            //         children: [
                            //           // AppTextGlobal.labelLightText(text: "Estado:"),
                            //           Container(
                            //             alignment: Alignment.center,
                            //             width: 110,
                            //             padding: const EdgeInsets.symmetric(
                            //               vertical: 2.5,
                            //               horizontal: 5,
                            //             ),
                            //             decoration: BoxDecoration(
                            //               color: stt.cita.estado.color,
                            //               borderRadius: const BorderRadius.all(
                            //                 Radius.circular(
                            //                   10,
                            //                 ),
                            //               ),
                            //             ),
                            //             child: AppTextGlobal.labelLightText(
                            //               text: stt.cita.estadoString,
                            //               colorText: AppColors.white,
                            //               fontSize: 14,
                            //             ).animate().flip(),
                            //           ),
                            //           Row(
                            //             children: [
                            //               const Icon(
                            //                 Icons.av_timer_rounded,
                            //                 color: AppColors.slg01,
                            //               ),
                            //               // AppTextGlobal.labelLightText(text: "Hora:"),
                            //               AppBox.w2,
                            //               AppTextGlobal.labelLightText(text: stt.cita.fechaHoraCita.toFormatHHmm()),
                            //             ],
                            //           )
                            //         ],
                            //       ),
                            //     ],
                            //   ),
                            //   body: CustomScrollView(
                            //     slivers: [
                            //       if (stt.cita.estado == EstadoCita.pendiente)
                            //         _buildOptionsBottomModal(
                            //           onTap: () {
                            //             Navigator.pop(context);
                            //             Navigator.pushNamed(
                            //               context,
                            //               Routes.base_asistenteRecepcion + Routes.cita_update,
                            //             );
                            //             context.read<CitaUpdateBloc>().add(CitaUpdateEvent.citaGetById(stt.cita.id));
                            //           },
                            //           text: "MODIFICAR",
                            //         ),
                            //       if (stt.cita.estado == EstadoCita.pendiente)
                            //         _buildOptionsBottomModal(
                            //           onTap: () {
                            //             dialogCubit.showCustomAlert(
                            //               titulo: "CANCELAR",
                            //               texto: "SIN IMPLEMENTAR",
                            //               icon: Icons.cancel,
                            //               colorBackground: AppColors.red,
                            //             );
                            //           },
                            //           text: "CANCELAR",
                            //         ),
                            //       if (stt.cita.celular != null)
                            //         _buildOptionsBottomModal(
                            //           onTap: () {
                            //             dialogCubit.showCustomAlert(
                            //               titulo: "Llamar",
                            //               texto: "Seguro que quiere llamar a ${stt.cita.datosPaciente ?? (stt.cita.pacienteDatos ?? "No tiene nombre")}",
                            //               icon: Icons.phone,
                            //               colorBackground: AppColors.blueSunat,
                            //               onAceptar: () {
                            //                 FlutterPhoneDirectCaller.callNumber(stt.cita.celular!);
                            //               },
                            //             );
                            //           },
                            //           text: "LLAMAR",
                            //         ),
                            //     ],
                            //   ),
                            // );
                          },
                          child: Container(
                            decoration: const BoxDecoration(
                              color: AppColors.slg01,
                              borderRadius: BorderRadius.only(
                                bottomRight: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                            ),
                            width: sizeButtonLeft,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.circle,
                                  color: AppColors.white,
                                  size: 13,
                                ),
                                AppBox.h16,
                                const Icon(
                                  Icons.circle,
                                  color: AppColors.white,
                                  size: 13,
                                ),
                                AppBox.h16,
                                const Icon(
                                  Icons.circle,
                                  color: AppColors.white,
                                  size: 13,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  );
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
            color: AppColors.slg01,
            borderRadius: BorderRadius.all(
              Radius.circular(10),
            ),
          ),
          child: Row(
            children: [
              AppBox.w10,
              const Icon(
                Icons.circle,
                color: AppColors.white,
                size: 10,
              ),
              AppBox.w10,
              AppTextGlobal.lightText(
                text: text,
                colorText: AppColors.white,
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

  Future<void> nextCita(BuildContext context, CitasViewModel cita) async {
    final bloc = context.read<CitaIndexBloc>();
    final dialogCubit = context.read<DialogMessageCubit>();
    late String titulo;
    late String texto;
    late TipoAccionEnum tipoAccion;
    switch (cita.estado) {
      case EstadoCita.pendiente:
        titulo = "¿Seguro(a) de confirmar?";
        texto = "la cita estará pendiente para que el doctor acepte, una vez confirmada la cita ya no se podrá modificar.";
        tipoAccion = TipoAccionEnum.confirmar;

      case EstadoCita.confirmado:
        titulo = "¿Seguro(a) empezar?";
        texto = "Al confirmar, cuando termine no olvidé finalizar la Atención";
        dialogCubit.showConfirmationAlert(
            texto: texto,
            onAceptar: () {
              bloc.add(CitaIndexEvent.nextCita(cita, TipoAccionEnum.iniciar));
            });

        return;
      case EstadoCita.atendiendo:
        titulo = "Todavía en atención!";
        texto = "¿va a finalizar la cita?";
        dialogCubit.showConfirmationAlert(
            texto: texto,
            onAceptar: () {
              bloc.add(CitaIndexEvent.nextCita(cita, TipoAccionEnum.finalizar));
            });
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

class CitasGroupedByHourAtencionDoctor extends StatelessWidget {
  final List<CitasViewModel> citas;
  final Function(int, String)? onAdd;
  final CitaOcupadaCreateViewModel Function(int) onBlock;
  final Function(int)? onRelease;

  const CitasGroupedByHourAtencionDoctor({
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
      if (horaItem.hora >= (DateTime.now().hour - 2)) {
        horaItem.listItems.addAll(citas.where((element) => element.estado != EstadoCita.validado && element.estado != EstadoCita.cancelado).toList());
      }
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
                        color: AppColors.lightBackgroundColor,
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
                            AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppColors.slg01),
                            SvgPicture.asset(
                              AppConstSvgs.logo,
                              height: 25,
                              color: AppColors.slgPrincipal,
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
                    return const SizedBox.shrink();
                  },
                  citaLibre: (stt) {
                    if (stt.cita.isEmpty) {
                      return const SizedBox.shrink();
                    }

                    return Container(
                      key: UniqueKey(),
                      decoration: const BoxDecoration(
                        color: AppColors.lightBackgroundColor,
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
                                AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppColors.slg01),
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
                                AppTextGlobal.labelLightText(text: stt.cita.length.toString(), colorText: AppColors.lightGray),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: stt.cita.map((cita) => AtencionCardDoctor(cita: cita)).toList(),
                          ),
                        ],
                      ),
                    );
                  },
                  failure: (stt) {
                    return Container(
                      key: UniqueKey(),
                      decoration: const BoxDecoration(
                        color: AppColors.lightBackgroundColor,
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
                            AppTextGlobal.labelMediumText(text: hora.horaString2, colorText: AppColors.slg01),
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
