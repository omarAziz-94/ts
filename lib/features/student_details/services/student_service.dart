import 'package:parent/features/auth/models/student.dart';

class StudentDetailsService {
  StudentDetailsService({
    required Student student,
  }) : _student = student;

  final Student _student;

  Student get student => _student;
}
