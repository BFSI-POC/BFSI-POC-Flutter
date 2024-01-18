import 'package:bfsi/blocs/admin_landing/admin_landing_bloc.dart';
import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/admin_landing/admin_landing_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminLandingPage extends BfsiPage<void> {
  AdminLandingPage({
    super.keyValue = InitialPageRoutes.adminLandingPage,
    super.routeName = InitialPageRoutes.adminLandingPage,
    Map<String, dynamic> super.arguments = const <String, dynamic>{},
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider<AdminLandingBloc>(
          create: (context) => AdminLandingBloc()
            ..add(
              const AdminLandingOnLoadEvent(),
            ),
          child: const AdminLandingView(),
        );
      },
    );
  }
}
