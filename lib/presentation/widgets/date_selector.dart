import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';
import '../../core/utils/date_picker_utils.dart';

class DateSelector extends StatelessWidget {
  final String label;
  final DateTime? selectedDate;
  final Function(DateTime?) onDateSelected;
  final bool allowNull;

  const DateSelector({
    super.key,
    required this.label,
    required this.selectedDate,
    required this.onDateSelected,
    this.allowNull = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsiveWidth(12),
          vertical: ResponsiveUtils.getResponsiveHeight(12),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              AppConstants.calendarIcon,
              width: ResponsiveUtils.getResponsiveWidth(24),
              height: ResponsiveUtils.getResponsiveHeight(24),
            ),
            SizedBox(width: ResponsiveUtils.getResponsiveWidth(12)),
            Expanded(
              child: Text(
                _getDisplayText(),
                style:
                    selectedDate != null
                        ? AppTextStyles.inputText.copyWith(fontSize: 14)
                        : AppTextStyles.hintText.copyWith(fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getDisplayText() {
    if (selectedDate != null) {
      return DateFormat(AppConstants.dateFormat).format(selectedDate!);
    }
    return label;
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await DatePickerUtils.showCustomDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      allowNull: allowNull,
    );

    if (picked != null) {
      onDateSelected(picked);
    } else if (allowNull && selectedDate != null) {
      // Show option to clear date for end date
      _showClearDateDialog(context);
    }
  }

  void _showClearDateDialog(BuildContext context) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: const Text('Clear Date'),
            content: const Text('Do you want to clear the selected date?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text('Cancel'),
              ),
              TextButton(
                onPressed: () {
                  onDateSelected(null);
                  Navigator.pop(context);
                },
                child: const Text('Clear'),
              ),
            ],
          ),
    );
  }
}
