import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parent/core/exceptions/app_error.dart';
import 'package:parent/features/home/services/home_service.dart';

import '../../../core/constants/strings.dart';
import '../../auth/models/student.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final HomeService _homeService = HomeService();

  fetchSonsList() async {
    emit(HomeLoading());
    try {
      await _homeService.fetchStudents();
      emit(HomeLoaded(students: _homeService.students));
    } on AppError catch (e) {
      emit(HomeError(e.message));
    } on Exception catch (_) {
      emit(HomeError(AppStrings.cannotFetchLines));
    }
  }
}
