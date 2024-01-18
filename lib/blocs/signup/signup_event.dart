part of 'signup_bloc.dart';

abstract class SignupEvent extends Equatable {
  const SignupEvent();

  @override
  List<Object?> get props => [];
}

class SignupOnLoadEvent extends SignupEvent {
  const SignupOnLoadEvent();
}

class SignupDetailsUpdateEvent extends SignupEvent {
  final String? firstName;
  final String? lastName;
  final String? email;
  final String? phoneNumber;
  const SignupDetailsUpdateEvent({
    this.firstName,
    this.lastName,
    this.email,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
        firstName,
        lastName,
        email,
        phoneNumber,
      ];
}

class SignupSubmitEvent extends SignupEvent {
  const SignupSubmitEvent();
}
