import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupBloc() : super(SignupInitial()) {
    on<SignupOnLoadEvent>(_onSignup);
    on<SignupDetailsUpdateEvent>(_onSignupDetailsUpdate);
    on<SignupSubmitEvent>(_onSignupSubmit);
  }

  FutureOr<void> _onSignup(
      SignupOnLoadEvent event, Emitter<SignupState> emit) async {
    emit(
      const SignupOnLoadState(),
    );
  }

  FutureOr<void> _onSignupDetailsUpdate(
      SignupDetailsUpdateEvent event, Emitter<SignupState> emit) {
    final castState = state as SignupOnLoadState;

    emit(
      castState.copyWith(
        firstName: event.firstName ?? castState.firstName,
        lastName: event.lastName ?? castState.lastName,
        email: event.email ?? castState.email,
        phoneNumber: event.phoneNumber ?? castState.phoneNumber,
      ),
    );
  }

  FutureOr<void> _onSignupSubmit(
      SignupSubmitEvent event, Emitter<SignupState> emit) async {
    final castState = state as SignupOnLoadState;

    if ((castState.firstName ?? '').isNotEmpty &&
        (castState.lastName ?? '').isNotEmpty &&
        (castState.email ?? '').isNotEmpty &&
        (castState.phoneNumber ?? '').isNotEmpty) {
      emit(
        castState.copyWith(
          isSignupLoading: true,
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
        const SignupSuccessState(message: 'Signed up successfully'),
      );
    } else {
      emit(
        castState.copyWith(
          isFirstNameError: (castState.firstName ?? '').isEmpty,
          isLastNameError: (castState.lastName ?? '').isEmpty,
          isEmailError: (castState.email ?? '').isEmpty,
          isPhoneNumberError: (castState.phoneNumber ?? '').isEmpty,
        ),
      );
    }
  }
}
