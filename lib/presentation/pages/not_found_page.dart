import 'package:bfsi/presentation/pages/bfsi_page.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:flutter/material.dart';

class NotFoundPage extends BfsiPage<void> {
  /// The invalid route path that was pushed.
  final String path;

  NotFoundPage({
    required this.path,
    String routeName = InitialPageRoutes.notFound,
  }) : super(keyValue: path, routeName: '$routeName: $path');

  @override
  Route<void> createRoute(BuildContext context) => MaterialPageRoute(
        settings: this,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(),
            body: Center(
              child: Column(
                children: [
                  const Text('Page not found.'),
                  Text(path),
                ],
              ),
            ),
          );
        },
      );
}
