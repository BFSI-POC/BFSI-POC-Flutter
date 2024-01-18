part of 'app_state_bloc.dart';

abstract class AppStateEvent extends Equatable {
  const AppStateEvent();

  @override
  List<Object?> get props => [];
}

class CheckAppStateEvent extends AppStateEvent {
  const CheckAppStateEvent();
}

class CompleteLoginEvent extends AppStateEvent {
  const CompleteLoginEvent();
}

class LogOutEvent extends AppStateEvent {
  const LogOutEvent();
}
