import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/employee.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import 'employee_card.dart';
import 'section_header_widget.dart';
import '../../core/responsive/responsive_utils.dart';
import '../../core/routes/app_routes.dart';

class EmployeeListWidget extends StatelessWidget {
  final List<Employee> employees;

  const EmployeeListWidget({
    super.key,
    required this.employees,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: ResponsiveUtils.getResponsivePadding(context),
      child: Column(
        children: [
          if (employees.isNotEmpty) ...[
            SectionHeaderWidget(
              title: 'Current employees',
              count: employees.where((e) => e.endDate == null).length,
            ),
            ...employees
                .where((e) => e.endDate == null)
                .map(
                  (employee) => EmployeeCard(
                    employee: employee,
                    onEdit: () => _navigateToEditEmployee(context, employee),
                    onDelete: () => _showDeleteDialog(context, employee.id!),
                  ),
                ),
            if (employees.any((e) => e.endDate != null)) ...[
              SizedBox(height: ResponsiveUtils.getResponsiveHeight(24)),
              SectionHeaderWidget(
                title: 'Previous employees',
                count: employees.where((e) => e.endDate != null).length,
              ),
              ...employees
                  .where((e) => e.endDate != null)
                  .map(
                    (employee) => EmployeeCard(
                      employee: employee,
                      onEdit: () => _navigateToEditEmployee(context, employee),
                      onDelete: () => _showDeleteDialog(context, employee.id!),
                    ),
                  ),
            ],
          ],
        ],
      ),
    );
  }

  void _navigateToEditEmployee(BuildContext context, Employee employee) {
    Navigator.pushNamed(
      context,
      AppRoutes.editEmployee,
      arguments: employee,
    );
  }

  void _showDeleteDialog(BuildContext context, int employeeId) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete Employee'),
        content: const Text('Are you sure you want to delete this employee?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              context.read<EmployeeBloc>().add(DeleteEmployee(employeeId));
              Navigator.pop(context);
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }
}