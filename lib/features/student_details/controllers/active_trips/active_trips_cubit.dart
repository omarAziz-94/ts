import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/student_details/services/active_trips.dart';

part 'active_trips_state.dart';

class ActiveTripsCubit extends Cubit<ActiveTripsState> {
  ActiveTripsCubit() : super(ActiveTripsInitial());

  ActiveTripsService? _activeTripsService;
  ActiveTripsService? get activeTripsService => _activeTripsService;

  setActiveTripsService(ActiveTripsService service) {
    _activeTripsService = service;
    emit(ActiveTripsInitial());
    _fetchActiveTrips();
  }

  Future<void> _fetchActiveTrips() async {
    emit(ActiveTripsLoading());
    try {
      await _activeTripsService?.fetchUserActiveTrips();
      emit(ActiveTripsLoaded());
    } on AppError catch (e) {
      emit(ActiveTripsError(e.message));
    } on Exception catch (_) {
      emit(ActiveTripsError('Something went wrong'));
    }
  }
}
