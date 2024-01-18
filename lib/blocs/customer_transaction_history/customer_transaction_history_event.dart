part of 'customer_transaction_history_bloc.dart';

abstract class CustomerTransactionHistoryEvent extends Equatable {
  const CustomerTransactionHistoryEvent();

  @override
  List<Object?> get props => [];
}

class CustomerTransactionHistoryOnLoadEvent
    extends CustomerTransactionHistoryEvent {
  const CustomerTransactionHistoryOnLoadEvent();
}
