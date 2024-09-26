// ignore_for_file: lines_longer_than_80_chars, inference_failure_on_function_return_type, must_be_immutable

import 'package:admin_clinica_front/app/data/models/filter_model/filter_model.dart';
import 'package:admin_clinica_front/app/data/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:admin_clinica_front/app/common/blocs/contenedor/ubicacion_contenedor/list/ubicacion_contenedor_list_bloc.dart';
import 'package:admin_clinica_front/app/common/widget/dropdown_multiselect/custom_dropdown_data_form_field2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UbicacionContenedorDropdown extends StatelessWidget {
  UbicacionContenedorDropdown({required this.contendor, required this.onChanged, required this.label, required this.idContenedor, super.key});

  UbicacionContenedorDataModel contendor;
  Function(UbicacionContenedorDataModel?)? onChanged;
  String label;
  int idContenedor;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UbicacionContenedorListBloc(),
      child: BlocBuilder<UbicacionContenedorListBloc, UbicacionContenedorListState>(
        builder: (context, state) {
          return state.map(
            initial: (value) {
              context.read<UbicacionContenedorListBloc>().add(UbicacionContenedorListEvent.getUbicacionContenedors(FilterModel(ubicacionId: idContenedor)));
              return const SizedBox.shrink();
            },
            loading: (value) {
              return const SizedBox.shrink();
            },
            ubicacionContenedorLoaded: (value) {
              return CustomDropdownDataFormField2<UbicacionContenedorDataModel>(
                items: value.items,
                placeholder: 'Selecciona la ${label.toLowerCase()}',
                label: label.toUpperCase(),
                defaultValue: contendor,
                displayFunction: (data) {
                  return data.nombre;
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
