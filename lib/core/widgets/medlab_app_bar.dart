import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Branded AppBar with consistent styling.
///
/// Wraps [AppBar] with MedLab defaults — use this instead of raw [AppBar].
class MedLabAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final List<Widget>? actions;
  final bool showBackButton;
  final VoidCallback? onBackPressed;
  final Widget? leading;
  final PreferredSizeWidget? bottom;
  final Color? backgroundColor;

  const MedLabAppBar({
    super.key,
    required this.title,
    this.actions,
    this.showBackButton = true,
    this.onBackPressed,
    this.leading,
    this.bottom,
    this.backgroundColor,
  });

  @override
  Size get preferredSize => Size.fromHeight(
        AppSpacing.appBarHeight + (bottom?.preferredSize.height ?? 0),
      );

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      backgroundColor: backgroundColor ?? AppColors.surface,
      automaticallyImplyLeading: showBackButton,
      leading: leading ??
          (showBackButton && Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back_ios_new_rounded),
                  onPressed: onBackPressed ?? () => Navigator.pop(context),
                )
              : null),
      actions: actions,
      bottom: bottom,
    );
  }
}
