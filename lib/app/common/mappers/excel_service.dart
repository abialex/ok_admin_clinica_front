import 'dart:io';

import 'package:admin_clinica_front/app/config/app_dependecy_injection.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/data/entities/estado_cita.dart';
import 'package:admin_clinica_front/app/common/mappers/cmd_services.dart';
import 'package:admin_clinica_front/app/ui/view_models/cita_view/cita_view_models.dart';
import 'package:admin_clinica_front/app/ui/view_models/excel_view/excel_view.dart';
import 'package:excel/excel.dart';

class ExcelService {
  final cmdService = locator<CMDservice>();
  String createExcel(ExcelView excelView) {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel[excelView.sheetName ?? 'Sheet1'];
    for (var i = 0; i < excelView.headerList.length; i++) {
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).value = excelView.headerList[i];
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).cellStyle = CellStyle(
        bold: true,
        horizontalAlign: HorizontalAlign.Center,
        verticalAlign: VerticalAlign.Center,
        fontFamily: getFontFamily(FontFamily.Calibri),
        fontSize: 12,
      );
    }
    for (var i = 0; i < excelView.dataList.length; i++) {
      for (var j = 0; j < excelView.dataList[i].length; j++) {
        sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: j, rowIndex: i + 1)).value = excelView.dataList[i][j];
      }
    }

    String outputPath = excelView.urlFile ?? "";
    String fileName = "${excelView.nameFile ?? 'output'}.xlsx";
    File(outputPath + fileName)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);

    return outputPath + fileName;
  }

  String createReporteCitas(List<CitaViewModel> citaList) {
    final headerList = [
      "codigo",
      "Doctor",
      "Sede",
      "Fecha",
      "Hora",
      "Estado",
      "Razón",
      "Datos del paciente",
      "Celular",
      "",
      "Fecha de confirmación",
      "Fecha de inicio",
      "Fecha de fin",
      "Fecha de validación"
    ];
    var excel = Excel.createExcel();
    Sheet sheetObject = excel['Sheet1'];
    for (var i = 0; i < headerList.length; i++) {
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).value = headerList[i];
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).cellStyle = CellStyle(
        bold: true,
        horizontalAlign: HorizontalAlign.Center,
        verticalAlign: VerticalAlign.Center,
        fontFamily: getFontFamily(FontFamily.Calibri),
        fontSize: 12,
      );
    }
    for (var i = 0; i < citaList.length; i++) {
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 0, rowIndex: i + 1)).value = citaList[i].id;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 1, rowIndex: i + 1)).value = citaList[i].doctor;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 2, rowIndex: i + 1)).value = citaList[i].ubicacionString;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 3, rowIndex: i + 1)).value = citaList[i].fechaHoraCita.toFormatddMMyyyySlash();
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 4, rowIndex: i + 1)).value = citaList[i].fechaHoraCita.toFormatHHm12h();
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1)).value = citaList[i].estadoString;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 5, rowIndex: i + 1)).cellStyle = CellStyle(
        bold: true,
        horizontalAlign: HorizontalAlign.Center,
        verticalAlign: VerticalAlign.Center,
        fontFamily: getFontFamily(FontFamily.Calibri),
        fontSize: 12,
        fontColorHex: citaList[i].estado.color.value.toRadixString(16),
      );
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 6, rowIndex: i + 1)).value = citaList[i].razon;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 7, rowIndex: i + 1)).value = citaList[i].datosPaciente ?? (citaList[i].pacienteDatos ?? '');
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 8, rowIndex: i + 1)).value = citaList[i].celular;
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 9, rowIndex: i + 1)).value = '';
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 10, rowIndex: i + 1)).value = citaList[i].fechaConfirmacion?.toFormatyyyyMMddHHmmssSlash();
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 11, rowIndex: i + 1)).value = citaList[i].fechaInicio?.toFormatyyyyMMddHHmmssSlash();
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 12, rowIndex: i + 1)).value = citaList[i].fechaFin?.toFormatyyyyMMddHHmmssSlash();
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: 13, rowIndex: i + 1)).value = citaList[i].fechaValidacion?.toFormatyyyyMMddHHmmssSlash();
    }

    String outputPath = "files/";
    String fileName = "reporte_citas.xlsx";
    File(outputPath + fileName)
      ..createSync(recursive: true)
      ..writeAsBytesSync(excel.encode()!);
    cmdService.openFolder("${Directory.current.path}/$outputPath");
    cmdService.openFile("${Directory.current.path}/$outputPath/$fileName");
    return outputPath + fileName;
  }
}
