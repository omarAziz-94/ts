import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/services/trips_history.dart';

part 'trips_history_state.dart';

class TripsHistoryCubit extends Cubit<TripsHistoryState> {
  TripsHistoryCubit() : super(TripsHistoryInitial());

  TripsHistoryService? _tripsHistoryService;

  TripsHistoryService? get tripsHistoryService => _tripsHistoryService;

  setTripsHistoryService(TripsHistoryService service) {
    _tripsHistoryService = service;
    emit(TripsHistoryInitial());
    _fetchHistory();
  }

  Future<void> _fetchHistory() async {
    emit(TripsHistoryLoading());
    try {
      await _tripsHistoryService?.fetchUserTripsHistory();
      emit(TripsHistoryLoaded(_tripsHistoryService?.filteredTripsHistory??[]));
    } on AppError catch (e) {
      emit(TripsHistoryError(e.message));
    } on Exception catch (_) {
      emit(TripsHistoryError('Something went wrong'));
    }
  }

  applyFilter(List<DateTime> range) {
    _tripsHistoryService?.applyFilter(range);
    emit(TripsHistoryLoaded(_tripsHistoryService?.filteredTripsHistory??[]));
  }

  removeFilter() {
    _tripsHistoryService?.removeFilter();
    emit(TripsHistoryLoaded(_tripsHistoryService?.filteredTripsHistory??[]));
  }
}
