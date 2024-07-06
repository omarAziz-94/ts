import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/shared/widgets/custom_appbar.dart';
import 'package:parent/features/shared/widgets/notifications_counter.dart';
import 'package:parent/features/student_details/controllers/details/student_details_cubit.dart';
import 'package:parent/features/student_details/widgets/student_details_view.dart';

import '../../auth/models/student.dart';

class StudentDetails extends StatelessWidget {
  static const String routeName = '/student_details';

  const StudentDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Student student =
        context.read<StudentDetailsCubit>().studentDetailsService!.student;
    return Scaffold(
      appBar: CustomAppBar(
        title: student.name ?? '',
        trailing: const NotificationsCounter(),
      ),
      body: const StudentDetailsView(),
    );
  }
}
