import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:parent/core/constants/api_env.dart';
import 'package:parent/core/constants/strings.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/client/dio_client.dart';
import '../../../../core/exceptions/app_error.dart';
import '../../models/user_data.dart';

class UserRepository {
  /// Handles [Firebase] authentication using `email` and `password`.
  Future<User> authenticateWithFirebase(
      {required String email, required String password}) async {
    try {
      AppLog.v('email $email: pass $password');
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      final User? user = credential.user;
      if (user == null) {
        throw const AuthenticationException(AppStrings.invalidCredentials);
      }
      return user;
    } on FirebaseException catch (e) {
      AppLog.e(e);
      throw AuthenticationException(e.code.replaceAll('-', '_'));
    }
  }

  /// Fetches the user data from API.
  Future<UserData> fetchAPIUser() async {
    try {
      Response response = await Client.instance.dio.get(APIEnv.auth);
      if (response.statusCode == 200) {
        final UserData user = UserData.fromJson(response.data);
        return user;
      } else {
        throw const AuthenticationException(AppStrings.cannotFetchUser);
      }
    } on DioError catch (e) {
      AppLog.e(e.error.runtimeType);
      throw e.error as AppError;
    }
  }

  /// logout the user using [FirebaseAuth.signOut]
  logout() async {
    try {
      await FirebaseAuth.instance.signOut();
    } on FirebaseException catch (e) {
      AppLog.e(e);
      throw AuthenticationException(e.message ?? '');
    }
  }

  /// key for user data in local cache
  final String _userStorageKey = 'USER_STORAGE_KEY';

  /// reads current user data from cache if there is any
  Future<UserData?> fetchLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userString = prefs.getString(_userStorageKey);
    AppLog.i('loaded from sharedPreferences $userString');
    if (userString == null) {
      return null;
    }
    UserData user = UserData.fromJson(json.decode(userString));
    return user;
  }

  /// saves current user data in cache
  Future<void> saveLocalUser(UserData user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String userString = json.encode(user.toJson());
    AppLog.i('saving to sharedPreferences $userString');
    prefs.setString(_userStorageKey, userString);
  }

  /// removes current user data from cache
  Future<void> removeLocalUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppLog.i('removing from sharedPreferences');
    prefs.remove(_userStorageKey);
  }
}
