import 'package:admin_clinica_front/ui/global_widget/app_box.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_action_date.dart';
import 'package:admin_clinica_front/ui/global_widget/input_text/input_form_02/input_text_form_base.dart';
import 'package:admin_clinica_front/ui/validators/validators.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_animate/flutter_animate.dart';

class CitaAddFormOcupada extends StatefulWidget {
  const CitaAddFormOcupada({super.key});

  @override
  State<CitaAddFormOcupada> createState() => _CitaAddFormOcupadaState();
}

class _CitaAddFormOcupadaState extends State<CitaAddFormOcupada> {
  final formKey = GlobalKey<FormState>();

  final _nombresController = TextEditingController();

  final _apellidosController = TextEditingController();

  final _dniController = TextEditingController();

  final _celularController = TextEditingController();

  DateTime? _fechaNacimientoSelected;

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          AppBox.h20,

          InputTextBase(
            inputFormatDeskptop: InputFormatDesktopEnum.letras,
            textInputType: TextInputType.name,
            label: "Razón",
            hintText: "Ingrese Nombres",
            controller: _nombresController,
            validator: Validators.validateNotEmpty,
          ),
          AppBox.h10,
          // InputTextBase(
          //   inputFormatDeskptop: InputFormatDesktopEnum.letras,
          //   textInputType: TextInputType.name,
          //   label: "APELLIDOS",
          //   hintText: "Ingrese Apellidos",
          //   controller: _apellidosController,
          //   validator: Validators.validateNotEmpty,
          // ),
          // AppBox.h10,
          // InputTextBase(
          //   inputFormatDeskptop: InputFormatDesktopEnum.numeros,
          //   textInputType: TextInputType.number,
          //   label: "DNI",
          //   hintText: "Ingrese DNI",
          //   controller: _dniController,
          //   validator: (value) => Validators.validateLength(value, 8),
          //   maxlength: 8,
          // ),
          // AppBox.h10,
          // InputTextBase(
          //   inputFormatDeskptop: InputFormatDesktopEnum.numeros,
          //   textInputType: TextInputType.number,
          //   label: "CELULAR",
          //   hintText: "Ingrese un celular",
          //   controller: _celularController,
          //   validator: (value) => Validators.validateWithMultiple([
          //     Validators.validateNotEmpty,
          //     (value) => Validators.validateLength(value, 9),
          //   ], value),
          //   maxlength: 9,
          // ),
          // AppBox.h10,
          // InputTextDate(
          //   label: "FECHA NACIMIENTO",
          //   hintText: "Fecha nacimiento",
          //   initialText: "",
          //   helper: "Ingrese la fecha de nacimiento del Doctor",
          //   maxDate: DateTime.now(),
          //   minDate: DateTime(1940),
          //   validator: Validators.validateNotEmpty,
          //   changeDate: (fechaString, fecha) {
          //     _fechaNacimientoSelected = fecha;
          //   },
          // ),
        ],
      ).animate().shimmer(),
    );
  }
}
