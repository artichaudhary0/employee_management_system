import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../data/models/employee.dart';
import '../bloc/employee_bloc.dart';
import '../bloc/employee_event.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/role_selector.dart';
import '../widgets/date_selector.dart';
import '../widgets/common_app_bar.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class AddEditEmployeePage extends StatefulWidget {
  final Employee? employee;

  const AddEditEmployeePage({super.key, this.employee});

  @override
  State<AddEditEmployeePage> createState() => _AddEditEmployeePageState();
}

class _AddEditEmployeePageState extends State<AddEditEmployeePage> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  String? _selectedRole;
  DateTime? _startDate;
  DateTime? _endDate;

  bool get _isEditing => widget.employee != null;

  @override
  void initState() {
    super.initState();
    if (_isEditing) {
      _nameController.text = widget.employee!.name;
      _selectedRole = widget.employee!.role;
      _startDate = widget.employee!.startDate;
      _endDate = widget.employee!.endDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CommonAppBar(
        title:
            _isEditing
                ? AppConstants.editEmployeeDetails
                : AppConstants.addEmployeeDetails,
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: ResponsiveUtils.getResponsivePadding(context),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      hintText: 'Employee name',
                      prefixIcon: AppConstants.accountIcon,
                      validator: (value) {
                        if (value?.isEmpty ?? true) {
                          return 'Please enter employee name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: ResponsiveUtils.getResponsiveHeight(23)),
                    RoleSelector(
                      selectedRole: _selectedRole,
                      onRoleChanged:
                          (role) => setState(() => _selectedRole = role),
                    ),
                    SizedBox(height: ResponsiveUtils.getResponsiveHeight(23)),
                    Row(
                      children: [
                        Expanded(
                          child: DateSelector(
                            label: 'Today',
                            selectedDate: _startDate,
                            onDateSelected:
                                (date) => setState(() => _startDate = date),
                          ),
                        ),
                        SizedBox(width: ResponsiveUtils.getResponsiveWidth(16)),
                        SvgPicture.asset(
                          AppConstants.rightArrowIcon,
                          width: ResponsiveUtils.getResponsiveWidth(16),
                          height: ResponsiveUtils.getResponsiveHeight(16),
                        ),
                        SizedBox(width: ResponsiveUtils.getResponsiveWidth(16)),
                        Expanded(
                          child: DateSelector(
                            label: 'No date',
                            selectedDate: _endDate,
                            onDateSelected:
                                (date) => setState(() => _endDate = date),
                            allowNull: true,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: ResponsiveUtils.getResponsiveWidth(16),
                vertical: ResponsiveUtils.getResponsiveHeight(12),
              ),
              decoration: const BoxDecoration(
                color: AppColors.white,
                border: Border(top: BorderSide(color: AppColors.border)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.disableColor,
                        foregroundColor: AppConstants.primaryBlue,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Cancel',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ),
                  SizedBox(width: ResponsiveUtils.getResponsiveWidth(16)),
                  SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      onPressed: _saveEmployee,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppConstants.primaryBlue,
                        foregroundColor: AppConstants.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Save',
                        style: AppTextStyles.buttonText,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _saveEmployee() {
    if (_formKey.currentState?.validate() ?? false) {
      if (_selectedRole == null) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text('Please select role')));
        return;
      }

      if (_startDate == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please select start date')),
        );
        return;
      }

      final employee = Employee(
        id: _isEditing ? widget.employee!.id : null,
        name: _nameController.text.trim(),
        role: _selectedRole!,
        startDate: _startDate!,
        endDate: _endDate,
      );

      if (_isEditing) {
        context.read<EmployeeBloc>().add(UpdateEmployee(employee));
      } else {
        context.read<EmployeeBloc>().add(AddEmployee(employee));
      }

      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}
