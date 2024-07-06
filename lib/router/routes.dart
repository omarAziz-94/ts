// generate a map of routes name:route

import 'package:flutter/material.dart';
import 'package:parent/features/about/pages/about_app_page.dart';
import 'package:parent/features/auth/pages/auth_page.dart';
import 'package:parent/features/home/pages/home_page.dart';
import 'package:parent/features/notifications/pages/notifications_page.dart';
import 'package:parent/features/settings/pages/settings_page.dart';
import 'package:parent/features/splash/pages/splash_page.dart';
import 'package:parent/features/student_details/pages/student_details.dart';
import 'package:parent/features/student_history/pages/student_history.dart';

class Routes {
  Routes._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  static final Map<String, Widget Function(BuildContext)> routes = {
    SplashPage.routeName: (BuildContext context) => const SplashPage(),
    HomePage.routeName: (BuildContext context) => const HomePage(),
    SettingsPage.routeName: (BuildContext context) => const SettingsPage(),
    AuthPage.routeName: (BuildContext context) => const AuthPage(),
    AboutAppPage.routeName: (BuildContext context) => const AboutAppPage(),
    StudentDetails.routeName: (BuildContext context) => const StudentDetails(),
    StudentHistory.routeName: (BuildContext context) => const StudentHistory(),
    NotificationsPage.routeName: (BuildContext context) =>
        const NotificationsPage(),
  };
}
