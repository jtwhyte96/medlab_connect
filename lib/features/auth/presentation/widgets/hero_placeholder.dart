import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Hero illustration placeholder.
///
/// Renders a 280 × 280 dp rounded square with a subtle laboratory-themed
/// icon composition, matching the Stitch `max-w-[280px] aspect-square
/// rounded-2xl bg-surface-container-low` section.
class HeroPlaceholder extends StatelessWidget {
  const HeroPlaceholder({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        color: AppColors.primarySurface,
        borderRadius: AppRadius.circularXl,
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          // ── Decorative background circle ──────────────────────────────
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.primary.withValues(alpha: 0.08),
            ),
          ),
          // ── Main icon cluster ─────────────────────────────────────────
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.biotech_rounded,
                size: 72,
                color: AppColors.primary,
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.science_rounded,
                    size: 32,
                    color: AppColors.secondary,
                  ),
                  const SizedBox(width: AppSpacing.xl),
                  Icon(
                    Icons.monitor_heart_rounded,
                    size: 32,
                    color: AppColors.primaryLight,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
