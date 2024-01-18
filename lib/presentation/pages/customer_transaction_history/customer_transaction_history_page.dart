import 'package:bfsi/blocs/customer_transaction_history/customer_transaction_history_bloc.dart';
import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/customer_transaction_history/customer_transaction_history_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerTransactionHistoryPage extends BfsiPage<void> {
  CustomerTransactionHistoryPage({
    super.keyValue = InitialPageRoutes.customerTransactionHistoryPage,
    super.routeName = InitialPageRoutes.customerTransactionHistoryPage,
    Map<String, dynamic> super.arguments = const <String, dynamic>{},
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider<CustomerTransactionHistoryBloc>(
          create: (context) => CustomerTransactionHistoryBloc()
            ..add(const CustomerTransactionHistoryOnLoadEvent()),
          child: const CustomerTransactionHistoryView(),
        );
      },
    );
  }
}
