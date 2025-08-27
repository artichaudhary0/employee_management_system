import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart' show AppConstants;
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class CustomDatePicker extends StatefulWidget {
  final DateTime? initialDate;
  final Function(DateTime?) onDateSelected;
  final bool allowNull;
  final DateTime? maxDate;

  const CustomDatePicker({
    super.key,
    this.initialDate,
    required this.onDateSelected,
    this.allowNull = false,
    this.maxDate,
  });

  @override
  State<CustomDatePicker> createState() => _CustomDatePickerState();
}

class _CustomDatePickerState extends State<CustomDatePicker> {
  DateTime? selectedDate;
  late DateTime displayedMonth;
  String? selectedQuickOption;

  @override
  void initState() {
    super.initState();
    selectedDate = widget.initialDate;
    displayedMonth = DateTime((selectedDate ?? DateTime.now()).year, (selectedDate ?? DateTime.now()).month);
  }

  DateTime get today => DateTime.now();
  DateTime get nextMonday {
    final now = DateTime.now();
    final daysUntilMonday = (8 - now.weekday) % 7;
    return now.add(Duration(days: daysUntilMonday == 0 ? 7 : daysUntilMonday));
  }

  DateTime get nextTuesday {
    final now = DateTime.now();
    final daysUntilTuesday = (9 - now.weekday) % 7;
    return now.add(
      Duration(days: daysUntilTuesday == 0 ? 7 : daysUntilTuesday),
    );
  }

  DateTime get nextWeek => DateTime.now().add(const Duration(days: 7));

  void _selectQuickDate(String option, DateTime? date) {
    setState(() {
      selectedQuickOption = option;
      selectedDate = date;
      if (date != null) {
        displayedMonth = DateTime(date.year, date.month);
      }
    });
  }

  void _selectCalendarDate(DateTime date) {
    if (widget.maxDate != null && date.isAfter(widget.maxDate!)) {
      return;
    }
    setState(() {
      selectedDate = date;
      selectedQuickOption = null;
    });
  }

  void _previousMonth() {
    setState(() {
      displayedMonth = DateTime(displayedMonth.year, displayedMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      displayedMonth = DateTime(displayedMonth.year, displayedMonth.month + 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      child: Container(
        width: ResponsiveUtils.getResponsiveWidth(396),
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildQuickOptions(),
              SizedBox(height: ResponsiveUtils.getResponsiveWidth(16)),
              _buildCalendarHeader(),
              SizedBox(height: ResponsiveUtils.getResponsiveWidth(20)),
              _buildWeekDays(),
              SizedBox(height: ResponsiveUtils.getResponsiveWidth(8)),
              _buildCalendarGrid(),
              SizedBox(height: ResponsiveUtils.getResponsiveWidth(10)),
              _buildBottomRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuickOptions() {
    if (widget.allowNull) {
      return Row(
        children: [
          Expanded(
            child: _buildQuickButton(
              'No date',
              null,
              selectedQuickOption == 'No date',
            ),
          ),
          const SizedBox(width: 8),
          Expanded(
            child: _buildQuickButton(
              'Today',
              today,
              selectedQuickOption == 'Today',
            ),
          ),
        ],
      );
    }
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: _buildQuickButton(
                'Today',
                today,
                selectedQuickOption == 'Today',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildQuickButton(
                'Next Monday',
                nextMonday,
                selectedQuickOption == 'Next Monday',
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildQuickButton(
                'Next Tuesday',
                nextTuesday,
                selectedQuickOption == 'Next Tuesday',
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: _buildQuickButton(
                'After 1 week',
                nextWeek,
                selectedQuickOption == 'After 1 week',
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuickButton(String label, DateTime? date, bool isSelected) {
    return GestureDetector(
      onTap: () => _selectQuickDate(label, date),
      child: Container(
        height: ResponsiveUtils.getResponsiveWidth(36),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : AppColors.disableColor,
          borderRadius: BorderRadius.circular(
            ResponsiveUtils.getResponsiveWidth(4),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: AppTextStyles.buttonText.copyWith(
              color: isSelected ? AppColors.white : AppColors.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCalendarHeader() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: ResponsiveUtils.getResponsiveWidth(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: _previousMonth,
            child: SvgPicture.asset(
              AppConstants.leftArrowIcon,
              width: ResponsiveUtils.getResponsiveWidth(16),
              height: ResponsiveUtils.getResponsiveHeight(16),
            ),
          ),
          Text(
            DateFormat('MMMM yyyy').format(displayedMonth),
            style: AppTextStyles.employeeName.copyWith(
              fontSize: ResponsiveUtils.getResponsiveWidth(18),
            ),
          ),
          GestureDetector(
            onTap: _nextMonth,
            child: SvgPicture.asset(
              AppConstants.rightArrowsIcon,
              width: ResponsiveUtils.getResponsiveWidth(16),
              height: ResponsiveUtils.getResponsiveHeight(16),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWeekDays() {
    const weekDays = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
    return Row(
      children:
          weekDays
              .map(
                (day) => Expanded(
                  child: Center(
                    child: Text(
                      day,
                      style: AppTextStyles.employeeRole.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              )
              .toList(),
    );
  }

  Widget _buildCalendarGrid() {
    final firstDayOfMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month,
      1,
    );
    final lastDayOfMonth = DateTime(
      displayedMonth.year,
      displayedMonth.month + 1,
      0,
    );
    final firstDayWeekday = firstDayOfMonth.weekday % 7;

    final days = <Widget>[];

    for (int i = 0; i < firstDayWeekday; i++) {
      days.add(const SizedBox());
    }

    for (int day = 1; day <= lastDayOfMonth.day; day++) {
      final date = DateTime(displayedMonth.year, displayedMonth.month, day);
      final isSelected = selectedDate != null &&
          date.day == selectedDate!.day &&
          date.month == selectedDate!.month &&
          date.year == selectedDate!.year;
      final isToday =
          date.day == today.day &&
          date.month == today.month &&
          date.year == today.year;

      final isDisabled = widget.maxDate != null && date.isAfter(widget.maxDate!);
      days.add(_buildCalendarDay(day, date, isSelected, isToday, isDisabled));
    }

    return GridView.count(shrinkWrap: true, crossAxisCount: 7, children: days);
  }

  Widget _buildCalendarDay(
    int day,
    DateTime date,
    bool isSelected,
    bool isToday,
    bool isDisabled,
  ) {
    return GestureDetector(
      onTap: isDisabled ? null : () => _selectCalendarDate(date),
      child: Container(
        margin: const EdgeInsets.all(2),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          shape: BoxShape.circle,
          border:
              isToday && !isSelected
                  ? Border.all(color: AppColors.primary)
                  : null,
        ),
        child: Center(
          child: Text(
            day.toString(),
            style: AppTextStyles.inputText.copyWith(
              color: isDisabled 
                  ? AppColors.hint.withOpacity(0.5)
                  : isSelected 
                      ? AppColors.white 
                      : AppColors.text,
              fontWeight: isToday ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBottomRow() {
    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: AppColors.border)),
      ),
      padding: EdgeInsets.only(top: 10),
      child: Row(
        children: [
          const Icon(Icons.calendar_today, color: AppColors.primary, size: 20),
          SizedBox(width: ResponsiveUtils.getResponsiveWidth(8)),
          Text(
            selectedDate != null ? DateFormat('d MMM yyyy').format(selectedDate!) : 'No date',
            style: AppTextStyles.inputText.copyWith(
              fontWeight: FontWeight.w500,
            ),
          ),
          const Spacer(),
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(
              'Cancel',
              style: AppTextStyles.buttonText.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              widget.onDateSelected(selectedDate);
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
            child: Text(
              'Save',
              style: AppTextStyles.buttonText.copyWith(
                color: AppColors.white,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
