// ignore_for_file: must_be_immutable

import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/common/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/common/blocs/excel/excel_cubit.dart';
import 'package:admin_clinica_front/app/common/cubits/index_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_success.dart';
import 'package:admin_clinica_front/app/common/widget/checkbox/app_checkbox_list_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/dialog/dialog_message/cubit/dialog_message_cubit.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/doctor_contenedor_dropdown.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/ubicacion_contenedor_dropdown.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/app/common/widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/app/common/widget/pageview_custom.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/bloc/cita_list/cita_list_admin_bloc.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/cubit/doctor_selected_cubit.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/r_administrador/widgets/citas_control_asistente/cita_control_asistente.dart';
import 'package:admin_clinica_front/app/ui/modules/monitoreo/r_administrador/widgets/citas_control_inicio-fin/cita_control_inicio_fin.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MonitoreoAdminPage extends StatelessWidget with ResponsiveWidgetMixin {
  MonitoreoAdminPage({super.key});

  CitaRequestAdminViewModel request = CitaRequestAdminViewModel(ubicacionId: 0);

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    return PageBaseDesktop(
      title: "Monitoreo",
      bodyWidget: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => UbicacionSelectedCubit(),
          ),
          BlocProvider(
            create: (context) => CitaListAdminBloc(),
          ),
          BlocProvider(
            create: (context) => IndexCubit(),
          ),
        ],
        child: Builder(builder: (context) {
          return PageControl(request: request);
        }),
      ),
    );
  }

  @override
  Widget buildMobile(BuildContext context) {
    throw const PageBasePhoneBeta(
      bodySliver: [Text("data")],
    );
  }

  @override
  Widget buildTablet(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("TABLET"),
      ),
      body: const SizedBox.shrink(),
    );
  }
}

class PageControl extends StatelessWidget {
  final formKey = GlobalKey<FormState>();

  PageControl({super.key, required this.request});
  final CitaRequestAdminViewModel request;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppBox.h4,
                UbicacionContenedorDropdown(
                  contendor: const UbicacionContenedorDataModel(nombre: "", id: 1),
                  onChanged: (value) {
                    context.read<UbicacionSelectedCubit>().setUbicacion(value!);
                    request.ubicacionId = value.id!;
                  },
                  label: "Ubicaciones",
                  idContenedor: 1,
                ),
                AppBox.h4,
                BlocProvider(
                  create: (context) => IndexCubit(),
                  child: Builder(builder: (context) {
                    if (context.read<IndexCubit>().state == 0) {
                      request.doctorId = null;
                    }
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // AppTextGlobal.labelMediumText(text: "Doctores"),
                        CheckBoxListCubitWidget<String>(
                          fontSize: 13,
                          autoCubit: false,
                          isRequiredSelected: true,
                          items: [
                            ItemCustom(id: 1, itemName: "Todos los doctores", item: "Todos los doctores"),
                            ItemCustom(id: 2, itemName: "Un doctor", item: "Un doctor"),
                          ],
                        ),
                        SizedBox(
                          height: 90,
                          child: context.watch<IndexCubit>().state == 1
                              ? BlocBuilder<UbicacionSelectedCubit, UbicacionContenedorDataModel?>(
                                  builder: (context, state) {
                                    if (state == null) {
                                      return Center(child: AppTextGlobal.errorlightText(text: "Seleccione una ubicación"));
                                    }
                                    if (state.id == 1) {
                                      return DoctorContendorDropdown(
                                        contendor: DoctorContenedorDataModel(
                                          usuarioId: 0,
                                          username: "",
                                          nombres: "",
                                          apellidos: "",
                                          isActive: true,
                                          fechaNacimiento: DateTime.now(),
                                          celular: "",
                                        ),
                                        onChanged: (value) {
                                          request.doctorId = value?.id!;

                                          // Aquí manejas el cambio de selección del doctor si es necesario
                                        },
                                        label: "Doctores huanta",
                                        ubicacionId: 1, // Aquí usas el estado actualizado de la ubicación
                                      );
                                    }
                                    if (state.id == 2) {
                                      return SizedBox(
                                        child: DoctorContendorDropdown(
                                          contendor: DoctorContenedorDataModel(
                                            usuarioId: 0,
                                            username: "",
                                            nombres: "",
                                            apellidos: "",
                                            isActive: true,
                                            fechaNacimiento: DateTime.now(),
                                            celular: "",
                                          ),
                                          onChanged: (value) {
                                            request.doctorId = value?.id!;

                                            // Aquí manejas el cambio de selección del doctor si es necesario
                                          },
                                          label: "Doctores huamanga",
                                          ubicacionId: 2, // Aquí usas el estado actualizado de la ubicación
                                        ),
                                      );
                                    }
                                    return const SizedBox.shrink();
                                  },
                                )
                              : Center(
                                  child: Text("Todos los doctores", style: TextStyle(color: context.watch<IndexCubit>().state == 0 ? AppConstColors.dark : Colors.transparent)),
                                ),
                        ),
                      ],
                    );
                  }),
                ),
                AppBox.h4,
                Expanded(
                  child: BlocBuilder<IndexCubit, int>(
                    builder: (context, state) {
                      return Column(
                        children: [
                          // AppTextGlobal.labelMediumText(text: "Fechas"),
                          CheckBoxListCubitWidget<String>(
                            fontSize: 13,
                            autoCubit: false,
                            isRequiredSelected: true,
                            items: [
                              ItemCustom(id: 1, itemName: "Fecha Especifica", item: "Todos los doctores"),
                              ItemCustom(id: 2, itemName: "Rango de Fecha", item: "Un doctor"),
                            ],
                          ),
                          () {
                            switch ((state)) {
                              case 0:
                                request.fechaFin = null;
                                request.fechaInicio = null;
                                return SfDateRangePicker(
                                  selectionMode: DateRangePickerSelectionMode.single,
                                  backgroundColor: AppConstColors.lightBackgroundColor,
                                  onSelectionChanged: (s) {
                                    request.fecha = DateTime.parse(s.value.toString());
                                  },
                                );
                              case 1:
                                request.fecha = null;
                                return SfDateRangePicker(
                                  key: UniqueKey(),
                                  backgroundColor: AppConstColors.white,
                                  selectionMode: DateRangePickerSelectionMode.range,
                                  onSelectionChanged: (args) {
                                    if (args.value.startDate != null) {
                                      final initial = DateTime.parse(args.value.startDate.toString());
                                      request.fechaInicio = initial;
                                    }
                                    if (args.value.endDate != null) {
                                      final end = DateTime.parse(args.value.endDate.toString());
                                      request.fechaFin = end;
                                    }
                                  },
                                );
                              default:
                                return const Text("N.A");
                            }
                          }()
                        ],
                      );
                    },
                  ),
                ),
                ButtonSuccess(
                  text: "Buscar",
                  onClick: () {
                    if (formKey.currentState!.validate()) {
                      if (request.fechaFin != null && request.fechaInicio != null || request.fecha != null) {
                        context.read<CitaListAdminBloc>().add(CitaListAdminEvent.getCitas(request));
                      } else {
                        context.read<DialogMessageCubit>().showErrorAlert(texto: "Seleccione una fecha");
                      }
                    } else {}
                  },
                ),
                AppBox.h10,
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              children: [
                Expanded(
                  child: MyPageViewCustom(
                    listWidgets: [
                      PageItemCustom(titleText: "Asistente Control", widget: ControlAsistente(request: request)),
                      PageItemCustom(titleText: "Doctor Control", widget: CitaControlInicioFin(request: request)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          AppTextGlobal.labelLightText(text: "EXCEL:"),
                          BlocBuilder<CitaListAdminBloc, CitaListAdminState>(
                            builder: (context, state) {
                              final citas = <CitaViewModel>[];
                              if (state is CitasLoaded) {
                                citas.addAll(state.citas);
                              }
                              return IconButton(
                                  onPressed: () {
                                    context.read<ExcelCubit>().createReporteCitas(citas);
                                  },
                                  icon: const Icon(Icons.print));
                            },
                          ),
                        ],
                      ),
                      Expanded(child: AppTextGlobal.labelLightText(text: context.watch<ExcelCubit>().state, textAlign: TextAlign.right)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
