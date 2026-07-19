import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Reusable card representing a diagnostic lab result.
///
/// Triggers navigation on tap using GoRouter.
class ResultCard extends StatelessWidget {
  const ResultCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.statusLabel = 'Completed',
    required this.route,
  });

  final String title;
  final String subtitle;
  final String statusLabel;
  final String route;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularBase,
        side: BorderSide(color: AppColors.border),
      ),
      color: AppColors.surface,
      margin: EdgeInsets.zero,
      child: InkWell(
        onTap: () => context.push(route),
        borderRadius: BorderRadius.circular(AppRadius.base),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Row(
            children: [
              // ── Left: Icon Avatar ──────────────────────────────────────────
              Container(
                width: 40,
                height: 40,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondarySurface,
                ),
                child: const Icon(
                  Icons.science_rounded,
                  color: AppColors.secondary,
                  size: 20,
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              // ── Center: Title & Subtitle ───────────────────────────────────
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AppTypography.titleMedium.copyWith(
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: AppSpacing.xs2),
                    Text(
                      subtitle,
                      style: AppTypography.bodySmall.copyWith(
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
              ),
              // ── Right: Badge & Chevron ─────────────────────────────────────
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSpacing.sm,
                      vertical: AppSpacing.xs2,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.grey100,
                      borderRadius: AppRadius.circularFull,
                    ),
                    child: Text(
                      statusLabel,
                      style: AppTypography.labelSmall.copyWith(
                        fontSize: 10,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppSpacing.xs),
                  Icon(
                    Icons.chevron_right_rounded,
                    color: AppColors.grey500,
                    size: AppSpacing.iconBase,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
