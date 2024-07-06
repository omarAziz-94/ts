import 'package:parent/features/notifications/models/app_notification.dart';

class NotificationsRepository {
  NotificationsRepository();

  Future<List<AppNotification>> getNotifications() async {
    return Future.delayed(
      const Duration(milliseconds: 500),
      () => List.generate(
        10,
        (i) => AppNotification(
          id: i,
          title: 'Notification $i',
          body:
              'Notification $i body Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
          date: DateTime.now().subtract(Duration(days: i)),
          isRead: i > 5,
        ),
      ),
    );
  }

  Future<bool> markAllAsRead() async {
    return Future.delayed(const Duration(seconds: 1), () => true);
  }
}
