import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class RoleBottomSheet extends StatelessWidget {
  final String? selectedRole;
  final Function(String) onRoleSelected;

  const RoleBottomSheet({
    super.key,
    required this.selectedRole,
    required this.onRoleSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 211,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: ListView.separated(
        itemCount: AppConstants.employeeRoles.length,
        separatorBuilder: (context, index) => const Divider(
          color: AppColors.border,
          height: 1,
          thickness: 1,
        ),
        itemBuilder: (context, index) {
          final role = AppConstants.employeeRoles[index];
          final isSelected = role == selectedRole;
          
          return GestureDetector(
            onTap: () {
              onRoleSelected(role);
              Navigator.pop(context);
            },
            child: Container(
              width: double.infinity,
              height: 52,
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        role,
                        style: isSelected 
                          ? AppTextStyles.roleText.copyWith(color: AppColors.primary)
                          : AppTextStyles.roleText,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  if (isSelected)
                    Icon(
                      Icons.check,
                      color: AppColors.primary,
                      size: ResponsiveUtils.getResponsiveWidth(20),
                    ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}