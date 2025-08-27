import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/constants/app_text_styles.dart';
import '../../core/responsive/responsive_utils.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final Widget? leading;

  const CommonAppBar({
    super.key,
    required this.title,
    this.actions,
    this.leading,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppTextStyles.appBarTitle),
      centerTitle: false,
      actions: actions,
      leading: leading,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ResponsiveUtils.getResponsiveHeight(60));
}
