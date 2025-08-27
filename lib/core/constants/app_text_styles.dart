import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  // AppBar Title Style
  static const TextStyle appBarTitle = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.textOnPrimary,
  );

  // Section Header Style
  static const TextStyle sectionHeader = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w600,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.primary,
  );

  // Employee Name Style
  static const TextStyle employeeName = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w500,
    fontSize: 16.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.text,
  );

  // Employee Role Style
  static const TextStyle employeeRole = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.hint,
  );

  // Date Text Style
  static const TextStyle dateText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 12.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.hint,
  );

  // Input Text Style
  static const TextStyle inputText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.25, // 20px line height / 16px font size
    letterSpacing: 0.0,
    color: AppColors.text,
  );

  // Hint Text Style
  static const TextStyle hintText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.25, // 20px line height / 16px font size
    letterSpacing: 0.0,
    color: AppColors.hint,
  );

  // Button Text Style
  static const TextStyle buttonText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.0,
  );

  // Count Text Style
  static const TextStyle countText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 14.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.hint,
  );

  // Empty State Text Style
  static const TextStyle emptyStateText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 18.0,
    height: 1.0,
    letterSpacing: 0.0,
    color: AppColors.text,
  );

  // Role Text Style
  static const TextStyle roleText = TextStyle(
    fontFamily: "Roboto",
    fontWeight: FontWeight.w400,
    fontSize: 16.0,
    height: 1.25, // 20px / 16px = 1.25
    letterSpacing: 0.0,
    color: AppColors.text,
  );
}
