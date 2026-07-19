import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Centralised button style definitions.
abstract final class AppButtonStyles {
  // ── Filled (primary CTA) ─────────────────────────────────────────────────
  static ButtonStyle get filled => FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularMd,
        ),
        textStyle: AppTypography.labelLarge,
        elevation: 0,
      );

  // ── Filled tonal ──────────────────────────────────────────────────────────
  static ButtonStyle get filledTonal => FilledButton.styleFrom(
        backgroundColor: AppColors.primarySurface,
        foregroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularMd,
        ),
        textStyle: AppTypography.labelLarge,
        elevation: 0,
      );

  // ── Outlined ──────────────────────────────────────────────────────────────
  static ButtonStyle get outlined => OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularMd,
        ),
        side: const BorderSide(color: AppColors.primary, width: 1.5),
        textStyle: AppTypography.labelLarge,
      );

  // ── Text ──────────────────────────────────────────────────────────────────
  static ButtonStyle get text => TextButton.styleFrom(
        foregroundColor: AppColors.primary,
        textStyle: AppTypography.labelLarge,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularMd,
        ),
      );

  // ── Destructive ───────────────────────────────────────────────────────────
  static ButtonStyle get destructive => FilledButton.styleFrom(
        backgroundColor: AppColors.error,
        foregroundColor: AppColors.textOnPrimary,
        minimumSize: const Size(double.infinity, AppSpacing.buttonHeight),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularMd,
        ),
        textStyle: AppTypography.labelLarge,
        elevation: 0,
      );

  // ── Icon button ───────────────────────────────────────────────────────────
  static ButtonStyle get icon => IconButton.styleFrom(
        foregroundColor: AppColors.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularMd,
        ),
      );

  // ── Small filled ──────────────────────────────────────────────────────────
  static ButtonStyle get smallFilled => FilledButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.textOnPrimary,
        minimumSize: const Size(0, 36),
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.xs,
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: AppRadius.circularSm,
        ),
        textStyle: AppTypography.labelMedium,
        elevation: 0,
      );
}

/// Centralised input decoration theme.
abstract final class AppInputTheme {
  static InputDecorationTheme get theme => InputDecorationTheme(
        filled: true,
        fillColor: AppColors.surfaceVariant,
        contentPadding: AppSpacing.inputPadding,
        hintStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textTertiary,
        ),
        labelStyle: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        floatingLabelStyle: AppTypography.labelMedium.copyWith(
          color: AppColors.primary,
        ),
        errorStyle: AppTypography.bodySmall.copyWith(
          color: AppColors.error,
        ),
        border: OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide:
              const BorderSide(color: AppColors.borderFocus, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide: const BorderSide(color: AppColors.borderError, width: 1.5),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide: const BorderSide(color: AppColors.borderError, width: 2.0),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularMd,
          borderSide: BorderSide(
            color: AppColors.border.withValues(alpha: 0.5),
            width: 1.5,
          ),
        ),
        prefixIconColor: AppColors.grey400,
        suffixIconColor: AppColors.grey400,
      );
}
