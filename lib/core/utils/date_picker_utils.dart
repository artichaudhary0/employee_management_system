import 'package:flutter/material.dart';
import '../../presentation/widgets/custom_date_picker.dart';

class DatePickerUtils {
  static Future<DateTime?> showCustomDatePicker({
    required BuildContext context,
    DateTime? initialDate,
    bool allowNull = false,
    DateTime? maxDate,
  }) async {
    DateTime? selectedDate;
    
    await showDialog<DateTime>(
      context: context,
      builder: (context) => CustomDatePicker(
        initialDate: initialDate,
        allowNull: allowNull,
        maxDate: maxDate,
        onDateSelected: (date) {
          selectedDate = date;
        },
      ),
    );
    
    return selectedDate;
  }
}