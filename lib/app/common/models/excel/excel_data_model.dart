class ExcelDataModel {
  final List<String> headerList;
  final List<List<String>> dataList;
  final String? sheetName;
  final String? nameFile;
  final String? urlFile;

  ExcelDataModel({
    required this.dataList,
    required this.headerList,
    this.sheetName,
    this.nameFile,
    this.urlFile,
  });
}
