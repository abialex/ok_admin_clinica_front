import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/int_extensions.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:admin_clinica_front/app/common/widget/app_text_style.dart';
import 'package:admin_clinica_front/app/common/widget/button_base/button_base.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:easy_date_timeline/easy_date_timeline.dart';

class AppCalendarTimeLine extends StatefulWidget {
  const AppCalendarTimeLine({super.key, this.onDateChange});
  final void Function(DateTime)? onDateChange;

  @override
  State<AppCalendarTimeLine> createState() => _AppCalendarTimeLineState();
}

class _AppCalendarTimeLineState extends State<AppCalendarTimeLine> with SingleTickerProviderStateMixin {
  final EasyInfiniteDateTimelineController _controller = EasyInfiniteDateTimelineController();
  late AnimationController _controllerStringDate;
  late DateTime _selectedDay;
  late int indexMonth;
  late int indexYear;
  final years = [2023, 2024, 2025, 2026];

  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now();
    indexMonth = _selectedDay.month;
    indexYear = _selectedDay.year;
    _controllerStringDate = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        EasyInfiniteDateTimeLine(
          locale: "Es",
          showTimelineHeader: true,
          headerBuilder: (context, date) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: List.generate(
                      years.length,
                      (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              indexYear = years[index];
                            });
                          },
                          child: Container(
                            margin: const EdgeInsets.symmetric(horizontal: 2.5),
                            padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 10),
                            decoration: BoxDecoration(
                              color: indexYear == years[index] ? AppConstColors.green2 : AppConstColors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.75), // Color de la sombra
                                  spreadRadius: -2,
                                  blurRadius: 5,
                                  offset: const Offset(1.5, 1.5),
                                ),
                              ],
                            ),
                            child: Text(years[index].toString(), style: TextStyle(color: indexYear == years[index] ? AppConstColors.white : AppConstColors.dark, fontWeight: FontWeight.bold)),
                          ),
                        );
                      },
                    ),
                  ),
                  AppBox.w10,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: List.generate(
                      12,
                      (index) {
                        return GestureDetector(
                            onTap: () {
                              _controller.animateToDate(DateTime(2024, index + 1, 1));
                              setState(() {
                                indexMonth = index + 1;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 2.5),
                              padding: const EdgeInsets.symmetric(vertical: 2.5, horizontal: 5),
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: indexMonth == (index + 1) ? AppConstColors.green3 : AppConstColors.white, boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.75), // Color de la sombra
                                  spreadRadius: -2,
                                  blurRadius: 5,
                                  offset: const Offset(1.5, 1.5),
                                ),
                              ]),
                              child: Text(
                                (index + 1).toMonth(),
                                style: TextStyle(color: indexMonth == (index + 1) ? AppConstColors.white : AppConstColors.dark, fontWeight: FontWeight.bold),
                              ),
                            ));
                      },
                    ),
                  ),
                  AppBox.w10,
                  ButtonCustomBase(
                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    textColor: AppConstColors.white,
                    backgroundColor: AppConstColors.green1,
                    text: 'Hoy',
                    suffix: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: Icon(
                        Icons.date_range,
                        color: AppConstColors.white,
                      ),
                    ),
                    onClick: () async {
                      setState(() {
                        indexMonth = DateTime.now().month;
                        indexYear = DateTime.now().year;
                        _selectedDay = DateTime.now();
                        widget.onDateChange?.call(_selectedDay);
                      });
                      await Future.delayed(0.05.seconds);
                      _controller.animateToDate(_selectedDay, duration: 0.5.seconds);
                      _controllerStringDate.forward(from: 0.0);
                    },
                  )
                      .animate(
                        onPlay: (controller) => controller.repeat(),
                      )
                      .shake(duration: 0.5.seconds, delay: 5.seconds),
                ],
              ),
            );
          },
          controller: _controller,
          firstDate: indexMonth.toMonthInitDate(indexYear),
          lastDate: indexMonth.toMonthEndDate(indexYear),
          focusDate: _selectedDay,
          activeColor: AppConstColors.green1,
          onDateChange: (selectedDate) {
            setState(() {
              indexMonth = selectedDate.month;
              _selectedDay = selectedDate;
              widget.onDateChange?.call(selectedDate);
              _controllerStringDate.forward(from: 0.0);
            });
            //`selectedDate` the new date selected.
          },
        ),
        AppTextGlobal.labelLightText(text: _selectedDay.toFormaMMddSlashEs().toUpperCase()).animate(controller: _controllerStringDate).flip()
      ],
    );
  }
}
