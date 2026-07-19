import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Horizontal scrollable quick filter chips row.
///
/// Contains: "All", "Nearby", "Open Now", "Home Sample Collection", "Top Rated".
/// Tapping a chip updates its active visual state.
class FilterChipRow extends StatefulWidget {
  const FilterChipRow({super.key});

  @override
  State<FilterChipRow> createState() => _FilterChipRowState();
}

class _FilterChipRowState extends State<FilterChipRow> {
  int _selectedIndex = 0;

  final List<String> _filters = [
    'All',
    'Nearby',
    'Open Now',
    'Home Sample Collection',
    'Top Rated',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Row(
        children: List.generate(_filters.length, (index) {
          final isSelected = index == _selectedIndex;
          return Padding(
            padding: EdgeInsets.only(
              left: index == 0 ? 0 : AppSpacing.sm,
              right: index == _filters.length - 1 ? AppSpacing.base : 0,
            ),
            child: GestureDetector(
              onTap: () {
                setState(() => _selectedIndex = index);
              },
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSpacing.base,
                  vertical: AppSpacing.sm,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primaryDark : AppColors.grey100,
                  borderRadius: AppRadius.circularFull,
                ),
                child: Text(
                  _filters[index],
                  style: AppTypography.labelLarge.copyWith(
                    color: isSelected ? AppColors.textOnPrimary : AppColors.textPrimary,
                    fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
