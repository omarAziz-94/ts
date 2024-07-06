import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:parent/core/constants/strings.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/core/services/notifications/fb_notifications.dart';
import 'package:parent/core/utils/logger.dart';
import 'package:parent/features/auth/repositories/user_repository/user_repository.dart';

import '../models/user_data.dart';

class UserService {
  final UserRepository _userRepository;

  UserService(this._userRepository);

  /// APP model for the user.
  UserData? _user;

  /// Firebase user model.
  User? _firebaseUser;

  /// Returns the user model.
  UserData? get user => _user;

  /// Returns the firebase user model.
  User? get firebaseUser => _firebaseUser;

  String get userName => '${_user?.firstName??''} ${_user?.lastName??''}';

  /// user is considered logged in if user is Authenticated in [FirebaseAuth]
  /// and a local copy of the user data is present in cache.
  Future<bool> isLoggedIn() async {
    return FirebaseAuth.instance.currentUser != null &&
        await _userRepository.fetchLocalUser() != null;
  }

  /// performs a series of request to authenticate the user
  /// * 1 [email] and [password] are the credentials to authenticate the user with [FirebaseAuth]
  /// * 2 A request is made to API to fetch user data using [token] from [FirebaseAuth] for request authentication.
  /// * 3 The user data is saved in cache.
  ///
  /// if any of steps 1 or 2 fails then the user is logged out.
  Future<UserData?> login(
      {required String email, required String password}) async {
    bool isAlreadyLoggedIn = await isLoggedIn();
    if (isAlreadyLoggedIn) return _user;
    try {
      _firebaseUser = await _userRepository.authenticateWithFirebase(
          email: email, password: password);
      AppLog.d('authenticateWithFirebase Complete');
      final UserData user = await _userRepository.fetchAPIUser();
      AppLog.d('fetchAPIUser Complete');
      _userRepository.saveLocalUser(user);
      _user = user;
      return user;
    } on AppError catch (e) {
      logout();
      throw UserNotFoundException(e.message);
    } catch (_) {
      logout();
      throw const AuthenticationException(
         AppStrings.invalidCredentials);
    }
  }

  Future<UserData?> updateUserData() async {
    try {
      final user = await _userRepository.fetchAPIUser();
      AppLog.d('updateUserData Complete');
      _userRepository.saveLocalUser(user);
      _user = user;
      return user;
    } on FirebaseException catch (e) {
      logout();
      throw AuthenticationException(e.message ?? '');
    } on AppError catch (e) {
      logout();
      throw AuthenticationException(e.message);
    } catch (e) {
      AppLog.e(e);
      throw const OperationFailedException(AppStrings.cannotFetchUser);
    }
  }

  /// logging out the user by calling [FirebaseAuth.signOut] and
  /// clearing the cache and deleting user notifications token to stop
  /// the app from receiving notifications.
  Future<bool> logout() async {
    try {
      await _userRepository.logout();
      await _userRepository.removeLocalUser();
      return true;
    } catch (_) {
      return false;
    } finally {
      GetIt.I
          .get<FBNotifications>()
          .stopReceivingNotifications()
          .onError((error, stackTrace) => null);
    }
  }
}
