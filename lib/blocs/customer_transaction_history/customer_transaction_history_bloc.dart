import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'customer_transaction_history_event.dart';
part 'customer_transaction_history_state.dart';

class CustomerTransactionHistoryBloc extends Bloc<
    CustomerTransactionHistoryEvent, CustomerTransactionHistoryState> {
  CustomerTransactionHistoryBloc()
      : super(CustomerTransactionHistoryInitial()) {
    on<CustomerTransactionHistoryOnLoadEvent>(
        _onLoadCustomerTransactionHistory);
  }

  FutureOr<void> _onLoadCustomerTransactionHistory(
      CustomerTransactionHistoryOnLoadEvent event,
      Emitter<CustomerTransactionHistoryState> emit) async {
    emit(
      const CustomerTransactionHistoryOnLoadState(),
    );
  }
}
