import 'package:process_run/process_run.dart';

class CMDservice {
  var shell = Shell();

  void openFolder(String folderPath) async {
    // Abrir la carpeta que contiene el archivo Excel
    await shell.run('start $folderPath');
  }

  void openFile(String excelFilePath) async {
    // Abrir el archivo Excel
    await shell.run('start $excelFilePath');
  }
}
