import 'dart:ui';

import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppListCarouselDoctor extends StatefulWidget {
  final int? doctorIdInitialSelected;
  final List<DoctorDto> doctors;
  final void Function(DoctorDto) onChanged;

  const AppListCarouselDoctor({
    super.key,
    required this.doctors,
    required this.onChanged,
    this.doctorIdInitialSelected,
  });

  @override
  State<AppListCarouselDoctor> createState() => _AppListCarouselDoctorState();
}

class _AppListCarouselDoctorState extends State<AppListCarouselDoctor> {
  CarouselSliderController buttonCarouselController = CarouselSliderController();

  @override
  Widget build(BuildContext context) {
    if (widget.doctorIdInitialSelected == null && widget.doctors.isNotEmpty) {
      widget.onChanged(widget.doctors[0]);
      context.read<DoctoSelectedCubit>().goto(widget.doctors[0]);
    }
    final doctorSelecteds = widget.doctors.where(
      (element) => widget.doctorIdInitialSelected == element.id,
    );

    return BlocProvider(
      create: (context) => DoctoSelectedCubit(doctorInitial: doctorSelecteds.isNotEmpty ? doctorSelecteds.first : widget.doctors[0]),
      child: BlocBuilder<DoctoSelectedCubit, DoctorDto?>(
        builder: (context, state) {
          return ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {
                PointerDeviceKind.touch,
                PointerDeviceKind.mouse, // Permite desplazamiento con mouse en desktop
              },
            ),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.doctors.length,
              itemBuilder: (context, index) {
                final item = widget.doctors[index];
                return GestureDetector(
                  onTap: () {
                    buttonCarouselController.animateToPage(2);

                    widget.onChanged(item);
                    context.read<DoctoSelectedCubit>().goto(item);
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 7.5),
                    padding: const EdgeInsets.all(2.5),
                    decoration: BoxDecoration(color: (state?.id == item.id ? AppConstColors.green2 : Colors.white), borderRadius: BorderRadius.circular(10), boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.75), // Color de la sombra
                        spreadRadius: -2,
                        blurRadius: 5,
                        offset: const Offset(1.5, 1.5),
                      ),
                    ]),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // SvgPicture.asset(
                        //   AppConstSvgs.doctor,
                        //   width: 50,
                        //   height: 50,
                        //   color: state?.id == item.id ? AppConstColors.white : AppConstColors.dark,
                        // ),
                        SizedBox(
                          width: 40,
                          child: Center(
                            child: AppTextGlobal.labelMediumText(
                              text: item.nombres.substring(0, 1),
                              colorText: state?.id == item.id ? AppConstColors.white : AppConstColors.dark,
                            ),
                          ),
                        ),
                        const SizedBox(height: 5),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AppTextGlobal.labelLightText(
                              text: item.nombres,
                              fontSize: 12,
                              colorText: state?.id == item.id ? AppConstColors.white : AppConstColors.dark,
                              maxLines: 2,
                            ),
                            AppTextGlobal.labelLightText(
                              text: item.apellidos,
                              fontSize: 10,
                              colorText: AppConstColors.lightGray,
                              maxLines: 1,
                            ),
                          ],
                        ),
                        AppBox.w10,
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class DoctoSelectedCubit extends Cubit<DoctorDto?> {
  final DoctorDto doctorInitial;
  DoctoSelectedCubit({required this.doctorInitial}) : super(doctorInitial);

  void goto(DoctorDto doctorsViewModel) {
    emit(doctorsViewModel);
  }

  void reset() {
    emit(null);
  }
}
