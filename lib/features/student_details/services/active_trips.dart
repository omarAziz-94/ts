import 'package:parent/core/constants/strings.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/student_details/models/Trip.dart';
import 'package:parent/features/student_details/repositories/active_trips.dart';

class ActiveTripsService {
  ActiveTripsService(this.userId);

  final String userId;

  final ActiveTripsRepository _activeTripsRepository = ActiveTripsRepository();

  List<Trip> _activeTrips = [];
  List<Trip> get activeTrips => [..._activeTrips];

  Future<void> fetchUserActiveTrips() async {
    try {
      _activeTrips =
          await _activeTripsRepository.fetchUserActiveTrips(userId: userId);
    } on AppError catch (_) {
      rethrow;
    } on Exception catch (_) {
      throw const OperationFailedException(AppStrings.someThingWentWrong);
    }
  }
}
