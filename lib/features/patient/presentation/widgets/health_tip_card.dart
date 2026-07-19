import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Reusable Health Tip card matching the Stitch patient dashboard footer tip.
class HealthTipCard extends StatelessWidget {
  const HealthTipCard({
    super.key,
    this.title = 'Health Tip',
    this.tipText =
        'Stay hydrated before your scheduled blood test unless instructed otherwise by your clinician.',
  });

  final String title;
  final String tipText;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularBase,
        side: BorderSide(
          color: AppColors.primaryLight.withValues(alpha: 0.2),
        ),
      ),
      color: AppColors.primarySurface.withValues(alpha: 0.5),
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.base),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Left Lamp Icon Avatar ─────────────────────────────────────────
            Container(
              width: 48,
              height: 48,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
              ),
              child: const Icon(
                Icons.lightbulb_rounded,
                color: AppColors.textOnPrimary,
                size: AppSpacing.iconXl,
              ),
            ),
            const SizedBox(width: AppSpacing.md),
            // ── Right Tip Content ─────────────────────────────────────────────
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    tipText,
                    style: AppTypography.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
