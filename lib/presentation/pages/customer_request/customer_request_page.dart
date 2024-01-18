import 'package:bfsi/blocs/customer_request/customer_request_bloc.dart';
import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/customer_request/customer_request_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomerRequestPage extends BfsiPage<void> {
  CustomerRequestPage({
    super.keyValue = RelativePageRoutes.customerRequest,
    super.routeName = RelativePageRoutes.customerRequest,
    Map<String, dynamic> super.arguments = const <String, dynamic>{},
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider<CustomerRequestBloc>(
          create: (context) => CustomerRequestBloc()
            ..add(
              const CustomerRequestOnLoadEvent(),
            ),
          child: const CustomerRequestView(),
        );
      },
    );
  }
}
