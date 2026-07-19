import 'package:flutter/material.dart';
import '../../core/theme/theme.dart';

/// Standard app-wide snack bar helper.
abstract final class AppSnackBar {
  static void show(
    BuildContext context, {
    required String message,
    SnackBarType type = SnackBarType.info,
    Duration duration = const Duration(seconds: 3),
    String? actionLabel,
    VoidCallback? onAction,
  }) {
    final colors = _colorsFor(type);

    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Row(
            children: [
              Icon(_iconFor(type), color: colors.icon, size: AppSpacing.iconMd),
              const SizedBox(width: AppSpacing.sm),
              Expanded(
                child: Text(
                  message,
                  style: AppTypography.bodyMedium.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ],
          ),
          backgroundColor: colors.background,
          duration: duration,
          behavior: SnackBarBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularMd,
          ),
          action: actionLabel != null
              ? SnackBarAction(
                  label: actionLabel,
                  textColor: AppColors.white,
                  onPressed: onAction ?? () {},
                )
              : null,
        ),
      );
  }

  static IconData _iconFor(SnackBarType type) {
    return switch (type) {
      SnackBarType.success => Icons.check_circle_rounded,
      SnackBarType.error => Icons.error_rounded,
      SnackBarType.warning => Icons.warning_rounded,
      SnackBarType.info => Icons.info_rounded,
    };
  }

  static ({Color background, Color icon}) _colorsFor(SnackBarType type) {
    return switch (type) {
      SnackBarType.success =>
        (background: AppColors.success, icon: AppColors.white),
      SnackBarType.error =>
        (background: AppColors.error, icon: AppColors.white),
      SnackBarType.warning =>
        (background: AppColors.warning, icon: AppColors.white),
      SnackBarType.info =>
        (background: AppColors.grey800, icon: AppColors.white),
    };
  }
}

enum SnackBarType { success, error, warning, info }
