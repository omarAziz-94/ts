import 'package:dio/dio.dart';
import 'package:parent/core/client/dio_client.dart';
import 'package:parent/core/constants/api_env.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/student_details/models/Trip.dart';

import '../../../core/constants/strings.dart';

class TripsHistoryRepository {
  Future<List<Trip>> fetchUserTripsHistory({required String userId}) async {
    try {
      Response response =
          await Client.instance.dio.get(APIEnv.tripsHistory(userId));
      if (response.statusCode == 200) {
        List<Trip> trips = [];
        for (var trip in response.data) {
          trips.add(Trip.fromJson(trip));
        }
        return trips;
      } else {
        throw const AuthenticationException(AppStrings.cannotFetchTripsHistory);
      }
    } on DioError catch (e) {
      AppLog.e(e);
      throw const OperationFailedException(AppStrings.cannotFetchTripsHistory);
    }
  }
}
