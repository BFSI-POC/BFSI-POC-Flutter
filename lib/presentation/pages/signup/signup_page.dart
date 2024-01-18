import 'package:bfsi/blocs/signup/signup_bloc.dart';
import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/signup/signup_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpPage extends BfsiPage<void> {
  SignUpPage({
    super.keyValue = RelativePageRoutes.signUp,
    super.routeName = RelativePageRoutes.signUp,
    Map<String, dynamic> super.arguments = const <String, dynamic>{},
  });

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) {
        return BlocProvider<SignupBloc>(
          create: (context) => SignupBloc()..add(const SignupOnLoadEvent()),
          child: const SignUpView(),
        );
      },
    );
  }
}
