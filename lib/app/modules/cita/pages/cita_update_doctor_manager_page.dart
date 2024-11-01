import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_update_model.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_dto.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/utils/validators.dart';
import 'package:admin_clinica_front/app/common/widget/app_sunat.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/app/common/widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
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
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_bloc.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_update_bloc/cita_update_bloc.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_update_bloc/cita_update_event.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_update_bloc/cita_update_state.dart';
import 'package:admin_clinica_front/app/modules/cita/pages/cita_add_doctor_manager_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CitaUpdateDoctorManagerPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaUpdateDoctorManagerPage({super.key});

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
                    if (stt.citaViewModel.paciente != null)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Icon(
                            Icons.person,
                            color: AppConstColors.slg01,
                          ),
                          Expanded(child: Center(child: AppTextGlobal.lightText(text: stt.citaViewModel.paciente!.nombres!.toUpperCase()))),
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
                            color: stt.citaViewModel.estadoEnum.color,
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
                            AppTextGlobal.labelLightText(text: stt.citaViewModel.fechaHoraCitaDate.toFormatHHmm()),
                          ],
                        )
                      ],
                    ),
                    AppBox.h10,
                    () {
                      switch (stt.citaViewModel.tipoEnum) {
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
                citaBloc.add(GetCitas(CitaRequest(
                  doctorId: stt.doctorId,
                  ubicacionesId: stt.ubicacionesId,
                  fechaHoraCita: stt.fechaCita.toFormatyyyyMMdd(),
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

class CitaUpdateFormAgil extends StatefulWidget {
  final CitaDTO cita;

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
                      initialText: widget.cita.fechaHoraCitaDate.minute.toString(),
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
                              CitaAgilUpdateModel(
                                id: widget.cita.id,
                                estado: EstadoCitaExtension.fromEstado(widget.cita.estadoEnum),
                                doctorId: widget.cita.doctorId!,
                                ubicacionId: widget.cita.ubicacionId!,
                                fechaHoraCita: widget.cita.fechaHoraCitaDate
                                    .copyWith(
                                      minute: int.parse(_minutoController.text),
                                      second: 0,
                                      millisecond: 0,
                                    )
                                    .toIso8601String(),
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
