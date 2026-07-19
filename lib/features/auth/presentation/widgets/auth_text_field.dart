import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// A labelled text field styled to match the Stitch Patient Login card.
///
/// Renders a floating label above the border (Material 3 outlined style),
/// a leading icon, an optional trailing icon button (e.g. password toggle),
/// and an optional hint text inside the field.
class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.prefixIcon,
    this.hint,
    this.obscureText = false,
    this.keyboardType,
    this.suffixIcon,
    this.controller,
  });

  final String label;
  final IconData prefixIcon;
  final String? hint;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: AppTypography.bodyLarge.copyWith(
        color: AppColors.textPrimary,
      ),
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        hintStyle: AppTypography.bodyLarge.copyWith(
          color: AppColors.textTertiary,
        ),
        labelStyle: AppTypography.labelSmall.copyWith(
          color: AppColors.primary,
        ),
        floatingLabelStyle: AppTypography.labelSmall.copyWith(
          color: AppColors.primary,
        ),
        prefixIcon: Icon(
          prefixIcon,
          size: AppSpacing.iconBase,
          color: AppColors.grey500,
        ),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: AppRadius.circularXs,
          borderSide: BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularXs,
          borderSide: BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: AppRadius.circularXs,
          borderSide: BorderSide(color: AppColors.primary, width: 2),
        ),
        filled: true,
        fillColor: AppColors.surface,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.base,
          vertical: AppSpacing.md,
        ),
      ),
    );
  }
}
