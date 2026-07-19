import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Your Health Summary card layout (Bento-grid style).
///
/// Contains counts for:
/// - Upcoming Appointments
/// - Pending Results
/// - Completed Tests
class HealthSummaryCard extends StatelessWidget {
  const HealthSummaryCard({
    super.key,
    this.upcomingCount = 2,
    this.pendingCount = 3,
    this.completedCount = 15,
  });

  final int upcomingCount;
  final int pendingCount;
  final int completedCount;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularBase,
        side: BorderSide(color: AppColors.border),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.base),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Your Health Summary',
              style: AppTypography.titleMedium.copyWith(
                color: AppColors.textPrimary,
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            LayoutBuilder(
              builder: (context, constraints) {
                // If width is very constrained, fallback to horizontal layout or columns
                final isWide = constraints.maxWidth > 320;
                return Flex(
                  direction: isWide ? Axis.horizontal : Axis.vertical,
                  children: [
                    Expanded(
                      flex: isWide ? 1 : 0,
                      child: _SummaryItem(
                        icon: Icons.calendar_month_rounded,
                        count: upcomingCount.toString(),
                        label: 'Upcoming Appts',
                        iconColor: AppColors.primary,
                        backgroundColor: AppColors.primarySurface,
                      ),
                    ),
                    if (isWide) const SizedBox(width: AppSpacing.sm) else const SizedBox(height: AppSpacing.sm),
                    Expanded(
                      flex: isWide ? 1 : 0,
                      child: _SummaryItem(
                        icon: Icons.science_rounded,
                        count: pendingCount.toString(),
                        label: 'Pending Results',
                        iconColor: AppColors.error,
                        backgroundColor: AppColors.errorSurface,
                      ),
                    ),
                    if (isWide) const SizedBox(width: AppSpacing.sm) else const SizedBox(height: AppSpacing.sm),
                    Expanded(
                      flex: isWide ? 1 : 0,
                      child: _SummaryItem(
                        icon: Icons.fact_check_rounded,
                        count: completedCount.toString(),
                        label: 'Completed Tests',
                        iconColor: AppColors.secondary,
                        backgroundColor: AppColors.secondarySurface,
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class _SummaryItem extends StatelessWidget {
  const _SummaryItem({
    required this.icon,
    required this.count,
    required this.label,
    required this.iconColor,
    required this.backgroundColor,
  });

  final IconData icon;
  final String count;
  final String label;
  final Color iconColor;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: AppSpacing.md,
        horizontal: AppSpacing.sm,
      ),
      decoration: BoxDecoration(
        color: backgroundColor.withValues(alpha: 0.5),
        borderRadius: AppRadius.circularMd,
        border: Border.all(
          color: iconColor.withValues(alpha: 0.15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: iconColor,
            size: AppSpacing.iconBase,
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            count,
            style: AppTypography.displaySmall.copyWith(
              color: iconColor,
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ),
          const SizedBox(height: AppSpacing.xs),
          Text(
            label.toUpperCase(),
            style: AppTypography.labelSmall.copyWith(
              fontSize: 9,
              letterSpacing: 0.5,
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
