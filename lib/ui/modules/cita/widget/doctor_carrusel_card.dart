import 'package:admin_clinica_front/core/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorCarousel extends StatelessWidget {
  final int? doctorIdInitialSelected;
  final List<DoctorsViewModel> doctors;
  final void Function(DoctorsViewModel) onChanged;

  const DoctorCarousel({
    super.key,
    required this.doctors,
    required this.onChanged,
    this.doctorIdInitialSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (doctorIdInitialSelected == null && doctors.isNotEmpty) {
      onChanged(doctors[0]);
    }
    return SizedBox(
      height: 60,
      child: PageView.builder(
        onPageChanged: (value) => onChanged(doctors[value]),
        itemCount: doctors.length,
        controller: PageController(
            viewportFraction: 0.75,
            initialPage: doctors
                .indexWhere(
                  (element) => doctorIdInitialSelected == element.id,
                )
                .clamp(0, doctors.length)),
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 0.9,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    AppConstSvgs.doctor,
                    height: 60,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 8),
                          child: AppTextGlobal.labelLightText(text: doctors[index].nombres),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            doctors[index].apellidos,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
