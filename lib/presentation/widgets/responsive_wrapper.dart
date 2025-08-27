import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import '../../core/responsive/responsive_utils.dart';

class ResponsiveWrapper extends StatelessWidget {
  final Widget child;
  final double? maxWidth;

  const ResponsiveWrapper({
    super.key,
    required this.child,
    this.maxWidth,
  });

  @override
  Widget build(BuildContext context) {
    if (kIsWeb && maxWidth != null) {
      return Center(
        child: Container(
          width: maxWidth,
          child: child,
        ),
      );
    }
    return child;
  }
}