import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Reusable small chip/tag to display services like Blood Tests, MRI, etc.
class ServiceTag extends StatelessWidget {
  const ServiceTag({
    super.key,
    required this.label,
    this.textColor,
    this.backgroundColor,
    this.borderColor,
  });

  final String label;
  final Color? textColor;
  final Color? backgroundColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    final isHomeCollection = label == 'Home Collection' || label == 'Home Sample Collection';
    
    // Default colors matching Stitch mockup
    final defaultBgColor = isHomeCollection 
        ? const Color(0xFFF5EEFD) // Light lavender
        : AppColors.grey100;     // Light grey
        
    final defaultTextColor = isHomeCollection 
        ? const Color(0xFF6B21A8) // Deep purple
        : AppColors.textSecondary;
        
    final defaultBorderColor = isHomeCollection 
        ? const Color(0xFFE9D5FF) // Subtle purple border
        : Colors.transparent;

    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppSpacing.sm,
        vertical: 4,
      ),
      decoration: BoxDecoration(
        color: backgroundColor ?? defaultBgColor,
        borderRadius: AppRadius.circularXs,
        border: Border.all(
          color: borderColor ?? defaultBorderColor,
          width: 1,
        ),
      ),
      child: Text(
        label,
        style: AppTypography.labelSmall.copyWith(
          color: textColor ?? defaultTextColor,
          fontWeight: isHomeCollection ? FontWeight.bold : FontWeight.w500,
          fontSize: 11,
        ),
      ),
    );
  }
}
