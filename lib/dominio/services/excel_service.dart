import 'dart:io';

import 'package:admin_clinica_front/ui/view_models/excel_view/excel_view.dart';
import 'package:excel/excel.dart';

class ExcelService {
  String createExcel(ExcelView excelView) {
    var excel = Excel.createExcel();
    Sheet sheetObject = excel[excelView.sheetName ?? 'Sheet1'];
    for (var i = 0; i < excelView.headerList.length; i++) {
      sheetObject.cell(CellIndex.indexByColumnRow(columnIndex: i, rowIndex: 0)).value = excelView.headerList[i];
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
}
