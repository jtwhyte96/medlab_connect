import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/theme.dart';
import '../../../core/constants/constants.dart';

/// Generic not-found / error screen used by GoRouter's [errorBuilder].
class ErrorScreen extends StatelessWidget {
  final Exception? error;

  const ErrorScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: AppSpacing.pagePadding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 96,
                height: 96,
                decoration: const BoxDecoration(
                  color: AppColors.errorSurface,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: AppSpacing.xl7,
                  color: AppColors.error,
                ),
              ),
              const SizedBox(height: AppSpacing.xl2),
              Text(
                'Page not found',
                style: AppTypography.headlineSmall,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                "The page you're looking for doesn't exist or has been moved.",
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              if (error != null) ...[
                const SizedBox(height: AppSpacing.base),
                Container(
                  padding: AppSpacing.cardPadding,
                  decoration: BoxDecoration(
                    color: AppColors.errorSurface,
                    borderRadius: AppRadius.circularMd,
                  ),
                  child: Text(
                    error.toString(),
                    style: AppTypography.bodySmall.copyWith(
                      color: AppColors.error,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
              const SizedBox(height: AppSpacing.xl2),
              FilledButton.icon(
                onPressed: () => context.go(AppRoutes.login),
                icon: const Icon(Icons.home_rounded),
                label: const Text('Go to Home'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
