import 'package:admin_clinica_front/core/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/ui/global_widget/app_text_style.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DoctorCarousel extends StatelessWidget {
  final List<DoctorsViewModel> doctors;

  const DoctorCarousel({super.key, required this.doctors});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      child: PageView.builder(
        itemCount: doctors.length,
        controller: PageController(viewportFraction: 0.75),
        itemBuilder: (context, index) {
          return Transform.scale(
            scale: 0.95,
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
                        // ClipRRect(
                        //   borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                        //   child: Image.network(
                        //     doctors[index].imageUrl,
                        //     fit: BoxFit.cover,
                        //     height: 100,
                        //     width: double.infinity,
                        //   ),
                        // ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
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
