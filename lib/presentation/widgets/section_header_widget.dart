import 'package:flutter/material.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class SectionHeaderWidget extends StatelessWidget {
  final String title;
  final int count;

  const SectionHeaderWidget({
    super.key,
    required this.title,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(ResponsiveUtils.getResponsiveHeight(16)),
      child: Text(
        title,
        style: AppTextStyles.sectionHeader.copyWith(
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
