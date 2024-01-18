part of 'customer_transaction_history_bloc.dart';

abstract class CustomerTransactionHistoryState extends Equatable {
  const CustomerTransactionHistoryState();
}

class CustomerTransactionHistoryInitial
    extends CustomerTransactionHistoryState {
  @override
  List<Object> get props => [];
}

class CustomerTransactionHistoryOnLoadState
    extends CustomerTransactionHistoryState {
  const CustomerTransactionHistoryOnLoadState();

  @override
  List<Object?> get props => [];

  CustomerTransactionHistoryOnLoadState copyWith() {
    return const CustomerTransactionHistoryOnLoadState();
  }
}
