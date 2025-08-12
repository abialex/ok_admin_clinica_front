import 'package:admin_clinica_front/app/common/constants/app_const_svgs.dart';
import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/models/doctor/doctor_dto.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_grid_sliver_list.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class ListDoctorHorizontal extends StatelessWidget {
  final int? doctorIdInitialSelected;
  final List<DoctorDto> doctors;
  final void Function(DoctorDto) onChanged;

  const ListDoctorHorizontal({
    super.key,
    required this.doctors,
    required this.onChanged,
    this.doctorIdInitialSelected,
  });

  @override
  Widget build(BuildContext context) {
    if (doctorIdInitialSelected == null && doctors.isNotEmpty) {
      onChanged(doctors[0]);
      context.read<DoctoSelectedCubit>().goto(doctors[0]);
    }
    final doctorSelecteds = doctors.where(
      (element) => doctorIdInitialSelected == element.id,
    );

    return BlocProvider(
      create: (context) => DoctoSelectedCubit(doctorInitial: doctorSelecteds.isNotEmpty ? doctorSelecteds.first : doctors[0]),
      child: BlocBuilder<DoctoSelectedCubit, DoctorDto?>(
        builder: (context, state) {
          return AppGridSliverList<DoctorDto>(
            maxCrossAxisExtent: 50,
            itemHeight: 200,
            items: doctors,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, item) {
              return GestureDetector(
                onTap: () {
                  onChanged(item);
                  context.read<DoctoSelectedCubit>().goto(item);
                },
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  padding: const EdgeInsets.all(2.5),
                  decoration: BoxDecoration(
                    color: (state?.id == item.id ? AppConstColors.slg04 : Colors.white),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        AppConstSvgs.doctor,
                        width: 50,
                        height: 50,
                        color: state?.id == item.id ? AppConstColors.white : AppConstColors.dark,
                      ),
                      const SizedBox(height: 5),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          AppTextGlobal.labelLightText(text: item.nombres, fontSize: 12, colorText: state?.id == item.id ? AppConstColors.white : AppConstColors.dark),
                          AppTextGlobal.labelLightText(text: item.apellidos, fontSize: 10, colorText: AppConstColors.lightwhite),
                        ],
                      ),
                      AppBox.w10,
                    ],
                  ),
                ),
              );
            },
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
