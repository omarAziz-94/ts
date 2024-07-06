part of 'trips_history_cubit.dart';

abstract class TripsHistoryState extends Equatable {}

class TripsHistoryInitial extends TripsHistoryState {
  @override
  List<Object?> get props => [];
}

class TripsHistoryLoaded extends TripsHistoryState {
  final List<Trip> trips;

  TripsHistoryLoaded(this.trips);

  @override
  List<Object?> get props => [trips];
}

class TripsHistoryLoading extends TripsHistoryState {
  @override
  List<Object?> get props => [];
}

class TripsHistoryError extends TripsHistoryState {
  final String message;

  TripsHistoryError(this.message);

  @override
  List<Object?> get props => [];
}
