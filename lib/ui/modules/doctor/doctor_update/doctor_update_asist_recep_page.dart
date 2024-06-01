// ignore_for_file: must_be_immutable

import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/extensions/string_extensions.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_cancel.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/checkbox/app_check_box_label_blue_r_10.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/app_multi_select_form.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/custom_multi_select.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_date.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/ui/global_widget/page/mobile/app_header_mobile.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_list_bloc.dart';
import 'package:admin_clinica_front/ui/modules/doctor/bloc/doctor_update_bloc.dart';
import 'package:admin_clinica_front/ui/modules/ubicacion/bloc/ubicacion_bloc.dart';
import 'package:admin_clinica_front/ui/validators/validators.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/ubicacion_view/ubicacion_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/injections.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../data/datasources/remote/doctor_api.dart';
import '../../../../dominio/repositories/ilocal_repository.dart';
import '../../../global_widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import '../../../global_widget/page/page_base_desktop.dart';
import '../../../global_widget/page/page_base_phone.dart';
import '../../../global_widget/page/page_mixin_base.dart';

class DoctorUpdateAsistenteRecepcionPage extends StatelessWidget with ResponsiveWidgetMixin {
  DoctorUpdateAsistenteRecepcionPage({super.key});

  final formKey = GlobalKey<FormState>();
  final _nombresController = TextEditingController();
  final _apellidosController = TextEditingController();
  final _dniController = TextEditingController();
  final _celularController = TextEditingController();
  final _fechaNacimientoController = TextEditingController();
  int? _id;
  final _ubicacionesList = <UbicacionsViewModel>[];

  @override
  Widget build(BuildContext context) {
    final doctorBloc = context.read<DoctorUpdateBloc>();
    return BlocBuilder<DoctorUpdateBloc, DoctorUpdateState>(
      bloc: doctorBloc,
      builder: (context, state) {
        return whatIs(context);
      },
    );
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return const PageBaseDesktop(
      headerWidget: Text("Sin implementar"),
    );
  }

  @override
  PageBasePhone buildMobile(BuildContext context) {
    final ubicacionBloc = context.read<UbicacionBloc>();
    final doctorUpdateBloc = context.read<DoctorUpdateBloc>();
    final doctorListBloc = context.read<DoctorListBloc>();
    return PageBasePhone(
      showNavbar: false,
      headerWidget: const HeaderMobile(
        subTitle: "Doctor",
        title: "MODIFICAR DOCTOR",
      ),
      bodySliver: SliverToBoxAdapter(
          child: doctorUpdateBloc.state.map(
        initial: (stt) {
          return Container();
        },
        loading: (stt) {
          return Text("cargando");
        },
        doctorSetup: (stt) {
          final doctorView = stt.doctorViewModel;
          _id = doctorView.id;
          _ubicacionesList.addAll(stt.doctorViewModel.ubicacionesId.map((e) => UbicacionsViewModel(nombre: "nombre", id: e)).toList());
          // _fechaNacimientoSelected = doctorView.fechaNacimiento;
          return Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                AppBox.h10,
                InputTextBase(
                  initialText: doctorView.nombres,
                  inputFormatDeskptop: InputFormatDesktopEnum.letras,
                  textInputType: TextInputType.name,
                  label: "NOMBRES",
                  hintText: "Ingrese Nombres",
                  controller: _nombresController,
                  validator: Validators.validateNotEmpty,
                ),
                AppBox.h10,
                InputTextBase(
                  initialText: doctorView.apellidos,
                  inputFormatDeskptop: InputFormatDesktopEnum.letras,
                  textInputType: TextInputType.name,
                  label: "APELLIDOS",
                  hintText: "Ingrese Apellidos",
                  controller: _apellidosController,
                  validator: Validators.validateNotEmpty,
                ),
                AppBox.h10,
                InputTextBase(
                  initialText: doctorView.dni,
                  inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                  textInputType: TextInputType.number,
                  label: "DNI",
                  hintText: "Ingrese DNI",
                  controller: _dniController,
                  validator: (value) => Validators.validateLength(value, 8),
                  maxlength: 8,
                ),
                AppBox.h10,
                InputTextBase(
                  initialText: doctorView.celular,
                  inputFormatDeskptop: InputFormatDesktopEnum.numeros,
                  textInputType: TextInputType.number,
                  label: "CELULAR",
                  hintText: "Ingrese un celular",
                  controller: _celularController,
                  validator: (value) => Validators.validateLengthIfIsNoEmpty(value, 9),
                  maxlength: 9,
                ),
                AppBox.h10,
                InputTextDate(
                  label: "FECHA NACIMIENTO",
                  hintText: "Fecha nacimiento",
                  initialText: doctorView.fechaNacimiento.toFormatddMMyyyySlash(),
                  initialDate: doctorView.fechaNacimiento,
                  helper: "Ingrese la fecha de nacimiento del Doctor",
                  maxDate: DateTime.now(),
                  minDate: DateTime(1940),
                  validator: Validators.validateNotEmpty,
                  controller: _fechaNacimientoController,
                  changeDate: (fechaString, fecha) {
                    _fechaNacimientoController.text = fechaString;
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
                      ubicacionLoaded: (sttUbicaciones) {
                        final ubicacionesList = sttUbicaciones.ubicaciones
                            .map(
                              (e) => MultiSelectItem<UbicacionsViewModel>(
                                id: e.id,
                                item: e,
                              ),
                            )
                            .toList();
                        return MultiSelectForm<UbicacionsViewModel>(
                          validatorParent: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Debe seleccionar al menos una ubicación';
                            }
                            return null;
                          },
                          contexts: context,
                          items: ubicacionesList,
                          itemsSelected: stt.doctorViewModel.ubicacionesId
                              .map(
                                (e) => MultiSelectItem<UbicacionsViewModel>(
                                  id: e,
                                  item: UbicacionsViewModel(nombre: "nombre ", id: e),
                                ),
                              )
                              .toList(),
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
          );
        },
        doctorUpdated: (stt) {
          return const Text("doctorUpdate");
        },
        failure: (stt) {
          return const Text("failure");
        },
      )),
      footerSliver: Container(
        height: 75,
        padding: const EdgeInsets.only(top: 30),
        color: AppColors.white,
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
                    text: "MODIFICAR",
                    onClick: () async {
                      if (formKey.currentState!.validate()) {
                        // Si el formulario es válido, muestra un Snackbar
                        final model = DoctorUpdateViewModel(
                          id: _id ?? 0,
                          dni: _dniController.text,
                          nombres: _nombresController.text,
                          apellidos: _apellidosController.text,
                          celular: _celularController.text,
                          fechaNacimiento: _fechaNacimientoController.text.toFormatyyyyMMddSlashToDateTime(),
                          ubicacionesId: _ubicacionesList.map((e) => e.id).toList(),
                        );
                        doctorUpdateBloc.add(DoctorUpdateEvent.updateDoctor(model));
                        Navigator.pop(context);

                        await showDialog(
                          context: context,
                          builder: (context) {
                            return BlocBuilder<DoctorUpdateBloc, DoctorUpdateState>(
                              builder: (context, state) {
                                return Dialog(
                                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                  child: Stack(
                                    clipBehavior: Clip.none,
                                    alignment: Alignment.center,
                                    children: [
                                      Container(
                                        constraints: const BoxConstraints.expand(),
                                        decoration: const BoxDecoration(color: AppColors.blueAccent, borderRadius: BorderRadius.all(Radius.circular(10))),
                                        child: doctorUpdateBloc.state.map(initial: (stt) {
                                          return const SizedBox.shrink();
                                        }, loading: (stt) {
                                          return const CircularProgressIndicator();
                                        }, doctorSetup: (stt) {
                                          return Column(
                                            children: [],
                                          );
                                        }, failure: (stt) {
                                          return Text(stt.error);
                                        }, doctorUpdated: (stt) {
                                          return Text(stt.doctorId.toString());
                                        }),
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
      backgroundColor: AppColors.cyan,
      appBar: AppBar(
        backgroundColor: AppColors.blueAccent,
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
