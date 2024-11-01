// ignore_for_file: must_be_immutable
import 'package:admin_clinica_front/app/common/models/doctor/doctor_create_model.dart';
import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_dto.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/list_string_extensions.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_sunat.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/checkbox/app_check_box_label_blue_r_10.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/app_multi_select_form.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/custom_multi_select.dart';
import 'package:admin_clinica_front/app/common/widget/input_text/input_form_02/input_text_action_date.dart';
import 'package:admin_clinica_front/app/common/widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/app/common/widget/page/desktop/app_responsive_desktop_card.dart';
import 'package:admin_clinica_front/app/common/widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/ui/modules/doctor/bloc/doctor_create_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/ubicacion/bloc/ubicacion_bloc.dart';
import 'package:admin_clinica_front/app/common/utils/validators.dart';
import 'package:admin_clinica_front/app/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../config/app_dependecy_injection.dart';
import '../../../../common/constants/app_const_colors.dart';
import '../../../../common/service/doctor_api.dart';
import '../../../../data/repository/storage/ilocal_repository.dart';
import '../../../../common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import '../../../../common/widget/page/page_mixin_base.dart';

class DoctorAddAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  DoctorAddAsistenteRecepcionPage({super.key});

  final formKey = GlobalKey<FormState>();
  DoctorCreateViewModel muDoctor = DoctorCreateViewModel(
    dni: "",
    nombres: "",
    apellidos: "",
    celular: "",
    fechaNacimiento: DateTime.now(),
    ubicacionesId: [],
  );

  DateTime? _fechaNacimientoSelected;
  final _ubicacionesList = <UbicacionDto>[];

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    final ubicacionBloc = context.read<UbicacionBloc>();
    final doctorListBloc = context.read<DoctorListBloc>();
    final doctorCreateBloc = context.read<DoctorCreateBloc>();
    final dniController = TextEditingController();
    final celularController = TextEditingController();
    final apellidosController = TextEditingController();
    final nombresController = TextEditingController();

    return PageBaseDesktop(
      backgroundColor: AppConstColors.white,
      title: "CREAR DOCTOR",
      bodyWidget: AppResponsiveDesktopCard(
        widget: SingleChildScrollView(
          child: Container(
            alignment: Alignment.center,
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  AppSunatWidget(
                    onTap: (sunatPersona) {
                      if (sunatPersona == null) {
                        nombresController.text = "";
                        apellidosController.text = "";
                        dniController.text = "";

                        return;
                      }
                      nombresController.text = sunatPersona.nombres;
                      apellidosController.text = "${sunatPersona.apellidoPaterno} ${sunatPersona.apellidoMaterno}";
                      dniController.text = sunatPersona.numeroDocumento;
                    },
                  ),
                  AppBox.h40,
                  Row(
                    children: [
                      Expanded(
                        child: InputTextBase(
                          inputFormatDeskptop: InputFormatDesktopEnum.letras,
                          textInputType: TextInputType.name,
                          label: "NOMBRES",
                          hintText: "Ingrese Nombres",
                          controller: nombresController,
                          validator: Validators.validateNotEmpty,
                        ),
                      ),
                      AppBox.w10,
                      Expanded(
                        child: InputTextBase(
                          inputFormatDeskptop: InputFormatDesktopEnum.letras,
                          textInputType: TextInputType.name,
                          label: "APELLIDOS",
                          hintText: "Ingrese Apellidos",
                          controller: apellidosController,
                          validator: Validators.validateNotEmpty,
                        ),
                      ),
                    ],
                  ),
                  AppBox.h10,
                  InputTextBase(
                    inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                    textInputType: TextInputType.number,
                    label: "DNI",
                    hintText: "Ingrese DNI",
                    controller: dniController,
                    validator: (value) => Validators.validateLength(value, 8),
                    maxlength: 8,
                  ),
                  AppBox.h10,
                  InputTextBase(
                    onChanged: (p0) {
                      muDoctor.celular = p0;
                    },
                    inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                    textInputType: TextInputType.number,
                    label: "CELULAR",
                    hintText: "Ingrese un celular",
                    controller: celularController,
                    validator: (value) => Validators.validateWithMultiple([
                      Validators.validateNotEmpty,
                      (value) => Validators.validateLength(value, 9),
                    ], value),
                    maxlength: 9,
                  ),
                  AppBox.h10,
                  InputTextDate(
                    label: "FECHA NACIMIENTO",
                    hintText: "Día/Mes/Año",
                    initialText: "",
                    helper: "Día/Mes/Año",
                    maxDate: DateTime.now(),
                    minDate: DateTime(1940),
                    validator: Validators.validateNotEmpty,
                    changeDate: (fechaString, fecha) {
                      _fechaNacimientoSelected = fecha;
                    },
                  ),
                  AppBox.h10,
                  AppTextGlobal.labelLightText(text: "UBICACIÓN"),
                  AppBox.h10,
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
                  Container(
                    height: 75,
                    padding: const EdgeInsets.only(top: 30),
                    color: AppConstColors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: ButtonCancel(
                                text: "CANCELAR",
                                onClick: () {
                                  Navigator.pop(context);
                                },
                              ),
                            ),
                            AppBox.w10,
                            Expanded(
                              child: ButtonSuccess(
                                text: "CREAR",
                                onClick: () async {
                                  if (formKey.currentState!.validate()) {
                                    // Si el formulario es válido, muestra un Snackbar
                                    final model = DoctorCreateModel(
                                      dni: dniController.text,
                                      nombres: nombresController.text,
                                      apellidos: apellidosController.text,
                                      celular: muDoctor.celular,
                                      fechaNacimiento: _fechaNacimientoSelected!.toFormatyyyyMMdd(),
                                      ubicaciones_id: _ubicacionesList.map((e) => e.id).toList(),
                                    );
                                    doctorCreateBloc.add(DoctorCreateEvent.createDoctor(model));
                                    Navigator.pop(context);
                                    await showDialog(
                                      context: context,
                                      builder: (context) {
                                        return BlocBuilder<DoctorCreateBloc, DoctorCreateState>(
                                          builder: (context, state) {
                                            return Dialog(
                                              insetPadding: const EdgeInsets.symmetric(vertical: 155, horizontal: 50),
                                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                              child: Stack(
                                                clipBehavior: Clip.none,
                                                alignment: Alignment.center,
                                                children: [
                                                  Container(
                                                    constraints: const BoxConstraints.expand(),
                                                    decoration: const BoxDecoration(color: AppConstColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                                    child: doctorCreateBloc.state.map(
                                                      initial: (stt) {
                                                        return const SizedBox.shrink();
                                                      },
                                                      loading: (stt) {
                                                        return const CircularProgressIndicator();
                                                      },
                                                      doctorsLoaded: (stt) {
                                                        return Container(
                                                          padding: const EdgeInsets.symmetric(
                                                            horizontal: 10,
                                                            vertical: 15,
                                                          ),
                                                          child: Column(
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              RichText(
                                                                textAlign: TextAlign.justify,
                                                                text: TextSpan(
                                                                  style: AppTextGlobal.lightText(text: "").style,
                                                                  children: [
                                                                    const TextSpan(
                                                                      text: 'Se creó el doctor ',
                                                                    ),
                                                                    TextSpan(
                                                                      text: "${model.nombres.toUpperCase()} ${model.apellidos.toUpperCase()}",
                                                                      style: AppTextGlobal.labelLightText(text: "").style,
                                                                    ),
                                                                    const TextSpan(
                                                                      text: ' con fecha de nacimiento ',
                                                                    ),
                                                                    TextSpan(
                                                                      text: model.fechaNacimiento,
                                                                      style: AppTextGlobal.labelLightText(text: "").style,
                                                                    ),
                                                                    const TextSpan(
                                                                      text: ' con ubicaciones en ',
                                                                    ),
                                                                    TextSpan(
                                                                      text: _ubicacionesList.map((e) => e.nombre).toList().toStringByMidFijo("y"),
                                                                      style: AppTextGlobal.labelLightText(text: "").style,
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Row(
                                                                children: [
                                                                  AppTextGlobal.labelLightText(text: "Sus credenciales son:", fontSize: 18, textAlign: TextAlign.left),
                                                                ],
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    children: [
                                                                      Expanded(child: AppTextGlobal.labelLightText(text: "Username:", fontSize: 18, textAlign: TextAlign.end)),
                                                                      AppBox.w10,
                                                                      Expanded(child: AppTextGlobal.lightText(text: "slg_01", fontSize: 18)),
                                                                    ],
                                                                  ),
                                                                  Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                                    children: [
                                                                      Expanded(child: AppTextGlobal.labelLightText(text: "Contraseña:", fontSize: 18, textAlign: TextAlign.end)),
                                                                      AppBox.w10,
                                                                      Expanded(child: AppTextGlobal.lightText(text: "12343556", fontSize: 18)),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              ButtonSuccess(
                                                                text: "OK",
                                                                onClick: () {
                                                                  Navigator.pop(context);
                                                                },
                                                              ),
                                                            ],
                                                          ),
                                                        );
                                                      },
                                                      failure: (stt) {
                                                        return Text(stt.error);
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                    );
                                    doctorListBloc.add(DoctorListEvent.getDoctors());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    // final doctorBloc = context.read<DoctorBloc>();

    final ubicacionBloc = context.read<UbicacionBloc>();
    final doctorCreateBloc = context.read<DoctorCreateBloc>();
    final doctorListBloc = context.read<DoctorListBloc>();
    final dniController = TextEditingController();
    final celularController = TextEditingController();
    final apellidosController = TextEditingController();
    final nombresController = TextEditingController();

    return PageBasePhone(
      showNavbar: false,
      headerWidget: const HeaderMobile(
        title: "CREAR DOCTOR",
        logoutActive: false,
      ),
      bodySliver: SliverToBoxAdapter(
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AppSunatWidget(
                onTap: (sunatPersona) {
                  if (sunatPersona == null) {
                    nombresController.text = "";
                    apellidosController.text = "";
                    dniController.text = "";

                    return;
                  }
                  nombresController.text = sunatPersona.nombres;
                  apellidosController.text = "${sunatPersona.apellidoPaterno} ${sunatPersona.apellidoMaterno}";
                  dniController.text = sunatPersona.numeroDocumento;
                },
              ),
              AppBox.h20,
              InputTextBase(
                inputFormatDeskptop: InputFormatDesktopEnum.letras,
                textInputType: TextInputType.name,
                label: "NOMBRES",
                hintText: "Ingrese Nombres",
                controller: nombresController,
                validator: Validators.validateNotEmpty,
              ),
              AppBox.h10,
              InputTextBase(
                inputFormatDeskptop: InputFormatDesktopEnum.letras,
                textInputType: TextInputType.name,
                label: "APELLIDOS",
                hintText: "Ingrese Apellidos",
                controller: apellidosController,
                validator: Validators.validateNotEmpty,
              ),
              AppBox.h10,
              InputTextBase(
                inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                textInputType: TextInputType.number,
                label: "DNI",
                hintText: "Ingrese DNI",
                controller: dniController,
                validator: (value) => Validators.validateLength(value, 8),
                maxlength: 8,
              ),
              AppBox.h10,
              InputTextBase(
                onChanged: (value) {
                  muDoctor.celular = value;
                },
                inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                textInputType: TextInputType.number,
                label: "CELULAR",
                hintText: "Ingrese un celular",
                controller: celularController,
                validator: (value) => Validators.validateWithMultiple([
                  Validators.validateNotEmpty,
                  (value) => Validators.validateLength(value, 9),
                ], value),
                maxlength: 9,
              ),
              AppBox.h10,
              InputTextDate(
                label: "FECHA NACIMIENTO",
                hintText: "Fecha nacimiento",
                initialText: "",
                helper: "Ingrese la fecha de nacimiento del Doctor",
                maxDate: DateTime.now(),
                minDate: DateTime(1940),
                validator: Validators.validateNotEmpty,
                changeDate: (fechaString, fecha) {
                  _fechaNacimientoSelected = fecha;
                },
              ),
              AppBox.h10,
              AppTextGlobal.labelLightText(text: "UBICACIÓN"),
              AppBox.h10,
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
            ],
          ),
        ),
      ),
      footerSliver: Container(
        height: 75,
        padding: const EdgeInsets.only(top: 30),
        color: AppConstColors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: ButtonCancel(
                    text: "CANCELAR",
                    onClick: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                AppBox.w10,
                Expanded(
                  child: ButtonSuccess(
                    text: "CREAR",
                    onClick: () async {
                      if (formKey.currentState!.validate()) {
                        // Si el formulario es válido, muestra un Snackbar
                        final model = DoctorCreateModel(
                          dni: dniController.text,
                          nombres: nombresController.text,
                          apellidos: apellidosController.text,
                          celular: muDoctor.celular,
                          fechaNacimiento: _fechaNacimientoSelected!.toFormatyyyyMMdd(),
                          ubicaciones_id: _ubicacionesList.map((e) => e.id).toList(),
                        );
                        doctorCreateBloc.add(DoctorCreateEvent.createDoctor(model));
                        Navigator.pop(context);
                        await showDialog(
                          context: context,
                          builder: (context) {
                            return BlocBuilder<DoctorCreateBloc, DoctorCreateState>(
                              builder: (context, state) {
                                return Dialog(
                                  insetPadding: const EdgeInsets.symmetric(vertical: 155, horizontal: 50),
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints.expand(),
                                        decoration: const BoxDecoration(color: AppConstColors.white, borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: doctorCreateBloc.state.map(
                                          initial: (stt) {
                                            return const SizedBox.shrink();
                                          },
                                          loading: (stt) {
                                            return const CircularProgressIndicator();
                                          },
                                          doctorsLoaded: (stt) {
                                            return Container(
                                              padding: const EdgeInsets.symmetric(
                                                horizontal: 10,
                                                vertical: 15,
                                              ),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  RichText(
                                                    textAlign: TextAlign.justify,
                                                    text: TextSpan(
                                                      style: AppTextGlobal.lightText(text: "").style,
                                                      children: [
                                                        const TextSpan(
                                                          text: 'Se creó el doctor ',
                                                        ),
                                                        TextSpan(
                                                          text: "${model.nombres.toUpperCase()} ${model.apellidos.toUpperCase()}",
                                                          style: AppTextGlobal.labelLightText(text: "").style,
                                                        ),
                                                        const TextSpan(
                                                          text: ' con fecha de nacimiento ',
                                                        ),
                                                        TextSpan(
                                                          text: model.fechaNacimiento,
                                                          style: AppTextGlobal.labelLightText(text: "").style,
                                                        ),
                                                        const TextSpan(
                                                          text: ' con ubicaciones en ',
                                                        ),
                                                        TextSpan(
                                                          text: _ubicacionesList.map((e) => e.nombre).toList().toStringByMidFijo("y"),
                                                          style: AppTextGlobal.labelLightText(text: "").style,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Row(
                                                    children: [
                                                      AppTextGlobal.labelLightText(text: "Sus credenciales son:", fontSize: 18, textAlign: TextAlign.left),
                                                    ],
                                                  ),
                                                  Column(
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                        children: [
                                                          Expanded(child: AppTextGlobal.labelLightText(text: "Username:", fontSize: 18, textAlign: TextAlign.end)),
                                                          AppBox.w10,
                                                          Expanded(child: AppTextGlobal.lightText(text: stt.doctorCredential.username, fontSize: 18)),
                                                        ],
                                                      ),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                        children: [
                                                          Expanded(child: AppTextGlobal.labelLightText(text: "Contraseña:", fontSize: 18, textAlign: TextAlign.end)),
                                                          AppBox.w10,
                                                          Expanded(child: AppTextGlobal.lightText(text: stt.doctorCredential.password, fontSize: 18)),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  ButtonSuccess(
                                                    text: "OK",
                                                    onClick: () {
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                          failure: (stt) {
                                            return Text(stt.error);
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            );
                          },
                        );
                        doctorListBloc.add(DoctorListEvent.getDoctors());
                      }
                    },
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    final dialog = context.read<DialogMessageCubit>();
    return Scaffold(
      backgroundColor: AppConstColors.cyan,
      appBar: AppBar(
        backgroundColor: AppConstColors.blueAccent,
        title: const Text("ss"),
      ),
      body: Stack(
        fit: StackFit.expand,
        children: [
          // const DialogCubitPage(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed :',
              ),
              Text(
                '3213123',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final api = locator<DoctorApi>();
          final storage = locator<ILocalRepository>();
          storage.saveToken("token 1f9579b30ba59f8dc25a853528d3adac2609f69d");
          final result = await api.getDoctorsByIdUbicacionFromAsistente();
          result.fold((left) => print(left), (right) => print(right));
          dialog.showCustomAlert(titulo: "s", texto: "s");
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
