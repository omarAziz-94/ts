part of 'active_trips_cubit.dart';

abstract class ActiveTripsState extends Equatable {}

class ActiveTripsInitial extends ActiveTripsState {
  @override
  List<Object?> get props => [];
}

class ActiveTripsLoaded extends ActiveTripsState {
  @override
  List<Object?> get props => [];
}

class ActiveTripsLoading extends ActiveTripsState {
  @override
  List<Object?> get props => [];
}

class ActiveTripsError extends ActiveTripsState {
  final String message;

  ActiveTripsError(this.message);

  @override
  List<Object?> get props => [];
}
