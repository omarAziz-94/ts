import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/student_details/controllers/details/student_details_cubit.dart';
import 'package:parent/features/student_details/services/student_service.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/active_trip_card.dart';
import 'package:parent/features/student_details/widgets/details_history_preview.dart';

import '../../../core/constants/images.dart';

class StudentDetailsView extends StatelessWidget {
  const StudentDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final StudentDetailsService studentService =
        context.read<StudentDetailsCubit>().studentDetailsService!;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 24),
          CircleAvatar(
            radius: 74,
            backgroundImage: NetworkImage(
              Images.getImage(studentService.student.image ?? ''),
            ),
          ),
          const SizedBox(height: 24),
          Text(
            studentService.student.name ?? '',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          const SizedBox(height: 16),
          Text(
            studentService.student.grade?.name ?? '',
            style: Theme.of(context)
                .textTheme
                .labelMedium
                ?.copyWith(color: AppColors.lightGrey),
          ),
          const SizedBox(height: 16),
          // Container(
          //   width: 103,
          //   height: 35,
          //   decoration: const BoxDecoration(
          //       color: AppColors.success,
          //       borderRadius: BorderRadius.all(Radius.circular(4))),
          //   child: Center(
          //     child: Text(
          //       'Picked up',
          //       style: Theme.of(context)
          //           .textTheme
          //           .labelMedium
          //           ?.copyWith(color: AppColors.white),
          //     ),
          //   ),
          // ),
          // const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.location_on, color: AppColors.primary),
              const SizedBox(width: 8),
              Text(
                studentService.student.station?.name ?? '',
                style: Theme.of(context).textTheme.caption,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const ActiveTripCard(),
          const SizedBox(height: 24),
          const DetailsHistoryPreview(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}
