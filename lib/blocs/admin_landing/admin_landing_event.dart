part of 'admin_landing_bloc.dart';

abstract class AdminLandingEvent extends Equatable {
  const AdminLandingEvent();

  @override
  List<Object?> get props => [];
}

class AdminLandingOnLoadEvent extends AdminLandingEvent {
  const AdminLandingOnLoadEvent();
}
