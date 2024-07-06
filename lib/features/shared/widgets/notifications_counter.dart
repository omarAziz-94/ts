import 'package:flutter/material.dart';

class NotificationsCounter extends StatelessWidget {
  const NotificationsCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox();
    // return  GestureDetector(
    //   onTap: () =>
    //       Navigator.of(context).pushNamed(NotificationsPage.routeName),
    //   child: SvgPicture.asset(Images.notificationsSVG,
    //       height: 24, width: 24, color: AppColors.white),
    // );
  }
}
