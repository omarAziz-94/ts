import 'package:flutter/material.dart';
import 'package:parent/core/utils/logger.dart';

class NavigationLogger extends NavigatorObserver {
  @override
  void didPop(Route route, Route? previousRoute) {
    AppLog.i(
        'Popping from: ${previousRoute?.settings.name}, to: ${route.settings.name}');
  }

  @override
  void didPush(Route route, Route? previousRoute) {
    AppLog.i(
        'Going to: ${route.settings.name}, from: ${previousRoute?.settings.name}');
  }
}
