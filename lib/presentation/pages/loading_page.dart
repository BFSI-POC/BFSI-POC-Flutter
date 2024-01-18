import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/presentation/views/loading_view.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';

class LoadingPage extends BfsiPage<void> {
  LoadingPage()
      : super(
          keyValue: InitialPageRoutes.loading,
          routeName: InitialPageRoutes.loading,
        );

  @override
  Route<void> createRoute(BuildContext context) {
    return MaterialPageRoute(
      settings: this,
      builder: (context) => const LoadingView(),
    );
  }
}
