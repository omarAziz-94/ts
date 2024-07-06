import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/shared/widgets/common_loading.dart';
import 'package:parent/features/student_details/controllers/trips_history/trips_history_cubit.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_history/widgets/history_list_item.dart';
import 'package:parent/l10n/l10n.dart';

class HistoryView extends StatelessWidget {
  const HistoryView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TripsHistoryCubit, TripsHistoryState>(
        builder: (context, state) {
      List<Trip> history = BlocProvider.of<TripsHistoryCubit>(context)
          .tripsHistoryService!
          .filteredTripsHistory;
      if (state is TripsHistoryLoading) return const CommonLoading();
      if (state is TripsHistoryError) {
        return Center(child: Text(context.localizeError(state.message)));
      }
      if (history.isEmpty) return Center(child: Text(context.l10n.noHistory));
      return ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) => HistoryListItem(
          history: history[index],
        ),
      );
    });
  }
}
