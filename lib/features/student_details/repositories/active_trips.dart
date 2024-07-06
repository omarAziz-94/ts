import 'package:dio/dio.dart';
import 'package:parent/core/client/dio_client.dart';
import 'package:parent/core/constants/api_env.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/student_details/models/Trip.dart';

import '../../../core/constants/strings.dart';

class ActiveTripsRepository {
  Future<List<Trip>> fetchUserActiveTrips({required String userId}) async {
    try {
      Response response =
          await Client.instance.dio.get(APIEnv.activeTrips(userId));
      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in response.data) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw const AuthenticationException(AppStrings.cannotFetchTrips);
      }
    } on DioError catch (e) {
      AppLog.e(e);
      throw const OperationFailedException(AppStrings.cannotFetchTrips);
    }
  }
}
