import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parent/core/constants/strings.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/auth/services/user_service.dart';

import '../models/user_data.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.userService) : super(AuthInitial());
  final UserService userService;

  checkAuth() async {
    emit(LoginLoading());
    try {
      bool isLoggedIn = await userService.isLoggedIn();
      if (isLoggedIn) {
        await userService.updateUserData();
        emit(LoginCompleted());
      } else {
        emit(AuthNotFound());
      }
    } catch (e) {
      emit(LoginError(e.toString()));
    }
  }

  login({required String email, required String password}) async {
    emit(LoginLoading());
    try {
      UserData? user =
          await userService.login(email: email, password: password);
      if (user == null) emit(LoginError(AppStrings.cannotFetchUser));
      emit(LoginCompleted());
    } on AppError catch (e) {
      emit(LoginError(e.message));
    }
  }

  logout() async {
    emit(LogoutLoading());
    try {
      await userService.logout();
      emit(LogoutCompleted());
    } catch (e) {
      emit(LogoutError(e.toString()));
    }
  }
}
