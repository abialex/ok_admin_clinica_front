import 'package:intl/intl.dart';

extension DateFormatting on DateTime {
  String toFormatyyyyMMddHHmmss() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd HH:mm:ss');
    minute;
    // Formato de fecha deseado: año-mes-día
    return formatter.format(this);
  }

  String toFormatyyyyMMdd() {
    final DateFormat formatter = DateFormat('yyyy-MM-dd');
    minute;
    // Formato de fecha deseado: año-mes-día
    return formatter.format(this);
  }

  String toFormaMMddSlash() {
    return '${DateFormat('MMMM', 'es-ES').format(this)} - ${DateFormat('dd EEEE', 'es-ES').format(copyWith(year: DateTime.now().year))}';
  }

  String toFormatHHmm() {
    final DateFormat formatter = DateFormat('HH:mm a');
    minute;
    // Formato de fecha deseado: año-mes-día
    return formatter.format(this);
  }

  String toFormatddMMyyyySlash() {
    // Formato de fecha deseado: día/mes/año
    final DateFormat formatter = DateFormat('dd/MM/yyyy');
    return formatter.format(this);
  }
}
