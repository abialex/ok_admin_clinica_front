extension IntFormatting on int {
  String toMonth() {
    switch (this) {
      case 1:
        return "Enero";
      case 2:
        return "Febrero";
      case 3:
        return "Marzo";
      case 4:
        return "Abril";
      case 5:
        return "Mayo";
      case 6:
        return "Junio";
      case 7:
        return "Julio";
      case 8:
        return "Agosto";
      case 9:
        return "Septiembre";
      case 10:
        return "Octubre";
      case 11:
        return "Noviembre";
      case 12:
        return "Diciembre";
      default:
        return "Invalid month number";
    }
  }

  DateTime toMonthInitDate(int year) {
    return DateTime(year, this, 1);
  }

  DateTime toMonthEndDate(int year) {
    if ([1, 3, 5, 7, 8, 10, 12].contains(this)) {
      return DateTime(year, this, 31);
    } else if ([4, 6, 9, 11].contains(this)) {
      return DateTime(year, this, 30);
    } else {
      if (year % 4 == 0) {
        return DateTime(year, this, 29);
      } else {
        return DateTime(year, this, 28);
      }
    }
  }
}
