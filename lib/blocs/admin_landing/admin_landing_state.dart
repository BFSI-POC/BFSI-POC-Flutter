part of 'admin_landing_bloc.dart';

abstract class AdminLandingState extends Equatable {
  const AdminLandingState();
}

class AdminLandingInitial extends AdminLandingState {
  @override
  List<Object> get props => [];
}

class AdminLandingOnLoadState extends AdminLandingState {
  const AdminLandingOnLoadState();

  @override
  List<Object> get props => [];
}
