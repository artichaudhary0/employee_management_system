import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
    if (isMobile(context)) return EdgeInsets.all(16.w);
    if (isTablet(context)) return EdgeInsets.all(24.w);
    return EdgeInsets.all(32.w);
  }

  static double getResponsiveFontSize(double size) => size.sp;
  
  static double getResponsiveHeight(double height) => height.h;
  
  static double getResponsiveWidth(double width) => width.w;
}