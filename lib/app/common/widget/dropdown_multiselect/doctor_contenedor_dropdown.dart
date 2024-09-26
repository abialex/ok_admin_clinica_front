// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_return_type, must_be_immutable

import 'package:admin_clinica_front/app/data/models/doctor/doctor_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/data/models/filter_model/filter_model.dart';
import 'package:admin_clinica_front/app/common/blocs/contenedor/doctor_contenedor/list/doctor_contenedor_list_bloc.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/custom_dropdown_data_form_field2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DoctorContendorDropdown extends StatelessWidget {
  DoctorContendorDropdown({
    required this.contendor,
    required this.onChanged,
    required this.label,
    required this.ubicacionId,
    super.key,
    this.enabled = true,
  });

  DoctorContenedorDataModel contendor;
  Function(DoctorContenedorDataModel?)? onChanged;
  String label;
  int ubicacionId;
  bool enabled;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DoctorContenedorListBloc(),
      child: BlocBuilder<DoctorContenedorListBloc, DoctorContenedorListState>(
        builder: (context, state) {
          return state.map(
            initial: (value) {
              context.read<DoctorContenedorListBloc>().add(DoctorContenedorListEvent.getDoctorContenedors(FilterModel(ubicacionId: ubicacionId)));
              return const SizedBox.shrink();
            },
            loading: (value) {
              return const SizedBox.shrink();
            },
            doctorContenedorLoaded: (value) {
              return CustomDropdownDataFormField2<DoctorContenedorDataModel>(
                items: value.items,
                placeholder: 'Selecciona la ${label.toLowerCase()}',
                label: label.toUpperCase(),
                defaultValue: contendor,
                displayFunction: (data) {
                  return data.nombres;
                },
                onChanged: onChanged,
                validator: (selectedItem) {
                  if (selectedItem == null) {
                    return 'La ${label.toLowerCase()} es requerido';
                  }
                  return null;
                },
                autoValidateMode: AutovalidateMode.onUserInteraction,
              );
            },
            failure: (value) {
              return const SizedBox.shrink();
            },
          );
        },
      ),
    );
  }
}
