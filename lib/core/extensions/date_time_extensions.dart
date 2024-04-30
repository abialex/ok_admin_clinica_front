import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toFormatyyyyMMddHHmmss() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    minute;
    // Formato de fecha deseado: año-mes-día
    return formatter.format(this);
  }
}
