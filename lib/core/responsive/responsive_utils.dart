import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class ResponsiveUtils {
  static bool isMobile(BuildContext context) => 
      MediaQuery.of(context).size.width < 768;
  
  static bool isTablet(BuildContext context) => 
      MediaQuery.of(context).size.width >= 768 && 
      MediaQuery.of(context).size.width < 1024;
  
  static bool isDesktop(BuildContext context) => 
      MediaQuery.of(context).size.width >= 1024;

  static double getResponsiveWidthFactor(BuildContext context, {
    double? mobile,
    double? tablet,
    double? desktop,
  }) {
    if (isMobile(context)) return mobile ?? 1.0;
    if (isTablet(context)) return tablet ?? 0.8;
    return desktop ?? 0.6;
  }

  static EdgeInsets getResponsivePadding(BuildContext context) {
    if (kIsWeb) {
      return const EdgeInsets.all(16);
    }
    if (isMobile(context)) return const EdgeInsets.all(16);
    if (isTablet(context)) return const EdgeInsets.all(24);
    return const EdgeInsets.all(32);
  }

  static double getResponsiveFontSize(double size) => size;
  
  static double getResponsiveHeight(double height) => height;
  
  static double getResponsiveWidth(double width) => width;

  static double getMaxWidth(BuildContext context) {
    if (kIsWeb) {
      final screenWidth = MediaQuery.of(context).size.width;
      return screenWidth > 600 ? 600 : screenWidth;
    }
    return MediaQuery.of(context).size.width;
  }
}