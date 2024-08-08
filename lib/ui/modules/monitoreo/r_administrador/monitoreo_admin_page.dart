// ignore_for_file: must_be_immutable

import 'package:admin_clinica_front/core/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/data/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/data/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:admin_clinica_front/ui/blocs/excel/excel_cubit.dart';
import 'package:admin_clinica_front/ui/cubits/index_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_sliver_list.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/button_base/button_success.dart';
import 'package:admin_clinica_front/ui/global_widget/checkbox/app_checkbox_list_cubit.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/doctor_contenedor_dropdown.dart';
import 'package:admin_clinica_front/ui/global_widget/dropdown_multiselect/ubicacion_contenedor_dropdown.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_desktop.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_base_phone.dart';
import 'package:admin_clinica_front/ui/global_widget/page/page_mixin_base.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/bloc/cita_list/cita_list_admin_bloc.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/cubit/doctor_selected_cubit.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
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
    final formKey = GlobalKey<FormState>();
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
                                        child: Text("Todos los doctores", style: TextStyle(color: context.watch<IndexCubit>().state == 0 ? AppColors.dark : Colors.transparent)),
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
                                        backgroundColor: AppColors.lightBackgroundColor,
                                        onSelectionChanged: (s) {
                                          request.fecha = DateTime.parse(s.value.toString());
                                        },
                                      );
                                    case 1:
                                      request.fecha = null;
                                      return SfDateRangePicker(
                                        key: UniqueKey(),
                                        backgroundColor: AppColors.white,
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
                  child: BlocBuilder<CitaListAdminBloc, CitaListAdminState>(
                    builder: (context, state) {
                      return state.map(initial: (stt) {
                        return const SizedBox.shrink();
                      }, loading: (stt) {
                        return const Center(child: CircularProgressIndicator());
                      }, citaLoaded: (stt) {
                        final citasIncompletasAsistenta = stt.citas
                            .where((element) => (element.fechaConfirmacion == null && element.fechaValidacion != null) || element.fechaConfirmacion != null && element.fechaValidacion == null)
                            .toList();

                        final citasIncompletaDoctor =
                            stt.citas.where((element) => (element.fechaInicio == null && element.fechaFin != null) || element.fechaInicio != null && element.fechaFin == null).toList();
                        return Stack(
                          children: [
                            CitaPromedioAsistentaList(
                              citas: stt.citas.where((element) => element.fechaValidacion != null && element.fechaConfirmacion != null).toList(),
                              request: request,
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppTextGlobal.lightText(text: "Citas incompletas Control de Asistenta: "),
                                      AppTextGlobal.labelLightText(text: citasIncompletasAsistenta.length.toString()),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      AppTextGlobal.lightText(text: "Citas incompletas Control de Doctor: "),
                                      AppTextGlobal.labelLightText(text: citasIncompletaDoctor.length.toString()),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }, failure: (stt) {
                        return const SizedBox.shrink();
                      });
                    },
                  ),
                ),
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

class CitaPromedioAsistentaList extends StatelessWidget {
  const CitaPromedioAsistentaList({
    super.key,
    required this.citas,
    required this.request,
  });
  final List<CitaViewModel> citas;
  final CitaRequestAdminViewModel request;

  @override
  Widget build(BuildContext context) {
    return BlocListener<IndexCubit, int>(
      listener: (context, state) {
        context.read<CitaListAdminBloc>().add(InitialCitaListAdmin());
      },
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: context.watch<IndexCubit>().state == 1
                ? GraficoByRangeDays(
                    citas: citas,
                    request: request,
                  )
                : GraficoByOneDay(citas: citas),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    AppTextGlobal.labelLightText(text: "EXCEL:"),
                    IconButton(
                        onPressed: () {
                          context.read<ExcelCubit>().createReporteCitas(citas);
                        },
                        icon: const Icon(Icons.print)),
                  ],
                ),
                Expanded(child: AppTextGlobal.labelLightText(text: context.watch<ExcelCubit>().state, textAlign: TextAlign.right)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class GraficoByOneDay extends StatelessWidget {
  const GraficoByOneDay({
    super.key,
    required this.citas,
  });

  final List<CitaViewModel> citas;

  @override
  Widget build(BuildContext context) {
    double promedioTime = citas.where((element) => element.fechaConfirmacion != null && element.fechaValidacion != null).fold(
        0,
        (previousValue, element) =>
            previousValue +
            ((element.fechaValidacion?.hour ?? 0) * 60 +
                (element.fechaValidacion?.minute ?? 0) -
                (element.fechaConfirmacion?.minute ?? 0) -
                (element.fechaConfirmacion?.hour ?? 0) * 60)); //sacar promedio de hora la lista de citas
    //sacar promedio de hora la lista de citas
    if (citas.isNotEmpty) promedioTime = promedioTime / citas.length;
    return citas.isNotEmpty
        ? Column(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 70),
                  child: AppSliverList(
                    items: citas
                        .where(
                          (element) => element.fechaValidacion != null && element.fechaConfirmacion != null,
                        )
                        .toList(),
                    itemBuilder: (context, item) {
                      return Container(
                          margin: const EdgeInsets.symmetric(
                            vertical: 2.5,
                            horizontal: 150,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 5,
                            horizontal: 10,
                          ),
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColors.slg01),
                            borderRadius: BorderRadius.circular(15),
                            color: AppColors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTextGlobal.lightText(text: "Hora de Confirmación", textAlign: TextAlign.left),
                                          AppBox.w10,
                                          AppTextGlobal.lightText(text: item.fechaConfirmacion?.toFormatHHm12h() ?? '--'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTextGlobal.lightText(text: "Hora de Validación", textAlign: TextAlign.left),
                                          AppBox.w10,
                                          AppTextGlobal.lightText(text: item.fechaValidacion?.toFormatHHm12h() ?? '--'),
                                        ],
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          AppTextGlobal.lightText(text: "Tiempo:", textAlign: TextAlign.left),
                                          AppBox.w10,
                                          AppTextGlobal.lightText(
                                            text: convertDoubleToTimeString2(((item.fechaValidacion?.hour ?? 0) * 60 +
                                                (item.fechaValidacion?.minute ?? 0) -
                                                (item.fechaConfirmacion?.minute ?? 0) -
                                                (item.fechaConfirmacion?.hour ?? 0) * 60)),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  // AppTextGlobal.labelLightText(text: item.doctor),
                                  // Text(item.razon ?? 'ss'),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  AppTextGlobal.labelLightText(text: item.doctor),
                                  Text(item.razon ?? 'ss'),
                                ],
                              ),
                            ],
                          ));
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AppTextGlobal.lightText(text: "Promedio Atención: "),
                  AppTextGlobal.labelLightText(
                    text: (convertDoubleToTimeString2(promedioTime)),
                  ),
                ],
              )
            ],
          )
        : Center(child: AppTextGlobal.labelLightText(text: 'No hay citas'));
  }
}

List<DateTime> getDatesBetween(DateTime startDate, DateTime endDate) {
  List<DateTime> dates = [];
  DateTime currentDate = startDate;

  while (currentDate.isBefore(endDate) || currentDate.isAtSameMomentAs(endDate)) {
    dates.add(currentDate);
    currentDate = currentDate.add(const Duration(days: 1));
  }

  return dates;
}

class GraficoCita extends StatelessWidget {
  const GraficoCita({
    super.key,
    required this.citas,
    required this.dateTimeList,
  });
  final List<CitaViewModel> citas;
  final List<DateTime> dateTimeList;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (dateTimeList.length != 1)
          Expanded(
            child: AppSliverList<DateTime>(
              scrollDirection: Axis.horizontal,
              items: List.generate(dateTimeList.length, (index) => dateTimeList[index]),
              itemBuilder: (context, item) {
                //LOGIC

                final List<CitaViewModel> citasDia = citas
                    .where(
                      (element) => element.fechaHoraCita.isSameDate(item) && element.fechaValidacion != null && element.fechaConfirmacion != null,
                    )
                    .toList();
                double promedioTime = citasDia.fold(
                    0,
                    (previousValue, element) =>
                        previousValue +
                        ((element.fechaValidacion?.hour ?? 0) * 60 +
                            (element.fechaValidacion?.minute ?? 0) -
                            (element.fechaConfirmacion?.minute ?? 0) -
                            (element.fechaConfirmacion?.hour ?? 0) * 60)); //sacar promedio de hora la lista de citas
                //sacar promedio de hora la lista de citas
                if (citasDia.isNotEmpty) promedioTime = promedioTime / citasDia.length;
                return GestureDetector(
                  onTap: () {
                    if (citasDia.isEmpty) return;
                    showDialog(
                      context: context,
                      builder: (context) {
                        return DetallesDialog(
                          citasDia: citasDia,
                          promedioTime: promedioTime,
                        );
                      },
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.5),
                    child: Column(
                      children: [
                        Expanded(
                          child: LayoutBuilder(
                            builder: (context, constraints) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                RotatedBox(
                                  quarterTurns: 1,
                                  child: AppTextGlobal.labelMediumText(
                                    text: citasDia.isEmpty ? '' : convertDoubleToTimeString2(promedioTime),
                                    fontSize: 11,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                AppBox.h6,
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  color: AppColors.blueAccent,
                                  height: constraints.maxHeight * (promedioTime / (60 * 4)).clamp(0, 0.9),
                                  child: AppTextGlobal.labelSmallText(
                                    text: '${citasDia.length.toString()}\ncitas',
                                    fontSize: 11,
                                    maxLines: 2,
                                    textAlign: TextAlign.center,
                                    colorText: Colors.transparent,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        if (citasDia.isNotEmpty)
                          Container(
                            width: 30,
                            alignment: Alignment.center,
                            color: AppColors.blueSecondary,
                            child: AppTextGlobal.labelSmallText(text: citasDia.length.toString(), fontSize: 11, maxLines: 2, textAlign: TextAlign.center, colorText: AppColors.white),
                          ),
                        Container(
                          color: AppColors.lightBackgroundColor,
                          child: AppTextGlobal.labelMediumText(
                            text: item.toFormaMMddSlash(),
                            fontSize: 11,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          )
        else
          Expanded(child: Center(child: AppTextGlobal.labelLargeText(text: "Seleccione el rango de fechas")))
      ],
    );
  }
}

// quedé en  CREAR UN DIALOG PARA MOSTRAR LOS DETALLES DE LAS CITAS POR FECHA DE HOY
class DetallesDialog extends StatelessWidget {
  const DetallesDialog({super.key, required this.citasDia, required this.promedioTime});

  final List<CitaViewModel> citasDia;
  final double promedioTime;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: IntrinsicHeight(
        child: Column(
          children: [
            Column(
              children: List.generate(
                citasDia.length,
                (index) {
                  final cita = citasDia[index];
                  return Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.blueAccent),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cita.fechaValidacion?.toFormatyyyyMMddHHmmSlash() ?? '-'),
                            const Text(' - '),
                            Text(cita.fechaConfirmacion?.toFormatyyyyMMddHHmmSlash() ?? 'n'),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AppTextGlobal.labelLightText(text: cita.doctor),
                            AppBox.w10,
                            Text(
                              convertDoubleToTimeString2(
                                  ((cita.fechaValidacion?.hour ?? 0) * 60 + (cita.fechaValidacion?.minute ?? 0) - (cita.fechaConfirmacion?.minute ?? 0) - (cita.fechaConfirmacion?.hour ?? 0) * 60)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            AppTextGlobal.lightText(text: cita.razon ?? " N.A"),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
            AppBox.h10,
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextGlobal.lightText(text: "Promedio Atención: ", textAlign: TextAlign.center),
                AppTextGlobal.lightText(text: convertDoubleToTimeString2(promedioTime), textAlign: TextAlign.center),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

String convertDoubleToTimeString2(double timeInMinutes) {
  int totalSeconds = (timeInMinutes * 60).round(); // Convertir minutos a segundos
  int hours = totalSeconds ~/ 3600; // Obtener las horas
  int minutes = (totalSeconds % 3600) ~/ 60; // Obtener los minutos restantes
  // int seconds = totalSeconds % 60; // Obtener los segundos restantes
  if (hours == 0) return '${minutes}m';
  if (minutes == 0) return '${hours}h';
  return '${hours}h ${minutes}m';
}

class GraficoByRangeDays extends StatelessWidget {
  const GraficoByRangeDays({
    super.key,
    required this.citas,
    required this.request,
  });
  final List<CitaViewModel> citas;
  final CitaRequestAdminViewModel request;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "3h",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "2h",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "1h",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "0h ",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              ColoredBox(
                color: AppColors.blueSecondary,
                child: AppTextGlobal.labelSmallText(text: 'CANT. CITAS', fontSize: 11, maxLines: 2, textAlign: TextAlign.center, colorText: AppColors.white),
              ),
              Container(
                  child: AppTextGlobal.labelMediumText(
                text: "DÍA",
                fontSize: 11,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        Expanded(
          flex: 12,
          child: GraficoCita(
            citas: citas,
            dateTimeList: getDatesBetween(request.fechaInicio ?? DateTime.now(), request.fechaFin ?? DateTime.now()),
          ),
        ),
      ],
    );
  }
}
