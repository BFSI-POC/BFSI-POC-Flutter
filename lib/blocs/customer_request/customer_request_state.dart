part of 'customer_request_bloc.dart';

abstract class CustomerRequestState extends Equatable {
  const CustomerRequestState();
}

class CustomerRequestInitial extends CustomerRequestState {
  @override
  List<Object> get props => [];
}

class CustomerRequestOnLoadState extends CustomerRequestState {
  const CustomerRequestOnLoadState();

  @override
  List<Object> get props => [];

  CustomerRequestOnLoadState copyWith() {
    return const CustomerRequestOnLoadState();
  }
}
