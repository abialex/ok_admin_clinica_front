import 'package:admin_clinica_front/app/common/constants/app_const_icons.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_sunat.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/app/common/utils/validators.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CitaAddFormAgil extends StatefulWidget {
  final int doctorId;
  final DateTime fechaCita;
  final int ubicacionId;
  final int hora;
  const CitaAddFormAgil({
    super.key,
    required this.doctorId,
    required this.fechaCita,
    required this.ubicacionId,
    required this.hora,
  });

  @override
  State<CitaAddFormAgil> createState() => _CitaAddFormAgilState();
}

class _CitaAddFormAgilState extends State<CitaAddFormAgil> {
  final formKey = GlobalKey<FormState>();
  final _nombresController = TextEditingController();
  final _razonController = TextEditingController();
  final _minutoController = TextEditingController();
  final _celularController = TextEditingController();
  double target = 0;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowSunatCubit(),
      child: BlocBuilder<ShowSunatCubit, bool>(
        builder: (context, state) {
          final createCitaBloc = context.read<CitaCreateBloc>();
          return Form(
            key: formKey,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Column(
                  children: [
                    AppBox.h10,
                    InputTextBase(
                      initialText: "00",
                      inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                      textInputType: TextInputType.number,
                      label: "MINUTO",
                      hintText: "Minutos",
                      controller: _minutoController,
                      validator: (value) => Validators.validateWithMultiple(
                        [
                          Validators.validateNotEmpty,
                          (subValue) => Validators.validateNoExceds(subValue, 59),
                        ],
                        value,
                      ),
                      maxlength: 2,
                    ),
                    AppBox.h10,
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: InputTextBase(
                            inputFormatDeskptop: InputFormatDesktopEnum.letras,
                            textInputType: TextInputType.name,
                            label: "NOMBRES Y APELLIDOS DEL PACIENTE",
                            hintText: "Ingrese Datos Completos",
                            controller: _nombresController,
                            validator: Validators.validateNotEmpty,
                          ),
                        ),
                        AppBox.w10,
                        Column(
                          children: [
                            AppTextGlobal.labelLightText(text: ""),
                            AppBox.h10,
                            GestureDetector(
                              onTap: () {
                                showSunat(context);
                                // context.read<ShowSunatCubit>().show();
                              },
                              child: SvgPicture.asset(
                                AppConstIcons.sunatLogo,
                                height: 30,
                              )
                                  .animate(
                                    onPlay: (controller) => controller.loop(),
                                  )
                                  .rotate(
                                    delay: 3.seconds,
                                    duration: 0.5.seconds,
                                  ),
                            ),
                          ],
                        )
                      ],
                    ),
                    AppBox.h10,
                    InputTextBase(
                      inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                      textInputType: TextInputType.number,
                      label: "CELULAR",
                      hintText: "Ingrese un celular",
                      controller: _celularController,
                      validator: (value) => Validators.validateWithMultiple([
                        Validators.validateNotEmpty,
                        (value) => Validators.validateLength(value, 9),
                      ], value),
                      maxlength: 9,
                    ),
                    AppBox.h10,
                    InputTextBase(
                      inputFormatDeskptop: InputFormatDesktopEnum.ambos,
                      textInputType: TextInputType.text,
                      label: "RAZÓN",
                      hintText: "Ingrese un celular",
                      controller: _razonController,
                      validator: Validators.validateNotEmpty,
                    ),
                    AppBox.h20,
                    Row(
                      children: [
                        Expanded(
                            child: ButtonCancel(
                          text: "CANCELAR",
                          onClick: () {
                            Navigator.pop(context);
                          },
                        )),
                        AppBox.w10,
                        Expanded(
                            child: ButtonSuccess(
                          text: "CREAR",
                          onClick: () {
                            if (formKey.currentState!.validate()) {
                              createCitaBloc.add(
                                CitaCreateEvent.citaCreateLocal(
                                  CitaAgilCreateViewModel(
                                    doctorId: widget.doctorId,
                                    ubicacionId: widget.ubicacionId,
                                    fechaHoraCita: widget.fechaCita.copyWith(
                                      hour: widget.hora,
                                      minute: int.parse(_minutoController.text),
                                      second: 0,
                                      millisecond: 0,
                                    ),
                                    datosPaciente: _nombresController.text,
                                    celular: _celularController.text,
                                    razon: _razonController.text,
                                  ),
                                ),
                              );
                            }
                          },
                        )),
                      ],
                    )
                  ],
                ).animate().shimmer(),
                // AnimatedPositioned(
                //   duration: 0.25.seconds,
                //   top: state ? 0 : 7.5,
                //   right: 0,
                //   left: state ? 0 : null,
                //   child: AnimatedSwitcher(
                //     duration: 0.25.seconds,
                //     child: !state
                //         ? GestureDetector(
                //             onTap: () {
                //               showSunat(context);
                //               // context.read<ShowSunatCubit>().show();
                //             },
                //             child: SvgPicture.asset(
                //               AppConstIcons.sunatLogo,
                //               height: 30,
                //             )
                //                 .animate(
                //                   onPlay: (controller) => controller.loop(),
                //                 )
                //                 .rotate(
                //                   delay: 3.seconds,
                //                   duration: 0.5.seconds,
                //                 ),
                //           )
                //         : Container(
                //             padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
                //             decoration: BoxDecoration(
                //               border: Border.all(color: AppColors.slg01),
                //               borderRadius: const BorderRadius.all(Radius.circular(10)),
                //               color: AppColors.lightBackgroundColor,
                //               boxShadow: const [
                //                 BoxShadow(
                //                   color: Colors.black26,
                //                   blurRadius: 10.0,
                //                   offset: Offset(0, 5),
                //                   spreadRadius: 15,
                //                 ),
                //               ],
                //             ),
                //             width: 320,
                //             child: Stack(
                //               children: [
                //                 AppSunatWidget(onTap: (s) {}),
                //                 Positioned(
                //                   top: 1,
                //                   right: 0,
                //                   child: GestureDetector(
                //                     onTap: () {
                //                       context.read<ShowSunatCubit>().hidden();
                //                     },
                //                     child: Container(
                //                       decoration: BoxDecoration(color: AppColors.slg01, borderRadius: BorderRadius.circular(10)),
                //                       child: const Icon(
                //                         Icons.outbond_outlined,
                //                         color: AppColors.white,
                //                       )
                //                           .animate(
                //                             onPlay: (controller) => controller.loop(reverse: true),
                //                           )
                //                           .scale(
                //                             curve: Curves.bounceIn,
                //                             begin: const Offset(1, 1),
                //                             end: const Offset(1.05, 1.05),
                //                             duration: 1.seconds,
                //                             delay: 2.seconds,
                //                           ),
                //                     ),
                //                   ),
                //                 ),
                //               ],
                //             ),
                //           ),
                //   ),
                // ),
              ],
            ),
          );
        },
      ),
    );
  }

  showSunat(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          titlePadding: EdgeInsets.zero,
          insetPadding: EdgeInsets.zero,
          contentPadding: EdgeInsets.zero,
          alignment: Alignment.center,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 2.5),
              child: AppSunatWidget(
                onTap: (sunatPersona) {
                  if (sunatPersona == null) {
                    _nombresController.text = "";
                    // _minutoController.text = "";

                    return;
                  }
                  _nombresController.text = "${sunatPersona.nombres} ${sunatPersona.apellidoPaterno} ${sunatPersona.apellidoMaterno}";
                  // _minutoController.text = sunatPersona.numeroDocumento;
                },
              ),
            )
          ],
        );
      },
    );
  }
}

class ShowSunatCubit extends Cubit<bool> {
  ShowSunatCubit() : super(false);

  void show() {
    emit(true);
  }

  void hidden() {
    emit(false);
  }
}
