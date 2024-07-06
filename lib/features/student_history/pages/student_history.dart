import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/shared/dialogs/time_interval_picker.dart';
import 'package:parent/features/shared/widgets/custom_appbar.dart';
import 'package:parent/features/student_history/widgets/history_view.dart';
import 'package:parent/l10n/l10n.dart';

import '../../auth/models/student.dart';
import '../../student_details/controllers/details/student_details_cubit.dart';

class StudentHistory extends StatelessWidget {
  static const String routeName = '/student_history';

  const StudentHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Student student =
        context.read<StudentDetailsCubit>().studentDetailsService!.student;
    return Scaffold(
      appBar: CustomAppBar(
        title:
            '${student.name?.split(' ').first ?? context.l10n.theSon} ${context.l10n.sonHistory}',
        trailing: GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (_) => const TimeIntervalPicker(),
          ),
          child: const Icon(Icons.calendar_month_sharp),
        ),
      ),
      body: const HistoryView(),
    );
  }
}
