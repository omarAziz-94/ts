part of 'notifications_cubit.dart';

abstract class NotificationsState extends Equatable {
  final List<AppNotification> notifications;

  const NotificationsState(this.notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationsInitial extends NotificationsState {
  const NotificationsInitial(List<AppNotification> notifications)
      : super(notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationsLoading extends NotificationsState {
  const NotificationsLoading(List<AppNotification> notifications)
      : super(notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationsLoaded extends NotificationsState {
  const NotificationsLoaded(List<AppNotification> notifications)
      : super(notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationsError extends NotificationsState {
  final String message;

  const NotificationsError(List<AppNotification> notifications,
      {required this.message})
      : super(notifications);

  @override
  List<Object?> get props => [message, notifications];
}

class NotificationsMarkingAsRead extends NotificationsState {
  const NotificationsMarkingAsRead(List<AppNotification> notifications)
      : super(notifications);

  @override
  List<Object?> get props => [notifications];
}

class NotificationsAllRead extends NotificationsState {
  const NotificationsAllRead(List<AppNotification> notifications)
      : super(notifications);

  @override
  List<Object?> get props => [notifications];
}
