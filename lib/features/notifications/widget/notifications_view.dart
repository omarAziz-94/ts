import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parent/features/notifications/controller/notifications_cubit.dart';
import 'package:parent/features/notifications/widget/mark_all_notification_button.dart';
import 'package:parent/features/notifications/widget/notitifcation_list_item.dart';
import 'package:parent/features/shared/widgets/common_loading.dart';

class NotificationsView extends StatelessWidget {
  const NotificationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationsCubit, NotificationsState>(
        builder: (context, NotificationsState state) {
      if (state is NotificationsLoading) {
        return const CommonLoading();
      } else if (state is NotificationsError) {
        return Center(child: Text(state.message));
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const MarkAllNotificationButton(),
            Expanded(
              child: ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (context, index) => NotificationListItem(
                  notification: state.notifications[index],
                ),
              ),
            ),
          ],
        );
      }
    });
  }
}
