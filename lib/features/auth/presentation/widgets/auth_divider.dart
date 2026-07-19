import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// A centred "OR" divider row matching the Stitch login card separator.
///
/// Renders two [Divider] lines with a centred "OR" label in between.
class AuthDivider extends StatelessWidget {
  const AuthDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: Text(
            'OR',
            style: AppTypography.labelSmall.copyWith(
              color: AppColors.textSecondary,
            ),
          ),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }
}
