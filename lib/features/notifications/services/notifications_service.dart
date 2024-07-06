import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/notifications/models/app_notification.dart';
import 'package:parent/features/notifications/repository/notifications_repository.dart';

class NotificationsService {
  final NotificationsRepository _repository;

  NotificationsService(this._repository);

  List<AppNotification> _notifications = [];

  List<AppNotification> get notifications => [..._notifications];

  Future<List<AppNotification>> getNotifications() async {
    try {
      _notifications = await _repository.getNotifications();

      return notifications;
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }

  Future<bool> markAsRead() async {
    try {
      bool isComplete = await _repository.markAllAsRead();
      if (isComplete) {
        for (var element in _notifications) {
          element.isRead = true;
        }
      }
      return isComplete;
    } catch (e) {
      throw NetworkException(e.toString());
    }
  }
}
