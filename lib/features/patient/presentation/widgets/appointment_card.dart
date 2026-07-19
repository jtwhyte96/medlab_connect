import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Renders a structured upcoming appointment card with:
/// - "Confirmed" status badge
/// - Hospital icon container
/// - Appointment details (lab name, test name)
/// - Date and Time sub-container
/// - "View Details" full-width button
class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    super.key,
    this.laboratoryName = 'Lagos Diagnostic Centre',
    this.testName = 'Complete Blood Count (CBC)',
    this.dateString = '24 July 2026',
    this.timeString = '10:30 AM',
    this.statusLabel = 'Confirmed',
    this.onViewDetailsPressed,
  });

  final String laboratoryName;
  final String testName;
  final String dateString;
  final String timeString;
  final String statusLabel;
  final VoidCallback? onViewDetailsPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularBase,
        side: BorderSide(color: AppColors.border),
      ),
      color: AppColors.surface,
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.zero,
      child: Stack(
        children: [
          // ── Left Accent Stripe ─────────────────────────────────────────────
          Positioned(
            left: 0,
            top: 0,
            bottom: 0,
            width: 4,
            child: Container(
              color: AppColors.primary,
            ),
          ),
          
          // ── Status Badge ──────────────────────────────────────────────────
          Positioned(
            top: AppSpacing.base,
            right: AppSpacing.base,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.sm,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.secondarySurface,
                borderRadius: AppRadius.circularFull,
              ),
              child: Text(
                statusLabel,
                style: AppTypography.labelSmall.copyWith(
                  color: AppColors.secondaryDark,
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          
          // ── Main Content Area ──────────────────────────────────────────────
          Padding(
            padding: const EdgeInsets.fromLTRB(
              AppSpacing.base + 4, // 4dp added to prevent overlapping left stripe
              AppSpacing.base,
              AppSpacing.base,
              AppSpacing.base,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ── Medical Facility Info Row ─────────────────────────────────
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: AppColors.grey100, // bg-surface-container-high
                        borderRadius: AppRadius.circularMd,
                      ),
                      child: Icon(
                        Icons.local_hospital_rounded,
                        color: AppColors.textSecondary,
                        size: AppSpacing.iconXl2,
                      ),
                    ),
                    const SizedBox(width: AppSpacing.md),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 64.0), // space for badge
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              laboratoryName,
                              style: AppTypography.titleMedium.copyWith(
                                color: AppColors.textPrimary,
                                fontWeight: FontWeight.bold,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              testName,
                              style: AppTypography.bodyMedium.copyWith(
                                color: AppColors.textSecondary,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: AppSpacing.md),
                
                // ── Date / Time Info Box ──────────────────────────────────────
                Container(
                  padding: const EdgeInsets.all(AppSpacing.sm),
                  decoration: BoxDecoration(
                    color: AppColors.grey50, // bg-surface-container-low
                    borderRadius: AppRadius.circularSm,
                    border: Border.all(
                      color: AppColors.border,
                      width: 0.5,
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.calendar_today_rounded,
                              color: AppColors.primary,
                              size: AppSpacing.iconSm,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              dateString,
                              style: AppTypography.labelLarge.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Row(
                          children: [
                            Icon(
                              Icons.schedule_rounded,
                              color: AppColors.primary,
                              size: AppSpacing.iconSm,
                            ),
                            const SizedBox(width: AppSpacing.xs),
                            Text(
                              timeString,
                              style: AppTypography.labelLarge.copyWith(
                                color: AppColors.textPrimary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: AppSpacing.md),
                
                // ── CTA View Details Button ───────────────────────────────────
                FilledButton(
                  onPressed: onViewDetailsPressed ??
                      () => context.push(AppRoutes.appointmentDetails),
                  style: FilledButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    minimumSize: const Size.fromHeight(40),
                    shape: RoundedRectangleBorder(
                      borderRadius: AppRadius.circularFull,
                    ),
                  ),
                  child: Text(
                    'View Details',
                    style: AppTypography.labelLarge.copyWith(
                      color: AppColors.textOnPrimary,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
