import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimeUtils {
  static DateTime? dateOrNull(String? date) {
    if (date == null) {
      return null;
    }
    return DateTime.parse(date);
  }

  static String formatTime(DateTime? date) {
    if (date == null) return '';
    // check if today
    if (DateUtils.isSameDay(date, DateTime.now())) {
      return DateFormat('HH:mm a').format(date);
    }
    // check if yesterday
    else if (DateUtils.isSameDay(
        date, DateTime.now().subtract(const Duration(days: 1)))) {
      return 'Yesterday';
    }

    return '${date.day}${_getDayOfMonthSuffix(date.day)} ${DateFormat('MMM').format(date)}';
  }

  static String formatTimeOnly(DateTime? date) {
    if (date == null) return '';
      return DateFormat('HH:mm a').format(date);
  }

  static String formatDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('d/M/yyyy').format(date);
  }

  static String formatFullDate(DateTime? date) {
    if (date == null) return '';
    return DateFormat('EEEE d/M/yyyy').format(date);
  }

  static String _getDayOfMonthSuffix(int dayNum) {
    if (!(dayNum >= 1 && dayNum <= 31)) {
      return '';
    }

    if (dayNum >= 11 && dayNum <= 13) {
      return 'th';
    }

    switch (dayNum % 10) {
      case 1:
        return 'st';
      case 2:
        return 'nd';
      case 3:
        return 'rd';
      default:
        return 'th';
    }
  }
}
