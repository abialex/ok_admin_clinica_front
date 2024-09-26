import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/dominio/entities/estado_cita.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_index_bloc/cita_index_bloc.dart';
import 'package:admin_clinica_front/ui/modules/doctor/doctor_index_bloc/doctor_index_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorsAsistenteCard extends StatelessWidget {
  final DoctorsViewModel doctor;
  final Function(int)? onUpdate;

  const DoctorsAsistenteCard({
    super.key,
    required this.doctor,
    this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    const sizeButtonLeft = 25.0;
    // final dialogCubit = context.read<DialogMessageCubit>();
    return BlocProvider(
      create: (context) => DoctorIndexBloc(),
      child: BlocBuilder<DoctorIndexBloc, DoctorIndexState>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.symmetric(
              vertical: 7.5,
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
                context.read<DoctorIndexBloc>().add(DoctorIndexEvent.initial(doctor));
                return const SizedBox.shrink();
              },
              loading: (stt) {
                return const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Center(child: CircularProgressIndicator()),
                );
              },
              doctorLoaded: (stt) {
                return Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Row(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            color: AppConstColors.slg01,
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
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AppBox.h4,
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.person_3_rounded,
                                      color: AppConstColors.slg01,
                                    ),
                                    // AppTextGlobal.labelLightText(text: "Paciente SLG:"),
                                    Expanded(
                                        child: Center(
                                      child: AppTextGlobal.lightText(
                                        text: "${stt.doctor.nombres} ${stt.doctor.apellidos}".toUpperCase(),
                                        fontSize: 13,
                                      ),
                                    )),
                                    AppBox.w6,
                                  ],
                                ),
                                AppBox.h10,
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        AppTextGlobal.labelLightText(text: "USERNAME:", fontSize: 13),
                                        AppBox.w4,
                                        AppTextGlobal.lightText(text: stt.doctor.username, fontSize: 13),
                                      ],
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // AppTextGlobal.labelLightText(text: "Estado:"),
                                        Container(
                                          alignment: Alignment.center,
                                          width: 80,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: 2.5,
                                            horizontal: 5,
                                          ),
                                          decoration: BoxDecoration(
                                            color: stt.doctor.isActive ? AppConstColors.greenAccent : AppConstColors.redSunat,
                                            borderRadius: const BorderRadius.all(
                                              Radius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: AppTextGlobal.labelLightText(
                                            text: stt.doctor.isActive ? "Activo" : "Inactivo",
                                            colorText: AppConstColors.white,
                                            fontSize: 14,
                                          ).animate().flip(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                AppBox.h4,
                                AppBox.h16,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    // *tipó
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
                    //         const Icon(
                    //           Icons.cake_outlined,
                    //           color: AppColors.grey,
                    //           size: 14,
                    //         ),
                    //         AppBox.w4,
                    //         AppTextGlobal.lightText(
                    //           text: stt.doctor.fechaNacimiento.toFormaMMddSlash(),
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
                    //         const Icon(
                    //           Icons.phone,
                    //           color: AppColors.grey,
                    //           size: 14,
                    //         ),
                    //         AppBox.w4,
                    //         AppTextGlobal.lightText(
                    //           text: stt.doctor.celular,
                    //           fontSize: 12,
                    //           colorText: AppColors.grey,
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      top: 0,
                      child: GestureDetector(
                        onTap: () {
                          // AppBottomModal.showBottomModal(
                          //   context,
                          //   header: Column(
                          //     children: [
                          //       AppBox.h10,
                          //       Row(
                          //         crossAxisAlignment: CrossAxisAlignment.center,
                          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //         children: [
                          //           Expanded(
                          //               child: Center(
                          //             child: AppTextGlobal.lightText(
                          //               text: "${stt.doctor.nombres} ${stt.doctor.apellidos}",
                          //               fontSize: 14,
                          //             ),
                          //           )),
                          //         ],
                          //       ),
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
                          //               color: stt.doctor.isActive ? AppColors.greenAccent : AppColors.redSunat,
                          //               borderRadius: const BorderRadius.all(
                          //                 Radius.circular(
                          //                   10,
                          //                 ),
                          //               ),
                          //             ),
                          //             child: AppTextGlobal.labelLightText(
                          //               text: stt.doctor.isActive ? "Activo" : "Inactivo",
                          //               colorText: AppColors.white,
                          //               fontSize: 14,
                          //             ).animate().flip(),
                          //           ),
                          //           Row(
                          //             children: [
                          //               // AppTextGlobal.labelLightText(text: "Hora:"),
                          //               AppTextGlobal.labelLightText(text: stt.doctor.username),
                          //             ],
                          //           )
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          //   body: CustomScrollView(
                          //     slivers: [
                          //       if (stt.doctor.isActive)
                          //         _buildOptionsBottomModal(
                          //           onTap: () {
                          //             dialogCubit.showConfirmationAlert(
                          //               // titulo: "CANCELAR",
                          //               texto: "¿Segura de inactivar al doctor ${stt.doctor.nombres.toUpperCase()} ${stt.doctor.apellidos.toUpperCase()}?",
                          //               onAceptar: () {
                          //                 Navigator.pop(context);
                          //                 context.read<DoctorIndexBloc>().add(DoctorIndexEvent.doctorAction(stt.doctor, DoctorActionEnum.inactivar));
                          //               },
                          //             );
                          //           },
                          //           text: "INACTIVAR",
                          //         ),
                          //       if (!stt.doctor.isActive)
                          //         _buildOptionsBottomModal(
                          //           onTap: () {
                          //             dialogCubit.showConfirmationAlert(
                          //               // titulo: "CANCELAR",
                          //               texto: "¿Segura de activar al doctor ${stt.doctor.nombres.toUpperCase()} ${stt.doctor.apellidos.toUpperCase()}?",
                          //               onAceptar: () {
                          //                 Navigator.pop(context);
                          //                 context.read<DoctorIndexBloc>().add(DoctorIndexEvent.doctorAction(stt.doctor, DoctorActionEnum.activar));
                          //               },
                          //             );
                          //           },
                          //           text: "ACTIVAR",
                          //         ),
                          //       _buildOptionsBottomModal(
                          //         onTap: () {
                          //           onUpdate?.call(stt.doctor.id);
                          //         },
                          //         text: "MODIFICAR",
                          //       ),
                          //       _buildOptionsBottomModal(
                          //         onTap: () {
                          //           dialogCubit.showCustomAlert(
                          //             titulo: "Llamar",
                          //             texto: "Seguro que quiere llamar a ${stt.doctor.apellidos}",
                          //             icon: Icons.phone,
                          //             colorBackground: AppColors.blueSunat,
                          //             onAceptar: () {
                          //               FlutterPhoneDirectCaller.callNumber(stt.doctor.celular);
                          //             },
                          //           );
                          //         },
                          //         text: "LLAMAR",
                          //       ),
                          //       _buildOptionsBottomModal(
                          //         onTap: () {
                          //           dialogCubit.showConfirmationAlert(
                          //               texto: "¿Seguro(a) de reiniciar la contraseñad del doctor ${stt.doctor.nombres.toUpperCase()} ${stt.doctor.apellidos.toUpperCase()}?",
                          //               onAceptar: () {
                          //                 Navigator.pop(context);
                          //                 context.read<DoctorIndexBloc>().add(DoctorIndexEvent.resetPassword(stt.doctor));
                          //               });
                          //         },
                          //         text: "REINICIAR CONTRASEÑA",
                          //       ),
                          //       _buildOptionsBottomModal(
                          //         onTap: () {
                          //           dialogCubit.showInfoAlert(
                          //             // titulo: "CANCELAR",
                          //             texto: "SIN IMPLEMENTAR",
                          //             // icon: Icons.cancel,
                          //             // colorBackground: AppColors.red,
                          //           );
                          //         },
                          //         text: "ENVIAR NOTIFICACIÓN",
                          //       ),
                          //     ],
                          //   ),
                          // );
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            color: AppConstColors.slg01,
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
                                color: AppConstColors.white,
                                size: 13,
                              ),
                              AppBox.h16,
                              const Icon(
                                Icons.circle,
                                color: AppConstColors.white,
                                size: 13,
                              ),
                              AppBox.h16,
                              const Icon(
                                Icons.circle,
                                color: AppConstColors.white,
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
              success: (stt) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      AppTextGlobal.successlightText(text: stt.success),
                      AppBox.h10,
                      ButtonSuccess(
                        text: "OK",
                        onClick: () {
                          context.read<DoctorIndexBloc>().add(DoctorIndexEvent.initial(doctor));
                        },
                      ),
                    ],
                  ),
                );
              },
              failure: (stt) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    children: [
                      AppTextGlobal.errorlightText(text: stt.error),
                      AppBox.h10,
                      ButtonSuccess(
                        text: "OK",
                        onClick: () {
                          context.read<DoctorIndexBloc>().add(DoctorIndexEvent.initial(doctor));
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
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
          margin: const EdgeInsets.symmetric(vertical: 5),
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

  Future<void> doctorAction(BuildContext context, CitasViewModel cita) async {
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
