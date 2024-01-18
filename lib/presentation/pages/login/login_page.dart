import 'package:bfsi/blocs/login/login_bloc.dart';
import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/login/login_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends BfsiPage<void> {
  LoginPage({
    super.keyValue = InitialPageRoutes.login,
    super.routeName = InitialPageRoutes.login,
    Map<String, dynamic> super.arguments = const <String, dynamic>{},
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider<LoginBloc>(
          create: (context) => LoginBloc()..add(const LoginOnLoadEvent()),
          child: const LoginView(),
        );
      },
    );
  }
}
