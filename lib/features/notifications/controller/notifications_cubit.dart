import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parent/features/notifications/models/app_notification.dart';
import 'package:parent/features/notifications/services/notifications_service.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit(this._notificationsService) : super(const NotificationsInitial([]));
  final NotificationsService _notificationsService;

  fetchNotifications() async {
    emit(NotificationsLoading(_notificationsService.notifications));
    try {
      final notifications = await _notificationsService.getNotifications();
      emit(NotificationsLoaded( notifications));
    } catch (e) {
      emit(NotificationsError(_notificationsService.notifications, message: e.toString()));
    }
  }

  markAllAsRead() async {
    emit(NotificationsMarkingAsRead( _notificationsService.notifications));
    await _notificationsService.markAsRead();
    emit(NotificationsAllRead(_notificationsService.notifications));
  }
}
