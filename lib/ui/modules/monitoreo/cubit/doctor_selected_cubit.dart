import 'package:admin_clinica_front/data/models/ubicacion/ubicacion_contenedor_data_model.dart';
import 'package:bloc/bloc.dart';

class UbicacionSelectedCubit extends Cubit<UbicacionContenedorDataModel?> {
  UbicacionSelectedCubit() : super(null);

  void setUbicacion(UbicacionContenedorDataModel ubicacion) {
    emit(ubicacion);
  }

  void clearDoctor() {
    emit(null);
  }
}
