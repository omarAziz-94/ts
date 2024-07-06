class APIEnv {
  APIEnv._();

  static const String baseUrl = 'https://egschools.herokuapp.com/api';
  static const String auth = '/user/current';

  static const String students = '/student/mine';

  static String activeTrips(String userId) {
    return '/student/$userId/trips/active';
  }

  static String tripsHistory(String userId) {
    return '/student/$userId/trips';
  }
}
