import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_request_event.dart';
part 'customer_request_state.dart';

class CustomerRequestBloc
    extends Bloc<CustomerRequestEvent, CustomerRequestState> {
  CustomerRequestBloc() : super(CustomerRequestInitial()) {
    on<CustomerRequestOnLoadEvent>(_onLoadCustomerRequest);
  }

  FutureOr<void> _onLoadCustomerRequest(
      CustomerRequestOnLoadEvent event, Emitter<CustomerRequestState> emit) {
    emit(
      const CustomerRequestOnLoadState(),
    );
  }
}
