import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/utils/date_time_utils.dart';
import 'package:parent/features/student_details/controllers/active_trips/active_trips_cubit.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/student_step.dart';
import 'package:parent/l10n/l10n.dart';

class PickupStep extends StatelessWidget {
  const PickupStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Trip active = BlocProvider.of<ActiveTripsCubit>(context)
        .activeTripsService!
        .activeTrips
        .first;
    return StudentStep(
        title: l10n.pickUpLocation,
        child: Column(
          children: [
            if (active.route?.stations?.isNotEmpty == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    active.route?.stations?.first.station?.name ?? '',
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    DateTimeUtils.formatTime(active.departed),
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
            const SizedBox(height: 8),
            if ((active.route?.stations?.length ?? 0) > 1 == true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    active.route?.stations?.last.station?.name ?? '',
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                  Text(
                    DateTimeUtils.formatTime(active.arrived),
                    style: Theme.of(context).textTheme.button?.copyWith(
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ],
              ),
          ],
        ));
  }
}
