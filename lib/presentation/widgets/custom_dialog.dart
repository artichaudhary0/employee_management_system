import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';

class CustomDialog extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback? onCancel;
  final VoidCallback? onConfirm;
  final Color? confirmButtonColor;

  const CustomDialog({
    super.key,
    required this.title,
    required this.content,
    this.cancelText = 'Cancel',
    this.confirmText = 'Confirm',
    this.onCancel,
    this.onConfirm,
    this.confirmButtonColor,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        title,
        style: AppTextStyles.employeeName,
      ),
      content: Text(
        content,
        style: AppTextStyles.employeeRole,
      ),
      actions: [
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: onCancel ?? () => Navigator.pop(context),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppConstants.disableColor,
              foregroundColor: AppConstants.primaryBlue,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              cancelText,
              style: AppTextStyles.buttonText,
            ),
          ),
        ),
        SizedBox(
          height: 40,
          child: ElevatedButton(
            onPressed: onConfirm,
            style: ElevatedButton.styleFrom(
              backgroundColor: confirmButtonColor ?? AppColors.primary,
              foregroundColor: AppColors.white,
              elevation: 0,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
              ),
            ),
            child: Text(
              confirmText,
              style: AppTextStyles.buttonText,
            ),
          ),
        ),
      ],
    );
  }

  static Future<bool?> showDeleteDialog({
    required BuildContext context,
    String title = 'Delete Employee',
    String content = 'Are you sure you want to delete this employee?',
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        title: title,
        content: content,
        confirmText: 'Delete',
        confirmButtonColor: AppColors.delete,
        onConfirm: () => Navigator.pop(context, true),
      ),
    );
  }

  static Future<bool?> showConfirmDialog({
    required BuildContext context,
    required String title,
    required String content,
    String confirmText = 'Confirm',
    Color? confirmButtonColor,
  }) async {
    return await showDialog<bool>(
      context: context,
      builder: (context) => CustomDialog(
        title: title,
        content: content,
        confirmText: confirmText,
        confirmButtonColor: confirmButtonColor,
        onConfirm: () => Navigator.pop(context, true),
      ),
    );
  }
}