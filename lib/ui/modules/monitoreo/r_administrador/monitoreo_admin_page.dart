import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/data/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:admin_clinica_front/ui/cubits/index_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/checkbox/app_checkbox_list_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/doctor_contenedor_dropdown.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/ubicacion_contenedor_dropdown.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/cubit/doctor_selected_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class MonitoreoAdminPage extends StatelessWidget with ResponsiveWidgetMixin {
  MonitoreoAdminPage({super.key});

  @override
  Widget build(BuildContext context) {
    return whatIs(context);
  }

  @override
  PageBaseDesktop buildDesktop(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return PageBaseDesktop(
      title: "Monitoreo",
      bodyWidget: BlocProvider(
        create: (context) => UbicacionSelectedCubit(),
        child: Builder(builder: (context) {
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
                          context.read<UbicacionSelectedCubit>().setDoctor(value!);
                        },
                        label: "Ubicaciones",
                        idContenedor: 1,
                      ),
                      AppBox.h4,
                      BlocProvider(
                        create: (context) => IndexCubit(),
                        child: Builder(builder: (context) {
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
                                          return state != null
                                              ? DoctorContendorDropdown(
                                                  key: UniqueKey(),
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
                                                    // Aquí manejas el cambio de selección del doctor si es necesario
                                                  },
                                                  label: "Doctores",
                                                  ubicacionId: state.id ?? 0, // Aquí usas el estado actualizado de la ubicación
                                                )
                                              : Center(child: AppTextGlobal.errorlightText(text: "Seleccione una ubicación"));
                                        },
                                      )
                                    : Center(
                                        child: Text("Todos los doctores", style: TextStyle(color: context.watch<IndexCubit>().state == 0 ? AppColors.dark : Colors.transparent)),
                                      ),
                              ),
                            ],
                          );
                        }),
                      ),
                      AppBox.h4,
                      Expanded(
                        child: BlocProvider(
                          create: (context) => IndexCubit(),
                          child: Builder(builder: (context) {
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
                                  switch ((context.watch<IndexCubit>().state)) {
                                    case 0:
                                      return SfDateRangePicker(
                                        backgroundColor: AppColors.lightBackgroundColor,
                                      );
                                    case 1:
                                      return SfDateRangePicker(
                                        backgroundColor: AppColors.white,
                                        selectionMode: DateRangePickerSelectionMode.range,
                                      );
                                    default:
                                      return const Text("N.A");
                                  }
                                }()
                              ],
                            );
                          }),
                        ),
                      ),
                      ButtonSuccess(
                        text: "Buscar",
                        onClick: () {
                          if (formKey.currentState!.validate()) {
                          } else {}
                        },
                      ),
                      AppBox.h10,
                    ],
                  ),
                ),
                const Expanded(flex: 3, child: Center(child: Text("espacio de trabajo"))),
              ],
            ),
          );
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
