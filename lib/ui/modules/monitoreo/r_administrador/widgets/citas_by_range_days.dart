import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/modules/monitoreo/r_administrador/widgets/grafico_cita_asistenta.dart';
import 'package:admin_clinica_front/ui/view_models/cita_view/cita_view_models.dart';
import 'package:flutter/material.dart';

class GraficoByRangeDays extends StatelessWidget {
  const GraficoByRangeDays({
    super.key,
    required this.citas,
    required this.request,
  });
  final List<CitaPromedioDateTime> citas;
  final CitaRequestAdminViewModel request;

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
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "3h",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "2h",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              // ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "1h",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              Expanded(
                child: LayoutBuilder(
                  builder: (context, constraints) => Container(
                      alignment: Alignment.bottomRight,
                      color: AppColors.slg01,
                      child: AppTextGlobal.labelMediumText(
                        text: "0h ",
                        colorText: AppColors.white,
                      )),
                ),
              ),
              ColoredBox(
                color: AppColors.blueSecondary,
                child: AppTextGlobal.labelSmallText(text: 'CANT. CITAS', fontSize: 11, maxLines: 2, textAlign: TextAlign.center, colorText: AppColors.white),
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
          child: GraficoCitaAsistentaControl(itemsList: citas),
        ),
      ],
    );
  }
}
