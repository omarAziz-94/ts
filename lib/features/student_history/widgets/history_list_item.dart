import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/utils/date_time_utils.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_history/widgets/station_history_view.dart';
import 'package:parent/l10n/l10n.dart';

class HistoryListItem extends StatelessWidget {
  final Trip history;
  final bool showTitles;

  const HistoryListItem(
      {required this.history, this.showTitles = true, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      width: MediaQuery.of(context).size.width * 0.8,
      height: 160,
      child: Material(
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        context.l10n.date,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.lightGrey),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        DateTimeUtils.formatDate(history.date),
                        style: Theme.of(context).textTheme.bodyText2?.copyWith(
                              color: AppColors.primary,
                            ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        history.isGoing == true ? l10n.to : l10n.from,
                        style: Theme.of(context)
                            .textTheme
                            .labelMedium
                            ?.copyWith(color: AppColors.lightGrey),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.school,
                        color: AppColors.primary,
                      ),
                    ],
                  )
                ],
              ),
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (history.route?.stations?.isNotEmpty == true)
                      StationHistoryView(
                        station: history.route!.stations!.first,
                      ),
                    const Spacer(),
                    if ((history.route?.stations?.length ?? 0) > 1 == true)
                      StationHistoryView(
                        station: history.route!.stations!.last,
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
