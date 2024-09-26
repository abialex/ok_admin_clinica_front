import 'package:admin_clinica_front/app/common/constants/app_const_colors.dart';
import 'package:admin_clinica_front/app/common/widget/app_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDatePickerCupertino extends StatelessWidget {
  final DateTime initialDateTime;
  final void Function(DateTime) onDateTimeChanged;
  final bool paddingLeftActivate;
  const AppDatePickerCupertino({
    super.key,
    required this.initialDateTime,
    required this.onDateTimeChanged,
    this.paddingLeftActivate = false,
  });

  @override
  Widget build(BuildContext context) {
    UniqueKey keys = UniqueKey();
    return BlocProvider(
      create: (context) => DateTimeCubit(),
      child: BlocBuilder<DateTimeCubit, DateTime>(
        builder: (context, state) {
          return Row(
            children: [
              if (paddingLeftActivate) AppBox.w16,
              Expanded(
                child: CupertinoDatePicker(
                  key: keys,
                  initialDateTime: context.read<DateTimeCubit>().state,
                  onDateTimeChanged: (value) {
                    context.read<DateTimeCubit>().changeDateTime(value);
                    onDateTimeChanged(value);
                  },
                  dateOrder: DatePickerDateOrder.ymd,
                  mode: CupertinoDatePickerMode.date,
                  use24hFormat: true,
                  minimumYear: 2023,
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.read<DateTimeCubit>().resetToToday();
                  onDateTimeChanged(context.read<DateTimeCubit>().state);
                  keys = UniqueKey();
                },
                child: Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    color: AppConstColors.slg01,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.restore,
                    color: AppConstColors.white,
                    size: 24,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class DateTimeCubit extends Cubit<DateTime> {
  DateTimeCubit() : super(DateTime.now());

  void changeDateTime(DateTime mode) {
    emit(mode);
  }

  void resetToToday() {
    emit(DateTime.now());
  }
}
