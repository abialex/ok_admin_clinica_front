import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_sunat.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_update_bloc/cita_update_bloc.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_update_bloc/cita_update_event.dart';
import 'package:admin_clinica_front/common/utils/validators.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitaUpdateFormAgil extends StatefulWidget {
  final CitaViewModel cita;

  const CitaUpdateFormAgil({
    super.key,
    required this.cita,
  });

  @override
  State<CitaUpdateFormAgil> createState() => _CitaUpdateFormAgilState();
}

class _CitaUpdateFormAgilState extends State<CitaUpdateFormAgil> {
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
          final updateCitaBloc = context.read<CitaUpdateBloc>();
          return Form(
            key: formKey,
            child: Column(
              children: [
                Column(
                  children: [
                    AppBox.h10,
                    InputTextBase(
                      initialText: widget.cita.fechaHoraCita.minute.toString(),
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
                    InputTextBase(
                      initialText: widget.cita.datosPaciente ?? "",
                      inputFormatDeskptop: InputFormatDesktopEnum.letras,
                      textInputType: TextInputType.name,
                      label: "NOMBRES Y APELLIDOS DEL PACIENTE",
                      hintText: "Ingrese Datos Completos",
                      controller: _nombresController,
                      validator: Validators.validateNotEmpty,
                    ),
                    AppBox.h10,
                    InputTextBase(
                      initialText: widget.cita.celular ?? "",
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
                      initialText: widget.cita.razon ?? "",
                      inputFormatDeskptop: InputFormatDesktopEnum.ambos,
                      textInputType: TextInputType.text,
                      label: "RAZÓN",
                      hintText: "Ingrese un razón",
                      controller: _razonController,
                      validator: Validators.validateNotEmpty,
                    ),
                  ],
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
                      text: "MODIFICAR",
                      onClick: () {
                        if (formKey.currentState!.validate()) {
                          updateCitaBloc.add(
                            CitaUpdateEvent.citaUpdateLocal(
                              CitaAgilUpdateViewModel(
                                id: widget.cita.id,
                                estado: widget.cita.estado,
                                doctorId: widget.cita.doctorId,
                                ubicacionId: widget.cita.ubicacionId!,
                                fechaHoraCita: widget.cita.fechaHoraCita.copyWith(
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
