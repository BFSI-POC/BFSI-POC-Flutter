import 'dart:async';

import 'package:bfsi/domain/repositories/auth/auth_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';

part 'app_state.dart';
part 'app_state_event.dart';

class AppStateBloc extends Bloc<AppStateEvent, AppBlocState> {
  final repository = GetIt.I<AuthRepository>();

  AppStateBloc() : super(const AppLoadingState()) {
    // ? Initial events
    on<CheckAppStateEvent>((_, emit) => _checkAppState(emit));
    on<CompleteLoginEvent>(_completeLogin);
    on<LogOutEvent>(_completeLogOut);
  }

  Future<void> _checkAppState(Emitter<AppBlocState> emit) async {
    final hasCustomerLoggedIn = await repository.hasCompletedLogin();
    final hasAdminLoggedIn = await repository.hasAdminLogin();

    // ? remember to check in order of priority
    if (!(hasCustomerLoggedIn ?? false) && !(hasAdminLoggedIn ?? false)) {
      emit(const AppLoginState());
    } else if ((hasAdminLoggedIn ?? false)) {
      emit(const AdminLoginState());
    } else {
      emit(const CustomerTransactionHistory());
    }
  }

  Future<void> _completeLogin(
      CompleteLoginEvent _, Emitter<AppBlocState> emit) async {
    await repository.completeLogin();
    //await repository.completeAdminLogin();
    await _checkAppState(emit);
  }

  FutureOr<void> _completeLogOut(
      LogOutEvent event, Emitter<AppBlocState> emit) async {
    await repository.logoutUser();
    await _checkAppState(emit);
  }
}
