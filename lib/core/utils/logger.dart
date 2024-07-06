import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:parent/core/constants/colors.dart';

import '../../router/routes.dart';

class AppLog {
  static final _logger = Logger();

  static d(dynamic message) => _logger.d(message);

  static e(dynamic message) => _logger.e(message);

  static w(dynamic message) => _logger.w(message);

  static v(dynamic message) => _logger.v(message);

  static i(dynamic message) => _logger.i(message);

  static wtf(dynamic message) => _logger.wtf(message);

  static showSnackBar(BuildContext context, String message,
      {Color color = AppColors.primary, Color textColor = AppColors.white}) {
    Routes.scaffoldMessengerKey.currentState?.clearSnackBars();
    _logger.v('Showing SnackBar: $message');
    Routes.scaffoldMessengerKey.currentState?.showSnackBar(
      SnackBar(
        backgroundColor: color,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        content: Text(
          message,
          style: Theme.of(context).textTheme.button?.copyWith(color: textColor),
        ),
      ),
    );
  }
}
