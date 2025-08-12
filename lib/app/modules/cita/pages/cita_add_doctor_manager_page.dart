import 'package:admin_clinica_front/app/common/constants/app_const_icons.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/models/cita/cita_agil/cita_agil_create.dart';
import 'package:admin_clinica_front/app/common/models/request/request_model.dart';
import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_dto.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/blocs/usuario_session/bloc/usuario_bloc.dart';
import 'package:admin_clinica_front/app/common/utils/validators.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_construccion.dart';
import 'package:admin_clinica_front/app/common/widget/app_sunat.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/checkbox/app_check_box_label_blue_r_10.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/app_multi_select_form.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/custom_multi_select.dart';
import 'package:admin_clinica_front/app/common/widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_bloc.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_bloc.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_event.dart';
import 'package:admin_clinica_front/app/modules/cita/bloc/cita_crear_bloc/cita_create_state.dart';
import 'package:admin_clinica_front/app/modules/cita/widget/form_pages.dart';
import 'package:admin_clinica_front/app/modules/ubicacion/bloc/ubicacion_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class CitaAddDoctorManagerPage extends StatelessWidget with ResponsiveWidgetMixin {
  CitaAddDoctorManagerPage({super.key});

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
                    CitaRequest(
                      doctorId: stt.doctorId,
                      ubicacionesId: stt.ubicacionesId,
                      fechaHoraCita: stt.fechaCita.toFormatyyyyMMdd(),
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
    );
  }
}

class CitaAddFormOcupada extends StatefulWidget {
  const CitaAddFormOcupada({super.key});

  @override
  State<CitaAddFormOcupada> createState() => _CitaAddFormOcupadaState();
}

class _CitaAddFormOcupadaState extends State<CitaAddFormOcupada> {
  final formKey = GlobalKey<FormState>();
  final _nombresController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppBox.h20,
          InputTextBase(
            inputFormatDeskptop: InputFormatDesktopEnum.letras,
            textInputType: TextInputType.name,
            label: "Razón",
            hintText: "Ingrese Nombres",
            controller: _nombresController,
            validator: Validators.validateNotEmpty,
          ),
          AppBox.h10,
        ],
      ).animate().shimmer(),
    );
  }
}

class CitaAddFormAgil extends StatefulWidget {
  final int doctorId;
  final DateTime fechaCita;
  final int hora;
  const CitaAddFormAgil({
    super.key,
    required this.doctorId,
    required this.fechaCita,
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
  final _ubicacionesList = <UbicacionDto>[];

  double target = 0;

  @override
  Widget build(BuildContext context) {
    final ubicacionBloc = context.read<UbicacionBloc>();

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
                    BlocBuilder<UbicacionBloc, UbicacionState>(
                      bloc: ubicacionBloc,
                      builder: (context, state) {
                        return state.map(
                          initial: (stt) {
                            ubicacionBloc.add(GetUbicaciones());
                            return const Text("initial");
                          },
                          loading: (stt) {
                            return const Text("loading");
                          },
                          ubicacionLoaded: (stt) {
                            final ubicacionesList = stt.ubicaciones
                                .map(
                                  (e) => MultiSelectItem<UbicacionDto>(
                                    id: e.id,
                                    item: e,
                                  ),
                                )
                                .toList();
                            return MultiSelectForm<UbicacionDto>(
                              isMultiSelect: false,
                              validatorParent: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Debe seleccionar al menos una ubicación';
                                }
                                return null;
                              },
                              contexts: context,
                              items: ubicacionesList,
                              onSelect: (p0) {
                                _ubicacionesList.clear();
                                _ubicacionesList.addAll(p0.map((e) => e.item).toList());
                              },
                              itemBuilder: (context, item, isSelect) {
                                return IgnorePointer(
                                  child: CheckBoxLabelBlueR10(
                                    onChanged: () {},
                                    text: item.nombre,
                                    value: isSelect,
                                  ),
                                );
                              },
                            );
                          },
                          failure: (stt) {
                            return const Text("error");
                          },
                        );
                      },
                    ),
                    AppBox.h10,
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
                                  CitaAgilCreateModel(
                                    doctorId: widget.doctorId,
                                    ubicacionId: _ubicacionesList.first.id,
                                    fechaHoraCita: widget.fechaCita
                                        .copyWith(
                                          hour: widget.hora,
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
