import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/features/shared/widgets/common_loading.dart';
import 'package:parent/features/student_details/controllers/trips_history/trips_history_cubit.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_history/pages/student_history.dart';
import 'package:parent/features/student_history/widgets/history_list_item.dart';
import 'package:parent/l10n/l10n.dart';

class DetailsHistoryPreview extends StatelessWidget {
  final bool showTitles;

  const DetailsHistoryPreview({Key? key, this.showTitles = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 12),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                context.l10n.recentTrips,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              GestureDetector(
                onTap: () =>
                    Navigator.of(context).pushNamed(StudentHistory.routeName),
                child: Text(
                  context.l10n.seeAll,
                  style: Theme.of(context)
                      .textTheme
                      .caption
                      ?.copyWith(color: AppColors.lightGrey),
                ),
              ),
            ],
          ),
        ),
        BlocBuilder<TripsHistoryCubit, TripsHistoryState>(
          builder: (context, state) {
            List<Trip> history = BlocProvider.of<TripsHistoryCubit>(context)
                .tripsHistoryService!
                .tripsHistory;

            if (state is TripsHistoryLoading) {
              return const Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 64),
                  child: CommonLoading(),
                ),
              );
            }

            if (state is TripsHistoryError) {
              return SizedBox(
                height: 160,
                width: double.maxFinite,
                child: Center(child: Text(state.message)),
              );
            }

            return SizedBox(
              height: 160,
              width: double.maxFinite,
              child: history.isEmpty
                  ? Center(
                      child: Text(context.l10n.noHistory),
                    )
                  : ListView.builder(
                      itemCount: history.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return HistoryListItem(
                          history: history[index],
                          showTitles: false,
                        );
                      }),
            );
          },
        )
      ],
    );
  }
}
