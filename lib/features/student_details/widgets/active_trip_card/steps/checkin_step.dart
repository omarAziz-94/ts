import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/constants/images.dart';
import 'package:parent/core/utils/date_time_utils.dart';
import 'package:parent/features/student_details/controllers/active_trips/active_trips_cubit.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/student_step.dart';
import 'package:parent/l10n/l10n.dart';

class CheckInStep extends StatelessWidget {
  const CheckInStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Trip active = BlocProvider.of<ActiveTripsCubit>(context)
        .activeTripsService!
        .activeTrips
        .first;
    return StudentStep(
      title: context.l10n.checkIn,
      hideVerticalLine: true,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Images.calendarSVG,
                width: 14,
                height: 14,
                fit: BoxFit.cover,
                color: AppColors.lightGrey,
              ),
              const SizedBox(width: 8),
              Text(
                DateTimeUtils.formatFullDate(active.date),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: AppColors.primary,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SvgPicture.asset(
                Images.clockSVG,
                width: 14,
                height: 14,
                fit: BoxFit.cover,
                color: AppColors.lightGrey,
              ),
              const SizedBox(width: 8),
              Text(
                DateTimeUtils.formatTimeOnly(active.date),
                style: Theme.of(context).textTheme.caption?.copyWith(
                      color: AppColors.primary,
                      fontSize: 11,
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
