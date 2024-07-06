part of 'student_details_cubit.dart';

abstract class StudentDetailsState extends Equatable {}

class StudentDetailsInitial extends StudentDetailsState {
  @override
  List<Object?> get props => [];
}


class StudentActiveTripsLoaded extends StudentDetailsState {
  @override
  List<Object?> get props => [];
}
class StudentActiveTripsLoading extends StudentDetailsState {
  @override
  List<Object?> get props => [];
}
class StudentActiveTripsError extends StudentDetailsState {
  final String message;

  StudentActiveTripsError(this.message);

  @override
  List<Object?> get props => [];
}

class StudentTripsHistoryLoaded extends StudentDetailsState {
  @override
  List<Object?> get props => [];
}
class StudentTripsHistoryLoading extends StudentDetailsState {
  @override
  List<Object?> get props => [];
}
class StudentTripsHistoryError extends StudentDetailsState {
  final String message;

  StudentTripsHistoryError(this.message);

  @override
  List<Object?> get props => [];
}

