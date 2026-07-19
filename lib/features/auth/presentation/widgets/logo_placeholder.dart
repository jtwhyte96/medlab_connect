import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Renders the MedLab Connect brand mark: icon + wordmark + tagline.
///
/// Mirrors the Stitch header section: icon and heading on one row, tagline
/// below, centred, using [AppColors.primary] as the accent colour.
class LogoPlaceholder extends StatelessWidget {
  const LogoPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Icon + wordmark row ───────────────────────────────────────────
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_rounded,
              size: AppSpacing.iconXl,
              color: AppColors.primary,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'MedLab Connect',
              style: AppTypography.headlineMedium.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.xs),
        // ── Tagline ───────────────────────────────────────────────────────
        Text(
          'Trusted Laboratory Testing. Connected Care.',
          style: AppTypography.labelLarge.copyWith(
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
