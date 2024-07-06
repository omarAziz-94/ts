import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/shared/widgets/custom_button.dart';
import 'package:parent/features/student_details/controllers/trips_history/trips_history_cubit.dart';
import 'package:parent/l10n/l10n.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class TimeIntervalPicker extends StatefulWidget {
  const TimeIntervalPicker({Key? key}) : super(key: key);

  @override
  State<TimeIntervalPicker> createState() => _TimeIntervalPickerState();
}

class _TimeIntervalPickerState extends State<TimeIntervalPicker> {
  late final DateRangePickerController controller;

  @override
  void initState() {
    super.initState();
    controller = DateRangePickerController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  List<DateTime> range = [];

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: double.maxFinite,
            height: 235,
            child: SfDateRangePicker(
              controller: controller,
              view: DateRangePickerView.month,
              selectionMode: DateRangePickerSelectionMode.multiple,
              enablePastDates: true,
              endRangeSelectionColor: AppColors.primary,
              startRangeSelectionColor: AppColors.primary,
              navigationMode: DateRangePickerNavigationMode.none,
              selectionColor: AppColors.primary.withOpacity(0.8),
              onSelectionChanged: (DateRangePickerSelectionChangedArgs args) {
                AppLog.e(args.value.runtimeType);
                range = args.value;
              },
              monthViewSettings: DateRangePickerMonthViewSettings(
                firstDayOfWeek: 6,
                dayFormat: 'E',
                viewHeaderStyle: DateRangePickerViewHeaderStyle(
                  textStyle: Theme.of(context).textTheme.overline?.copyWith(
                        color: AppColors.lightGrey,
                        fontSize: 8,
                      ),
                ),
              ),
              selectionTextStyle:
                  Theme.of(context).textTheme.overline?.copyWith(
                        color: AppColors.white,
                      ),
              selectionRadius: 46,
              headerStyle: DateRangePickerHeaderStyle(
                textAlign: TextAlign.center,
                textStyle: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: AppColors.primary),
              ),
            ),
          ),
          const SizedBox(height: 24),
          CustomButton(
              title: context.l10n.go,
              shrink: true,
              onPressed: () {
                // if (range.endDate == null || range.startDate == null) {
                //   AppLog.v('removing filter');
                //   context.read<TripsHistoryCubit>().removeFilter();
                // } else {

                  context.read<TripsHistoryCubit>().applyFilter(range);
                // }
                Navigator.of(context).pop();
              }),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
