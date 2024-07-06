part of 'notifications_cubit.dart';

abstract class NotificationsState {}

class NotificationsInitial extends NotificationsState {}
class NotificationsEnabled extends NotificationsState {}
class NotificationsDisabled extends NotificationsState {}
class NotificationsLoading extends NotificationsState {}
class NotificationsUpdateError extends NotificationsState {
  final String message;
  NotificationsUpdateError(this.message);
}
