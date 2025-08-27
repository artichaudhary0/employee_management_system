import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';
import 'role_bottom_sheet.dart';

class RoleSelector extends StatelessWidget {
  final String? selectedRole;
  final Function(String) onRoleChanged;

  const RoleSelector({
    super.key,
    required this.selectedRole,
    required this.onRoleChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showRoleBottomSheet(context),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: ResponsiveUtils.getResponsiveWidth(16),
          vertical: ResponsiveUtils.getResponsiveHeight(12),
        ),
        decoration: BoxDecoration(
          border: Border.all(color: AppColors.border, width: 1),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(
                right: ResponsiveUtils.getResponsiveWidth(12),
              ),
              child: SvgPicture.asset(
                AppConstants.roleIcon,
                width: ResponsiveUtils.getResponsiveWidth(24),
                height: ResponsiveUtils.getResponsiveHeight(24),
              ),
            ),
            Expanded(
              child: Text(
                selectedRole ?? AppConstants.selectRole,
                style:
                    selectedRole != null
                        ? AppTextStyles.inputText
                        : AppTextStyles.hintText,
              ),
            ),
            SvgPicture.asset(
              AppConstants.dropdownIcon,
              width: ResponsiveUtils.getResponsiveWidth(12),
              height: ResponsiveUtils.getResponsiveHeight(7),
            ),
          ],
        ),
      ),
    );
  }

  void _showRoleBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black54,
      builder:
          (context) => RoleBottomSheet(
            selectedRole: selectedRole,
            onRoleSelected: onRoleChanged,
          ),
    );
  }
}
