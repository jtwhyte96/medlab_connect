import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Interactive, pill-shaped Search Bar for the Search Laboratories screen.
///
/// Features a leading search icon, placeholder text, and a trailing microphone icon.
class LaboratorySearchBar extends StatelessWidget {
  const LaboratorySearchBar({
    super.key,
    this.controller,
    this.onChanged,
  });

  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.grey50, // Matches light container surface
        borderRadius: AppRadius.circularFull,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 3,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: TextField(
        controller: controller,
        onChanged: onChanged,
        style: AppTypography.bodyLarge.copyWith(
          color: AppColors.textPrimary,
        ),
        decoration: InputDecoration(
          hintText: 'Search laboratories, tests or locations',
          hintStyle: AppTypography.bodyLarge.copyWith(
            color: AppColors.textTertiary,
          ),
          prefixIcon: Icon(
            Icons.search_rounded,
            color: AppColors.textSecondary,
            size: AppSpacing.iconBase,
          ),
          suffixIcon: Icon(
            Icons.mic_none_rounded,
            color: AppColors.primary,
            size: AppSpacing.iconBase,
          ),
          border: OutlineInputBorder(
            borderRadius: AppRadius.circularFull,
            borderSide: BorderSide.none,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: AppSpacing.base,
            vertical: AppSpacing.md,
          ),
          filled: true,
          fillColor: Colors.transparent,
        ),
      ),
    );
  }
}
