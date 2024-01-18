part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();
  @override
  List<Object?> get props => [];
}

class LoginInitial extends LoginState {}

class LoginOnLoadState extends LoginState {
  final bool isPasswordObscured;
  final String email;
  final String password;
  final bool isLoginLoading;
  final String? errorMessage;
  final bool isEmailError;
  final bool isPasswordError;

  const LoginOnLoadState({
    required this.isPasswordObscured,
    required this.email,
    required this.password,
    this.isLoginLoading = false,
    this.errorMessage,
    this.isEmailError = false,
    this.isPasswordError = false,
  });

  @override
  List<Object?> get props => [
        email,
        password,
        isPasswordObscured,
        isLoginLoading,
        errorMessage,
        isEmailError,
        isPasswordError,
      ];

  LoginOnLoadState copyWith({
    bool? isPasswordObscured,
    String? email,
    String? password,
    bool? isLoginLoading,
    String? errorMessage,
    bool? isEmailError,
    bool? isPasswordError,
  }) {
    return LoginOnLoadState(
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      email: email ?? this.email,
      password: password ?? this.password,
      isLoginLoading: isLoginLoading ?? this.isLoginLoading,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmailError: isEmailError ?? this.isEmailError,
      isPasswordError: isPasswordError ?? this.isPasswordError,
    );
  }
}

class LoginSuccessState extends LoginState {
  final String message;

  const LoginSuccessState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}

class LoginErrorState extends LoginState {}
