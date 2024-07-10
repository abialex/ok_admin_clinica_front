import 'package:admin_clinica_front/core/di/injections.dart';
import 'package:admin_clinica_front/dominio/services/excel_service.dart';
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
}
