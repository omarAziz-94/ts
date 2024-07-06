import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../constants/api_env.dart';
import '../constants/strings.dart';
import '../exceptions/app_error.dart';
import '../utils/logger.dart';

class Client {
  static final Client instance = Client._internal();

  final Dio dio = Dio();
  final ApiInterceptors _interceptors = ApiInterceptors();

  String? token;

  /// prepares the local [Dio] instance with the [ApiInterceptors] and headers
  /// uses the base url from [ApiEnv.baseUrl]
  /// Listen to [FirebaseAuth]'s [idTokenChanges] method for user state changes
  /// and updates the [token] field with the new token
  ///
  Client._internal() {
    FirebaseAuth.instance.idTokenChanges().listen((event) async {
      token = await event?.getIdToken();
    });
    dio.interceptors.add(_interceptors);
    dio.options.receiveDataWhenStatusError = true;
    dio.options.baseUrl = APIEnv.baseUrl;
    dio.options.headers = {'Accept': 'application/json'};

    if (token != null) {
      dio.options.headers['Authorization'] = 'Bearer $token';
    }

    const int seconds = 60;
    dio.options.connectTimeout = seconds * 1000; // 60 seconds
    dio.options.receiveTimeout = seconds * 1000;
  }
}

/// [ApiInterceptors] is a [Dio] interceptor that adds the [token] to the headers
///
/// in the [onRequest] method it adds the [token] to the headers if it is not
/// provided in the [Dio] client setup.
/// and logs all data from the [onRequest], [onResponse] and [onError] methods
/// using the app's logger [AppLog] class.
class ApiInterceptors extends Interceptor {
  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    if (options.headers['Authorization'] == null) {
      final token = await FirebaseAuth.instance.currentUser?.getIdToken();
      options.headers["Authorization"] = "Bearer $token";
    }
    AppLog.d("onRequest  ${options.headers}"
        "\npath ${options.path}"
        "\ndata ${options.data.toString()}");

    super.onRequest(options, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    AppLog.e("onError ${err.response}"
        "\nonError message ${err.message}"
        "\nstatus Code ${err.response?.statusCode}"
        "\nonError data ${err.response?.data}");
    if (err.type == DioErrorType.response) {
      err.error = _getAppErrorFromDio(err.response?.statusCode ?? 1);
    } else {
      err.error = const NetworkException(AppStrings.checkConnection);
    }
    super.onError(err, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLog.d("statusCode ${response.statusCode}"
        "\nonResponse data ${response.data}"
        "\ndata type ${response.data.runtimeType}");
    super.onResponse(response, handler);
  }

  AppError _getAppErrorFromDio(int statusCode) {
    if (statusCode == HttpStatus.unauthorized ||
        statusCode == HttpStatus.forbidden) {
      return const UnAuthorizedException(AppStrings.notAllowedToAccess);
    } else if (statusCode == HttpStatus.notFound) {
      return const DataNotFoundException(AppStrings.cannotFindData);
    } else {
      return const OperationFailedException(
          AppStrings.someThingWentWrongTryAgain);
    }
  }
}
