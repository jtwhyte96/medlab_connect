import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// A card for Quick Actions on the Patient Dashboard.
///
/// Contains:
/// - A circular icon with custom container background
/// - A bold title
/// - A short description
/// - Tapping the card routes using GoRouter.
class QuickActionCard extends StatelessWidget {
  const QuickActionCard({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconColor,
    required this.route,
  });

  final String title;
  final String description;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconColor;
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
      child: InkWell(
        onTap: () => context.push(route),
        borderRadius: BorderRadius.circular(AppRadius.base),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.base),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: iconBackgroundColor,
                    ),
                    child: Icon(
                      icon,
                      color: iconColor,
                      size: AppSpacing.iconBase,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  Text(
                    title,
                    style: AppTypography.titleMedium.copyWith(
                      color: AppColors.textPrimary,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.xs),
                  Text(
                    description,
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.textSecondary,
                    ),
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
