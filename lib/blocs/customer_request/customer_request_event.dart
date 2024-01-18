part of 'customer_request_bloc.dart';

abstract class CustomerRequestEvent extends Equatable {
  const CustomerRequestEvent();

  @override
  List<Object?> get props => [];
}

class CustomerRequestOnLoadEvent extends CustomerRequestEvent {
  const CustomerRequestOnLoadEvent();
}
