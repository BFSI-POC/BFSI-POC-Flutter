part of 'app_state_bloc.dart';

abstract class AppBlocState extends Equatable {
  const AppBlocState();

  @override
  List<Object?> get props => [];
}

class AppLoadingState extends AppBlocState {
  const AppLoadingState();
}

class AppLoginState extends AppBlocState {
  const AppLoginState();

  @override
  List<Object?> get props => [];
}

class CustomerTransactionHistory extends AppBlocState {
  const CustomerTransactionHistory();

  @override
  List<Object?> get props => [];
}

class AdminLoginState extends AppBlocState {
  const AdminLoginState();

  @override
  List<Object?> get props => [];
}
