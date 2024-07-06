import 'package:bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/core/services/notifications/fb_notifications.dart';

part 'notifications_state.dart';

class NotificationsControllerCubit extends Cubit<NotificationsState> {
  NotificationsControllerCubit() : super(NotificationsInitial());
  final FBNotifications _notifications =
      GetIt.I.get<FBNotifications>();

  bool get isNotificationsEnabled => _notifications.fcmToken != null;

  checkNotifications() {
    _notifications.fcmToken == null
        ? emit(NotificationsDisabled())
        : emit(NotificationsEnabled());
  }

  enableNotifications() async {
    try {
      await _notifications.enableNotifications();
      emit(NotificationsEnabled());
    } on AppError catch (e) {
      emit(NotificationsUpdateError(e.message));
    }
  }

  disableNotifications() async {
    try {
      await _notifications.stopReceivingNotifications();
      emit(NotificationsDisabled());
    } on AppError catch (e) {
      emit(NotificationsUpdateError(e.message));
    }
  }
}
