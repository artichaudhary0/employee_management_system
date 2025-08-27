import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import '../../data/models/employee.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class EmployeeCard extends StatelessWidget {
  final Employee employee;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  const EmployeeCard({
    super.key,
    required this.employee,
    required this.onEdit,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(employee.id.toString()),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: ResponsiveUtils.getResponsiveWidth(20)),
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(8),
        ),
        child: SvgPicture.asset(
          AppConstants.deleteIcon,
          width: ResponsiveUtils.getResponsiveWidth(24),
          height: ResponsiveUtils.getResponsiveHeight(24),
          colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
        ),
      ),
      confirmDismiss: (direction) async {
        onDelete();
        return false;
      },
      child: Column(
        children: [
          GestureDetector(
            onTap: onEdit,
            child: Container(
              width: double.infinity,
              color: Colors.white,
              padding: EdgeInsets.all(ResponsiveUtils.getResponsiveWidth(16)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(employee.name, style: AppTextStyles.employeeName),
                  SizedBox(height: ResponsiveUtils.getResponsiveHeight(4)),
                  Text(employee.role, style: AppTextStyles.employeeRole),
                  SizedBox(height: ResponsiveUtils.getResponsiveHeight(8)),
                  Text(_getDateRange(), style: AppTextStyles.dateText),
                ],
              ),
            ),
          ),
          Divider(height: 1, color: AppConstants.lightGrey),
        ],
      ),
    );
  }

  String _getDateRange() {
    final startDate = DateFormat(
      AppConstants.dateFormat,
    ).format(employee.startDate);
    if (employee.endDate != null) {
      final endDate = DateFormat(
        AppConstants.dateFormat,
      ).format(employee.endDate!);
      return '$startDate - $endDate';
    }
    return 'From $startDate';
  }
}
