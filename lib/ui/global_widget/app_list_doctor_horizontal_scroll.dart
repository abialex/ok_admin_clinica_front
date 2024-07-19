import 'package:admin_clinica_front/ui/global_widget/app_card_doctor.dart';
import 'package:admin_clinica_front/ui/view_models/doctor_view/doctor_view_models.dart';
import 'package:flutter/material.dart';

class ListDoctorHorizontalScroll extends StatelessWidget {
  final int? doctorIdInitialSelected;
  final List<DoctorsViewModel> doctors;
  final void Function(DoctorsViewModel) onChanged;

  const ListDoctorHorizontalScroll({
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
            child: AppCardDoctor(doctor: doctors[index]),
          );
        },
      ),
    );
  }
}
