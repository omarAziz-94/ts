import 'package:parent/features/home/repository/home_repository.dart';

import '../../../core/constants/strings.dart';
import '../../../core/exceptions/app_error.dart';
import '../../../core/utils/logger.dart';
import '../../auth/models/student.dart';

class HomeService {
  List<Student> _students = [];

  List<Student> get students => [..._students];

  final HomeRepository _homeRepository = HomeRepository();

  fetchStudents() async {
    try {
      List<Student> students = await _homeRepository.getStudents();
      if (students.isNotEmpty) {
        _students = students;
      }
    } on NetworkException catch (e) {
      throw NetworkException(e.message);
    } on AppError catch (_) {
      rethrow;
    } catch (e) {
      AppLog.e(e);
      throw const OperationFailedException(AppStrings.someThingWentWrong);
    }
  }
}
