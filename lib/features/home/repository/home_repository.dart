import 'package:dio/dio.dart';
import 'package:parent/features/auth/models/student.dart';

import '../../../core/client/dio_client.dart';
import '../../../core/constants/api_env.dart';
import '../../../core/constants/strings.dart';
import '../../../core/exceptions/app_error.dart';
import '../../../core/utils/logger.dart';

class HomeRepository {

  Future<List<Student>> getStudents() async {
    try {
      Response response = await Client.instance.dio.get(APIEnv.students);
      if (response.statusCode == 200) {
        List<Student> students = [];
        for (var item in response.data) {
          students.add(Student.fromJson(item));
        }
        return students;
      } else {
        throw const AuthenticationException(AppStrings.cannotFindData);
      }
    } on DioError catch (e) {
      AppLog.e(e.error.runtimeType);
      throw e.error as AppError;
    }
  }

}