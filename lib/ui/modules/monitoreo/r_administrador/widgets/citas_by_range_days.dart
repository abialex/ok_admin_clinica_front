import 'package:admin_clinica_front/common/enums/control_cita_tipo_enum.dart';
import 'package:admin_clinica_front/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/grafico_cita_asistenta.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GraficoByRangeDays extends StatelessWidget {
  const GraficoByRangeDays({
    super.key,
    required this.citas,
    required this.request,
    required this.tipoControlCita,
  });
  final List<CitaPromedioDateTime> citas;
  final CitaRequestAdminViewModel request;
  final ControlCitaTipoEnum tipoControlCita;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppConstColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "3h",
                        colorText: AppConstColors.white,
                      )),
                ),
              ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppConstColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "2h",
                        colorText: AppConstColors.white,
                      )),
                ),
              ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppConstColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "1h",
                        colorText: AppConstColors.white,
                      )),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppConstColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "0h ",
                        colorText: AppConstColors.white,
                      )),
                ),
              ),
              ColoredBox(
                color: AppConstColors.blueSecondary,
                child: AppTextGlobal.labelSmallText(text: 'CANT. CITAS', fontSize: 11, maxLines: 2, textAlign: TextAlign.center, colorText: AppConstColors.white),
              ),
              Container(
                  child: AppTextGlobal.labelMediumText(
                text: "DÍA",
                fontSize: 11,
                textAlign: TextAlign.center,
              )),
            ],
          ),
        ),
        Expanded(
          flex: 12,
          child: GraficoCitaAsistentaControl(
            itemsList: citas,
            tipoControlCita: tipoControlCita,
          ),
        ),
      ],
    );
  }
}
