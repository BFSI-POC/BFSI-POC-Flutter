import 'package:bfsi/core/consts/bfsi_colors.dart';
import 'package:flutter/material.dart';

class BfsiBackgroundBox extends StatelessWidget {
  final Widget child;
  const BfsiBackgroundBox({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: BfsiColors.appGradientColor,
      ),
      child: child,
    );
  }
}
