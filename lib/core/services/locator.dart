import 'package:get_it/get_it.dart';

import 'notifications/fb_notifications.dart';

class Locator {
  final getIt = GetIt.instance;
  void setup() {
    getIt.registerSingleton<FBNotifications>(FBNotifications());
  }
}
