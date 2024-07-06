import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:parent/features/student_details/services/student_service.dart';

part 'student_details_state.dart';

class StudentDetailsCubit extends Cubit<StudentDetailsState> {
  StudentDetailsCubit({StudentDetailsService? studentDetailsService})
      : _studentDetailsService = studentDetailsService,
        super(StudentDetailsInitial());

  StudentDetailsService? _studentDetailsService;

  StudentDetailsService? get studentDetailsService => _studentDetailsService;

  resetStudentService(StudentDetailsService service) {
    _studentDetailsService = service;
    emit(StudentDetailsInitial());
  }
}
