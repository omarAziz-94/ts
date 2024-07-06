import 'package:flutter/material.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/steps/checkin_step.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/steps/driver_step.dart';
import 'package:parent/features/student_details/widgets/active_trip_card/steps/pickup_step.dart';

class StudentStepper extends StatelessWidget {
  const StudentStepper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      primary: false,
      padding: EdgeInsets.zero,
      children: const [DriverStep(), PickupStep(), CheckInStep()],
    );
  }
}
