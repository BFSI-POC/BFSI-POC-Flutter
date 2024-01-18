part of 'signup_bloc.dart';

abstract class SignupState extends Equatable {
  const SignupState();

  @override
  List<Object?> get props => [];
}

class SignupInitial extends SignupState {}

class SignupOnLoadState extends SignupState {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  final bool isSignupLoading;
  final bool isFirstNameError;
  final bool isLastNameError;
  final bool isEmailError;
  final bool isPhoneNumberError;
  final String? errorMessage;

  const SignupOnLoadState({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
    this.isSignupLoading = false,
    this.isFirstNameError = false,
    this.isLastNameError = false,
    this.isEmailError = false,
    this.isPhoneNumberError = false,
    this.errorMessage,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
        isSignupLoading,
        isFirstNameError,
        isLastNameError,
        isEmailError,
        isPhoneNumberError,
        errorMessage,
      ];

  SignupOnLoadState copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? phoneNumber,
    bool? isSignupLoading,
    bool? isFirstNameError,
    bool? isLastNameError,
    bool? isEmailError,
    bool? isPhoneNumberError,
    String? errorMessage,
  }) {
    return SignupOnLoadState(
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      isSignupLoading: isSignupLoading ?? this.isSignupLoading,
      isFirstNameError: isFirstNameError ?? this.isFirstNameError,
      isLastNameError: isLastNameError ?? this.isLastNameError,
      isEmailError: isEmailError ?? this.isEmailError,
      isPhoneNumberError: isPhoneNumberError ?? this.isPhoneNumberError,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

class SignupSuccessState extends SignupState {
  final String message;

  const SignupSuccessState({
    required this.message,
  });

  @override
  List<Object?> get props => [
        message,
      ];
}
