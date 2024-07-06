import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/student_details/controllers/active_trips/active_trips_cubit.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/student_step.dart';
import 'package:parent/l10n/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class DriverStep extends StatelessWidget {
  const DriverStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Trip active = BlocProvider.of<ActiveTripsCubit>(context)
        .activeTripsService!
        .activeTrips
        .first;
    return StudentStep(
        title: context.l10n.driverDetails,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              active.driver?.name ?? '',
              style: Theme.of(context).textTheme.button?.copyWith(
                    color: AppColors.primary,
                    fontWeight: FontWeight.w500,
                  ),
            ),
            if (active.driver?.phone != null)
              GestureDetector(
                onTap: () {
                  launchUrl(Uri(
                    scheme: 'tel',
                    path: active.driver?.phone,
                  ));
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: const BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                  child: const Icon(Icons.phone, color: AppColors.white),
                ),
              )
          ],
        ));
  }
}
