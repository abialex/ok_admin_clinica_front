// ignore_for_file: library_private_types_in_public_api, inference_failure_on_instance_creation, inference_failure_on_function_return_type, sort_constructors_first, lines_longer_than_80_chars, avoid_redundant_argument_values

import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/utils/extensions/date_time_extensions.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class AppCalendarWidget extends StatefulWidget {
  final Function(DateTime) onDaySelected;

  const AppCalendarWidget({required this.onDaySelected, super.key});

  @override
  _AppCalendarWidgetState createState() => _AppCalendarWidgetState();
}

class _AppCalendarWidgetState extends State<AppCalendarWidget> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = _focusedDay;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 5),
      decoration: BoxDecoration(
        color: AppConstColors.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: TableCalendar(
        locale: 'es',
        firstDay: DateTime.utc(2010, 1, 1),
        lastDay: DateTime.utc(3000, 12, 31),
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        calendarStyle: const CalendarStyle(
          cellMargin: EdgeInsets.zero,
          selectedDecoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppConstColors.blue,
          ),
        ),
        headerStyle: HeaderStyle(
          titleTextStyle: const TextStyle(color: Colors.white, fontSize: 16),
          titleCentered: true,
          formatButtonVisible: false,
          titleTextFormatter: (date, locale) => date.formatHeaderTitle(),
          headerPadding: EdgeInsets.zero,
          leftChevronIcon: const Icon(Icons.chevron_left, color: Colors.white),
          rightChevronIcon: const Icon(Icons.chevron_right, color: Colors.white),
          decoration: const BoxDecoration(
            color: AppConstColors.slg02,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        rowHeight: 25,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay;
          });
          widget.onDaySelected(_selectedDay!);
        },
        onPageChanged: (focusedDay) {
          _focusedDay = focusedDay;
        },
      ),
    );
  }
}
