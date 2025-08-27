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
    return Container(
      margin: EdgeInsets.only(bottom: ResponsiveUtils.getResponsiveHeight(16)),
      decoration: BoxDecoration(
        color: AppConstants.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Dismissible(
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
        onDismissed: (direction) => onDelete(),
        child: ListTile(
          contentPadding: EdgeInsets.all(ResponsiveUtils.getResponsiveWidth(16)),
          leading: CircleAvatar(
            backgroundColor: AppConstants.lightGrey,
            child: SvgPicture.asset(
              AppConstants.accountIcon,
              width: ResponsiveUtils.getResponsiveWidth(24),
              height: ResponsiveUtils.getResponsiveHeight(24),
            ),
          ),
          title: Text(
            employee.name,
            style: AppTextStyles.employeeName,
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ResponsiveUtils.getResponsiveHeight(4)),
              Text(
                employee.role,
                style: AppTextStyles.employeeRole,
              ),
              SizedBox(height: ResponsiveUtils.getResponsiveHeight(8)),
              Text(
                _getDateRange(),
                style: AppTextStyles.dateText,
              ),
            ],
          ),
          trailing: IconButton(
            onPressed: onEdit,
            icon: SvgPicture.asset(
              AppConstants.rightArrowIcon,
              width: ResponsiveUtils.getResponsiveWidth(16),
              height: ResponsiveUtils.getResponsiveHeight(16),
            ),
          ),
        ),
      ),
    );
  }

  String _getDateRange() {
    final startDate = DateFormat(AppConstants.dateFormat).format(employee.startDate);
    if (employee.endDate != null) {
      final endDate = DateFormat(AppConstants.dateFormat).format(employee.endDate!);
      return '$startDate - $endDate';
    }
    return 'From $startDate';
  }
}