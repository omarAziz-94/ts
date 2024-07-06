import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:parent/core/constants/strings.dart';

import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

/// This class is a wrapper around
/// https://pub.dev/packages/flutter_local_notifications
///
/// It provides multiple functions to handle notifications in multiple use cases
/// This file must be initialized by the only available constructor taking
/// the page [BuildContext]
///
class NotificationsHelper {
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  late final IOSInitializationSettings initializationSettingsIOS;
  late final AndroidInitializationSettings initializationSettingsAndroid;

  /// initializing package requirements in constructor
  NotificationsHelper() {
    initializationSettingsAndroid =
        const AndroidInitializationSettings('@drawable/ic_launcher');
    initializationSettingsIOS =
        const IOSInitializationSettings(onDidReceiveLocalNotification: null);

    final initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      // onSelectNotification: onSelectNotification,
    );
  }

  /// shows instant notification with title, body, icon, payload all optional,
  /// all notifications use the same channel ID and details
  /// -defined in const Strings file- to replace
  /// them selves when showing a notification it will dismiss the previous one
  ///
  /// the payload is the data used to customize click action it can be
  /// a string or encoded map (json)
  showNotification({
    int? id,
    String? title,
    String? body,
    String? icon,
    String? payload,
  }) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      AppStrings.notificationsChannelId,
      AppStrings.notificationsChannelName,
      channelDescription: AppStrings.notificationsChannelDescription,
      importance: Importance.max,
      priority: Priority.high,
      showProgress: true,
      playSound: true,
      ticker: 'ticker',
    );
    const iOSPlatformChannelSpecifics =
        IOSNotificationDetails(presentSound: true);
    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.show(
      id ?? 0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  /// used to show a notification after a period of time, specified by the
  /// duration parameter
  showScheduledNotification({
    int? id,
    String? title,
    String? body,
    String? icon,
    String? payload,
    required Duration duration,
  }) async {
    tz.initializeTimeZones();
    const AndroidNotificationDetails androidPlatformChannelSpecifics =
        AndroidNotificationDetails(
      AppStrings.notificationsChannelId,
      AppStrings.notificationsChannelName,
      channelDescription: AppStrings.notificationsChannelDescription,
    );
    const iOSPlatformChannelSpecifics = IOSNotificationDetails();
    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics,
    );
    await flutterLocalNotificationsPlugin.zonedSchedule(
      id ?? 0,
      title,
      body,
      tz.TZDateTime.now(tz.local).add(duration),
      platformChannelSpecifics,
      payload: payload,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  /// used to show a notification every while specified by the required
  /// [RepeatInterval] value
  showPeriodicNotification({
    int? id,
    String? title,
    String? body,
    String? icon,
    String? payload,
    required RepeatInterval repeatInterval,
  }) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
      AppStrings.notificationsChannelId,
      AppStrings.notificationsChannelName,
      channelDescription: AppStrings.notificationsChannelDescription,
    );
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.periodicallyShow(
      id ?? 0,
      title,
      body,
      repeatInterval,
      platformChannelSpecifics,
    );
  }

  /// closes all visible notifications
  cancelAllNotifications() async {
    await flutterLocalNotificationsPlugin.cancelAll();
  }
}
