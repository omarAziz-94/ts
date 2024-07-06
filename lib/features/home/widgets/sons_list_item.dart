import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/constants/images.dart';
import 'package:parent/features/student_details/controllers/active_trips/active_trips_cubit.dart';
import 'package:parent/features/student_details/controllers/details/student_details_cubit.dart';
import 'package:parent/features/student_details/controllers/trips_history/trips_history_cubit.dart';
import 'package:parent/features/student_details/pages/student_details.dart';
import 'package:parent/features/student_details/services/active_trips.dart';
import 'package:parent/features/student_details/services/student_service.dart';
import 'package:parent/features/student_details/services/trips_history.dart';

import '../../auth/models/student.dart';

class SonsListItem extends StatelessWidget {
  final Student student;

  const SonsListItem({required this.student, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<StudentDetailsCubit>().resetStudentService(
              StudentDetailsService(student: student),
            );

        context.read<ActiveTripsCubit>().setActiveTripsService(
              ActiveTripsService(student.id.toString()),
            );

        context.read<TripsHistoryCubit>().setTripsHistoryService(
              TripsHistoryService(student.id.toString()),
            );
        Navigator.of(context).pushNamed(StudentDetails.routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Material(
          elevation: 5,
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundImage: NetworkImage(
                    Images.getImage(student.image ?? ''),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        student.name ?? '',
                        style: Theme.of(context).textTheme.button?.copyWith(
                              color: AppColors.primary,
                            ),
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: AppColors.lightGrey,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            student.station?.name ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .caption
                                ?.copyWith(color: AppColors.lightGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.primary,
                  size: 18,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
