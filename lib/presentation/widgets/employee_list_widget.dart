import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../core/constants/app_constants.dart' show AppConstants;
import '../../data/models/employee.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import 'employee_card.dart';
import 'section_header_widget.dart';
import 'custom_dialog.dart';
import '../../core/responsive/responsive_utils.dart';
import '../../core/routes/app_routes.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';

class EmployeeListWidget extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeListWidget({super.key, required this.employees});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              if (employees.isNotEmpty) ...[
                if (employees.any((e) => e.endDate == null)) ...[
                  SectionHeaderWidget(
                    title: 'Current employees',
                    count: employees.where((e) => e.endDate == null).length,
                  ),
                  ...employees
                      .where((e) => e.endDate == null)
                      .map(
                        (employee) => EmployeeCard(
                          employee: employee,
                          onEdit:
                              () => _navigateToEditEmployee(context, employee),
                          onDelete:
                              () => _showDeleteDialog(context, employee.id!),
                        ),
                      ),
                ],
                if (employees.any((e) => e.endDate != null)) ...[
                  SectionHeaderWidget(
                    title: 'Previous employees',
                    count: employees.where((e) => e.endDate != null).length,
                  ),
                  ...employees
                      .where((e) => e.endDate != null)
                      .map(
                        (employee) => EmployeeCard(
                          employee: employee,
                          onEdit:
                              () => _navigateToEditEmployee(context, employee),
                          onDelete:
                              () => _showDeleteDialog(context, employee.id!),
                        ),
                      ),
                ],
              ],
            ],
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: ResponsiveUtils.getResponsiveWidth(75),
              left: ResponsiveUtils.getResponsiveWidth(12),
              top: ResponsiveUtils.getResponsiveWidth(12),
            ),
            child: Text(
              'Swipe left to delete',
              style: AppTextStyles.employeeRole.copyWith(color: AppColors.hint),
            ),
          ),
        ),
      ],
    );
  }

  void _navigateToEditEmployee(BuildContext context, Employee employee) {
    Navigator.pushNamed(context, AppRoutes.editEmployee, arguments: employee);
  }

  void _showDeleteDialog(BuildContext context, int employeeId) async {
    final result = await CustomDialog.showDeleteDialog(context: context);
    if (result == true) {
      context.read<EmployeeBloc>().add(DeleteEmployee(employeeId));
    }
  }
}
