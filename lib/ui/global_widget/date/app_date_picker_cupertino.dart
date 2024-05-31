import 'package:admin_clinica_front/core/utils/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppDatePickerCupertino extends StatelessWidget {
  final DateTime initialDateTime;
  final void Function(DateTime) onDateTimeChanged;
  const AppDatePickerCupertino({
    super.key,
    required this.initialDateTime,
    required this.onDateTimeChanged,
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
                    color: AppColors.slg01,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.restore,
                    color: AppColors.white,
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
