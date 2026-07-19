import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Clickable, read-only search bar widget for the Patient Dashboard.
///
/// Tapping this search bar navigates to [AppRoutes.search] using GoRouter.
class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push(AppRoutes.search),
      child: Container(
        height: AppSpacing.inputHeight,
        decoration: BoxDecoration(
          color: AppColors.surfaceVariant,
          borderRadius: AppRadius.circularFull,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.12),
              blurRadius: 3,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        padding: const EdgeInsets.symmetric(horizontal: AppSpacing.base),
        child: Row(
          children: [
            Icon(
              Icons.search_rounded,
              color: AppColors.textSecondary,
              size: AppSpacing.iconBase,
            ),
            const SizedBox(width: AppSpacing.sm),
            Text(
              'Search laboratories, tests or doctors',
              style: AppTypography.bodyLarge.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
