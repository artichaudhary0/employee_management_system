import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppConstants {
  // Colors (deprecated - use AppColors instead)
  static const Color primaryBlue = AppColors.primary;
  static const Color lightGrey = AppColors.scaffold;
  static const Color darkGrey = AppColors.hint;
  static const Color white = AppColors.white;
  static const Color black = AppColors.text;
  static const Color disableColor = AppColors.disableColor;

  // Employee Roles
  static const List<String> employeeRoles = [
    'Product Designer',
    'Flutter Developer',
    'QA Tester',
    'Product Owner',
  ];

  // Date Formats
  static const String dateFormat = 'dd MMM, yyyy';

  // Strings
  static const String appTitle = 'Employee List';
  static const String noEmployeesFound = 'No employee records found';
  static const String addEmployeeDetails = 'Add Employee Details';
  static const String editEmployeeDetails = 'Edit Employee Details';
  static const String selectRole = 'Select role';

  // Asset Paths
  static const String noEmployeeImage = 'assets/images/no_employee.svg';
  static const String addIcon = 'assets/icons/add.svg';
  static const String deleteIcon = 'assets/icons/bin.svg';
  static const String calendarIcon = 'assets/icons/calendar.svg';
  static const String roleIcon = 'assets/icons/role.svg';
  static const String accountIcon = 'assets/icons/account.svg';
  static const String dropdownIcon = 'assets/icons/dropdown.svg';
  static const String rightArrowIcon = 'assets/icons/right_arrow.svg';
  static const String leftArrowIcon = 'assets/icons/left_arrow.svg';
  static const String rightArrowsIcon = 'assets/icons/arrow_right.svg';
}
