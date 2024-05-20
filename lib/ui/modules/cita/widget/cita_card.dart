import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/utils/app_cita_config.dart';
import 'package:admin_clinica_front/dominio/entities/tipo_cita.dart';
import 'package:admin_clinica_front/dominio/services/citas_service.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/ui/modules/cita/bloc/cita_index_bloc/cita_index_bloc.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CitasCard extends StatelessWidget {
  final CitasViewModel cita;

  const CitasCard({super.key, required this.cita});

  @override
  Widget build(BuildContext context) {
    final dialogCubit = context.read<DialogMessageCubit>();
    return BlocProvider(
      create: (context) => CitaIndexBloc(),
      child: BlocBuilder<CitaIndexBloc, CitaIndexState>(
        builder: (context, state) {
          final bloc = context.read<CitaIndexBloc>();
          return Container(
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                border: Border.all(color: cita.estado.color),
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
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 5.0),
                            Text('Hora: ${stt.cita.fechaHoraCita.toFormatHHmm()}'),
                            const SizedBox(height: 5.0),
                            Text('Estado: ${stt.cita.estadoString}').animate().flip(),
                            const SizedBox(height: 5.0),
                            Text('Tipo: ${stt.cita.tipoString}'),
                            if (cita.celular != null) ...[
                              const SizedBox(height: 5.0),
                              Text('Celular: ${stt.cita.celular}'),
                            ],
                            if (cita.razon != null) ...[
                              const SizedBox(height: 5.0),
                              Text('Razón: ${stt.cita.razon}'),
                            ],
                            if (cita.razonOcupado != null) ...[
                              const SizedBox(height: 5.0),
                              Text('Razón Ocupado: ${stt.cita.razonOcupado}'),
                            ],
                            if (cita.datosPaciente != null) ...[
                              const SizedBox(height: 5.0),
                              Text('Paciente de SLG : ${stt.cita.datosPaciente}'),
                            ],
                            if (cita.pacienteDatos != null) ...[
                              const SizedBox(height: 5.0),
                              Text('Paciente libre: ${stt.cita.pacienteDatos}'),
                            ],
                            const Row(
                              children: [ButtonSuccess(text: "editar"), ButtonCancel(text: "eliminar")],
                            )
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
                          ],
                        ),
                      ),
                      Positioned(
                        right: -10,
                        top: -15,
                        child: ButtonSuccess(
                          text: () {
                            switch (stt.cita.estado) {
                              case EstadoCita.pendiente:
                                return "Confirmar";

                              case EstadoCita.confirmado:
                                return "Validar ojo";

                              case EstadoCita.atendiendo:
                                return "No puede";

                              case EstadoCita.finalizado:
                                return "Validar";
                              case EstadoCita.validado:
                                return "Concluido";

                              default:
                                return "Acccion no soportada";
                            }
                          }(),
                          onClick: () {
                            nextCita(context, stt.cita);
                          },
                        ),
                      ),
                    ],
                  );
                },
                failure: (stt) {
                  return Container(
                      padding: EdgeInsets.symmetric(
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

  Future<void> nextCita(BuildContext context, CitasViewModel cita) async {
    final bloc = context.read<CitaIndexBloc>();
    final dialogCubit = context.read<DialogMessageCubit>();
    late String titulo;
    late String texto;
    late TipoAccionEnum tipoAccion;
    switch (cita.estado) {
      case EstadoCita.pendiente:
        titulo = "¿Seguro(a) de confirmar?";
        texto = "la cita estará pendiente para que el doctor acepte";
        tipoAccion = TipoAccionEnum.confirmar;

      case EstadoCita.confirmado:
        titulo = "¿Seguro(a) de querer validar?";
        texto = "Está permitido validar si el doctor no inició la atención";
        tipoAccion = TipoAccionEnum.validar;
      case EstadoCita.atendiendo:
        titulo = "Todavía en atención!";
        texto = "el doctor no ha finalizado la cita";
        dialogCubit.showDialog(titulo: titulo, texto: texto);
        return;

      case EstadoCita.finalizado:
        titulo = "¿Seguro(a) de validar?";
        texto = "la cita estará pendiente para que el doctor acepte";
        tipoAccion = TipoAccionEnum.validar;
      case EstadoCita.validado:
        titulo = "la cita ya está concluida";
        texto = ":)";
        dialogCubit.showDialog(titulo: titulo, texto: texto);
        return;

      default:
        texto = "Estado no soportado en este caso";
        titulo = "Permisos de asistenta de recepción";
        dialogCubit.showDialog(titulo: titulo, texto: texto);
        return;
    }
    dialogCubit.showDialog(
      titulo: titulo,
      texto: texto,
      onAceptar: () {
        bloc.add(CitaIndexEvent.nextCita(cita, tipoAccion));
      },
    );
  }
}

class CitasGroupedByHour extends StatelessWidget {
  final List<CitasViewModel> citas;

  const CitasGroupedByHour({super.key, required this.citas});

  @override
  Widget build(BuildContext context) {
    for (var horaItem in CitaConfig.horaList) {
      horaItem.listItems.clear();
      horaItem.listItems.addAll(citas.where((element) => element.fechaHoraCita.hour == horaItem.hora).toList());
    }

    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      children: CitaConfig.horaList.map((hora) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                hora.horaString2,
                style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: hora.listItems.map((cita) => CitasCard(cita: cita)).toList(),
            ),
          ],
        );
      }).toList(),
    );
  }
}
