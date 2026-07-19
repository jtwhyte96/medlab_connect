import 'package:flutter/material.dart';
import '../theme/theme.dart';

/// Standardised card with MedLab border and radius.
class AppCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final Color? color;
  final BorderRadius? borderRadius;

  const AppCard({
    super.key,
    required this.child,
    this.padding,
    this.onTap,
    this.color,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? AppRadius.circularBase;
    return Material(
      color: color ?? AppColors.surface,
      borderRadius: radius,
      child: InkWell(
        onTap: onTap,
        borderRadius: radius,
        child: Container(
          padding: padding ?? AppSpacing.cardPadding,
          decoration: BoxDecoration(
            borderRadius: radius,
            border: Border.all(color: AppColors.border),
          ),
          child: child,
        ),
      ),
    );
  }
}
