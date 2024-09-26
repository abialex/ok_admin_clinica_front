import 'package:admin_clinica_front/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/dominio/services/excel_service.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:admin_clinica_front/ui/view_models/excel_view/excel_view.dart';
import 'package:bloc/bloc.dart';

class ExcelCubit extends Cubit<String> {
  ExcelCubit() : super("");
  final _excelService = locator<ExcelService>();

  void crearExcel(ExcelView excelView) {
    try {
      final url = _excelService.createExcel(excelView);
      emit(url);
    } catch (e) {
      emit(e.toString());
    }
  }

  void createReporteCitas(List<CitaViewModel> citaList) {
    try {
      final url = _excelService.createReporteCitas(citaList);
      emit(url);
    } catch (e) {
      emit(e.toString());
    }
  }
}
