import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/shared/widgets/circle_marker.dart';
import 'package:parent/features/student_details/models/Trip.dart';

class StationHistoryView extends StatelessWidget {
  final Stations station;

  const StationHistoryView({required this.station, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleMarker(color: AppColors.success),
        const SizedBox(width: 8),
        Text(
          station.station?.name ?? '',
          maxLines: 1,
          softWrap: true,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: AppColors.primary,
              ),
        ),
      ],
    );
  }
}
