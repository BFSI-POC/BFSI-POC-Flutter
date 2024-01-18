import 'dart:async';
import 'package:bfsi/domain/repositories/auth/auth_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  //final _loginRepo = GetIt.I<LoginRepository>();
  final _authRepo = GetIt.I<AuthRepository>();
  LoginBloc() : super(LoginInitial()) {
    on<LoginOnLoadEvent>(_onLogin);
    on<LoginPasswordVisibleEvent>(_onPasswordVisible);
    on<LoginDetailsUpdateEvent>(_onLoginDetailsUpdate);
    on<LoginSubmitEvent>(_onLoginSubmit);
  }

  FutureOr<void> _onLogin(
      LoginOnLoadEvent event, Emitter<LoginState> emit) async {
    /*final loggedIn = await _authRepo.hasCompletedLogin();
    if (loggedIn == null || loggedIn == false) {
      emit(
        const LoginOnLoadState(
          email: '',
          password: '',
          isPasswordObscured: true,
        ),
      );
    } else {
      emit(const LoginSuccessState(message: ''));
    }*/
    emit(
      const LoginOnLoadState(
        email: '',
        password: '',
        isPasswordObscured: true,
      ),
    );
  }

  FutureOr<void> _onPasswordVisible(
      LoginPasswordVisibleEvent event, Emitter<LoginState> emit) {
    final castState = state as LoginOnLoadState;
    emit(
      castState.copyWith(
        isPasswordObscured: !castState.isPasswordObscured,
      ),
    );
  }

  FutureOr<void> _onLoginDetailsUpdate(
      LoginDetailsUpdateEvent event, Emitter<LoginState> emit) {
    final castState = state as LoginOnLoadState;
    emit(
      castState.copyWith(
        email: event.email ?? castState.email,
        password: event.password ?? castState.password,
      ),
    );
  }

  FutureOr<void> _onLoginSubmit(
      LoginSubmitEvent event, Emitter<LoginState> emit) async {
    final castState = state as LoginOnLoadState;

    if (castState.email.isNotEmpty && castState.password.isNotEmpty) {
      emit(
        castState.copyWith(
          isLoginLoading: true,
        ),
      );
/*    // Login api call
    final response = await _loginRepo.loginRequest(
      email: castState.email,
      password: castState.password,
    );
    if (response != null && response.isSuccess()) {
      final data = BaseModel.fromJson(response.data);
      await _authRepo.completeLogin();
      await _authRepo.saveToken(data.data!.token ?? '');
      await _authRepo.saveRefreshToken(data.data!.refreshToken ?? '');
      await _authRepo.saveUserModel(data.data!.userDetails!.toJsonString());
      emit(LoginSuccessState(message: data.message ?? ''));
    } else {
      emit(
        castState.copyWith(
          errorMessage: response?.data['Message'],
        ),
      );
    }*/
      emit(
        const LoginSuccessState(message: 'Logged In successfully'),
      );
    } else {
      emit(
        castState.copyWith(
          isEmailError: castState.email.isEmpty,
          isPasswordError: castState.password.isEmpty,
        ),
      );
    }
  }
}
