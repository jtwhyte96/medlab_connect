import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Minimal splash screen — shown during async initialization.
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.medical_services_rounded,
              size: AppSpacing.xl8,
              color: AppColors.white,
            ),
            const SizedBox(height: AppSpacing.xl),
            Text(
              'MedLab Connect',
              style: AppTypography.headlineMedium.copyWith(
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: AppSpacing.xl4),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(AppColors.white),
              strokeWidth: 2,
            ),
          ],
        ),
      ),
    );
  }
}
