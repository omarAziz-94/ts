part of 'splash_cubit.dart';

abstract class SplashState extends Equatable {}

class SplashInitial extends SplashState {
  @override
  List<Object?> get props => [];
}

class SplashLoading extends SplashState {
  @override
  List<Object?> get props => [];
}

/// emitted when splash animation is completed to trigger auth check for the
/// logged in user then navigate to auth or home page.
class SplashCompleted extends SplashState {
  @override
  List<Object?> get props => [];
}
