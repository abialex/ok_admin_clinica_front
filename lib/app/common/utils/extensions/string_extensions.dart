import 'package:intl/intl.dart';

extension StringFormatting on String {
  DateTime toFormatyyyyMMddSlashToDateTime() {
    DateFormat inputFormat = DateFormat("dd/MM/yyyy");
    return inputFormat.parse(this);
  }

  String capitalizeFirstLetter() {
    if (isEmpty) return this;
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
