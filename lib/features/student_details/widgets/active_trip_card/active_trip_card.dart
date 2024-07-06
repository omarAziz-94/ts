import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/strings.dart';
import 'package:parent/features/shared/widgets/common_loading.dart';
import 'package:parent/features/shared/widgets/content_card.dart';
import 'package:parent/features/student_details/controllers/active_trips/active_trips_cubit.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/progress_slider.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/student_stepper.dart';
import 'package:parent/l10n/l10n.dart';

class ActiveTripCard extends StatelessWidget {
  const ActiveTripCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<ActiveTripsCubit, ActiveTripsState>(
      builder: (context, state) {
        List<Trip> activeTrips = BlocProvider.of<ActiveTripsCubit>(context)
            .activeTripsService!
            .activeTrips;

        Trip? active;
        if (activeTrips.isNotEmpty) {
          active = activeTrips.first;
        }

        if (state is ActiveTripsLoading) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 64),
              child: CommonLoading(),
            ),
          );
        }
        if (state is ActiveTripsError) {
          return Center(
              child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 64),
            child: Text(context.localizeError(state.message)),
          ));
        }
        return activeTrips.isEmpty
            ?  Center(
                child: Padding(
                padding:const  EdgeInsets.symmetric(vertical: 64),
                child: Text(context.localizeError(AppStrings.noActiveTrips)),
              ))
            : ContentCard(
                child: Column(
                children: [
                  const StudentStepper(),
                  const SizedBox(height: 24),
                  ProgressSlider(
                      startLabel:
                          active!.route?.stations?.first.station?.name ?? '',
                      endLabel:
                          active.isGoing == true ? l10n.school : l10n.home,
                      value: getProgress(active)),
                  const SizedBox(height: 24),
                ],
              ));
      },
    );
  }

  double getProgress(Trip trip) {
    if (trip.currentStationId == null) return 0;

    int currentStationIndex = trip.route?.stations?.indexWhere(
            (Stations stations) =>
                stations.station?.id == trip.currentStationId) ??
        0;
    if (currentStationIndex < 0) return 0;
    return ((currentStationIndex + 1) / (trip.route?.stations?.length ?? 2)) *
        100;
  }
}
