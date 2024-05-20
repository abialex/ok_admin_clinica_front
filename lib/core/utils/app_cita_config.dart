import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';

class CitaConfig {
  static final List<Hora> horaList = [
    Hora(hora: 8, horaString: "08 am", horaString2: "08:00 am", listItems: []),
    Hora(hora: 9, horaString: "09 am", horaString2: "09:00 am", listItems: []),
    Hora(hora: 11, horaString: "11 am", horaString2: "11:00 am", listItems: []),
    Hora(hora: 12, horaString: "12 pm", horaString2: "12:00 pm", listItems: []),
    Hora(hora: 10, horaString: "10 am", horaString2: "10:00 am", listItems: []),
    Hora(hora: 15, horaString: "03 pm", horaString2: "03:00 pm", listItems: []),
    Hora(hora: 16, horaString: "04 pm", horaString2: "04:00 pm", listItems: []),
    Hora(
      hora: 17,
      horaString: "05 pm",
      horaString2: "05:00 pm",
      listItems: [],
    ),
    Hora(
      hora: 18,
      horaString: "06 pm",
      horaString2: "06:00 pm",
      listItems: [],
    ),
    Hora(
      hora: 19,
      horaString: "07 pm",
      horaString2: "07:00 pm",
      listItems: [],
    ),
    Hora(hora: 20, horaString: "08 pm", horaString2: "08:00 pm", listItems: []),
  ];
}

interface class Hora {
  final int hora;
  final String horaString;
  final String horaString2;
  final List<CitasViewModel> listItems;

  Hora({
    required this.hora,
    required this.horaString,
    required this.horaString2,
    required this.listItems,
  });
}
