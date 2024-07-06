import 'package:flutter/material.dart';
import 'package:parent/core/constants/colors.dart';
import 'package:parent/core/utils/date_time_utils.dart';
import 'package:parent/features/notifications/models/app_notification.dart';
import 'package:parent/features/shared/widgets/circle_marker.dart';

class NotificationListItem extends StatelessWidget {
  final AppNotification notification;

  const NotificationListItem({required this.notification, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(8),
      child: Material(
        elevation: 4,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        color: AppColors.white,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              Expanded(
                flex: 4,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(notification.title,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText2
                            ?.copyWith(color: AppColors.primary)),
                    const SizedBox(height: 8),
                    Text(notification.body,
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            ?.copyWith(color: AppColors.lightGrey)),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    FittedBox(
                      child: Text(
                        DateTimeUtils.formatTime(notification.date),
                        style: Theme.of(context)
                            .textTheme
                            .overline
                            ?.copyWith(color: AppColors.lightGrey),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // indicator if notification is read or not
                    if (!notification.isRead) const CircleMarker(),
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
