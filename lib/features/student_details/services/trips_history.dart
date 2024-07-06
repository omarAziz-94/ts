import 'package:flutter/material.dart';
import 'package:parent/core/constants/strings.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/repositories/trips_history.dart';

class TripsHistoryService {
  TripsHistoryService(this.userId);

  final String userId;

  final TripsHistoryRepository _tripsHistoryRepository =
      TripsHistoryRepository();

  List<Trip> _tripsHistory = [];

  List<Trip> get tripsHistory => [..._tripsHistory];

  List<Trip> _filteredTripsHistory = [];

  List<Trip> get filteredTripsHistory => [..._filteredTripsHistory];

  bool _isDateInRange(DateTime? date, List<DateTime> range) {
    if (date == null) return false;
    return range.any((rangeDate) =>DateUtils.isSameDay(date, rangeDate));
  }

  applyFilter(List<DateTime> range) {
    _filteredTripsHistory = _tripsHistory
        .where((Trip trip) => _isDateInRange(trip.date, range))
        .toList();
  }

  removeFilter() {
    _filteredTripsHistory = [..._tripsHistory];
  }

  Future<void> fetchUserTripsHistory() async {
    try {
      _tripsHistory =
          await _tripsHistoryRepository.fetchUserTripsHistory(userId: userId);
      _filteredTripsHistory = [..._tripsHistory];
    } on AppError catch (_) {
      rethrow;
    } on Exception catch (_) {
      throw const OperationFailedException(AppStrings.someThingWentWrong);
    }
  }
}
