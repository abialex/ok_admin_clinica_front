import 'package:intl/intl.dart';

extension StringFormatting on String {
  DateTime toFormatyyyyMMddSlashToDateTime() {
    DateFormat inputFormat = DateFormat("dd/MM/yyyy");
    return inputFormat.parse(this);
  }
}
