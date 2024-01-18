import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  /// Defines the message that is displayed below the image.
  final String message;

  const LoadingView({
    super.key,
    this.message = 'Getting everything ready...',
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [const CircularProgressIndicator(), Text(message)],
        ),
      ),
    );
  }
}
