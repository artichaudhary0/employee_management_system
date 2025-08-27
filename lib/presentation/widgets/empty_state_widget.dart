import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class EmptyStateWidget extends StatelessWidget {
  const EmptyStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SvgPicture.asset(
        AppConstants.noEmployeeImage,
        width: ResponsiveUtils.getResponsiveWidth(262),
        height: ResponsiveUtils.getResponsiveHeight(244),
      ),
    );
  }
}