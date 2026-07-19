import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

import '../widgets/dashboard_bottom_navigation.dart';
import '../widgets/filter_chip_row.dart';
import '../widgets/laboratory_list_card.dart';
import '../widgets/laboratory_search_bar.dart';
import '../widgets/map_preview_card.dart';

/// Screen 004 — Search Laboratories (Mobile / Responsive).
///
/// Implements the high-fidelity Search screen matching the Stitch mockup:
/// - Sticky transactional top app bar with back button, screen title, and filter icon.
/// - Pill-shaped interactive Search field.
/// - Scrollable Quick Filter chips.
/// - Map shortcut card ("View laboratories on map").
/// - List of laboratory results showing logos, names, rating, distance, certified badges,
///   service chips, and Call-to-Actions (View Details, Book Test).
/// - Layout constrained to 800px on desktop/tablet, desktop sidebar support, and bottom nav for mobile.
class SearchLaboratoriesScreen extends StatelessWidget {
  const SearchLaboratoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isWideScreen = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.surface,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.textPrimary,
          onPressed: () => context.pop(),
          tooltip: 'Back',
        ),
        title: Text(
          'Search Laboratories',
          style: AppTypography.titleLarge.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list_rounded),
            color: AppColors.textPrimary,
            onPressed: () {
              // TODO(filters): Open filter bottom sheet
            },
            tooltip: 'Filter',
          ),
        ],
      ),
      bottomNavigationBar: isWideScreen
          ? null
          : const DashboardBottomNavigation(currentIndex: 1),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Desktop Sidebar ────────────────────────────────────────────────
          if (isWideScreen) const _DesktopSidebar(currentIndex: 1),

          // ── Main Content Area ──────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.base,
                vertical: AppSpacing.md,
              ),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Search Field ────────────────────────────────────────
                      const LaboratorySearchBar(),

                      const SizedBox(height: AppSpacing.md),

                      // ── Quick Filter Chips ──────────────────────────────────
                      const FilterChipRow(),

                      const SizedBox(height: AppSpacing.md),

                      // ── Map Preview ─────────────────────────────────────────
                      MapPreviewCard(
                        onTap: () {
                          // TODO(map): Navigate to Map View
                        },
                      ),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Title / Total Count ─────────────────────────────────
                      Text(
                        'Nearby Laboratories (12 Found)',
                        style: AppTypography.titleMedium.copyWith(
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: AppSpacing.sm),

                      // ── Laboratories List ───────────────────────────────────
                      _buildLaboratoriesList(context),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ── Helper builders ────────────────────────────────────────────────────────

  Widget _buildLaboratoriesList(BuildContext context) {
    return Column(
      children: [
        // Lab 1: Skyline Diagnostics
        LaboratoryListCard(
          name: 'Skyline Diagnostics',
          rating: 4.8,
          distance: '1.2 km',
          logoColor: const Color(0xFFC0E0F8), // Light blue placeholder
          services: const ['Blood Tests', 'MRI', 'Home Collection'],
          onViewDetails: () => context.push(AppRoutes.laboratoryDetails),
          onBookTest: () => context.push(AppRoutes.booking),
        ),
        const SizedBox(height: AppSpacing.md),

        // Lab 2: MedLab Central (ISO Certified)
        LaboratoryListCard(
          name: 'MedLab Central',
          rating: 4.6,
          distance: '3.4 km',
          logoIcon: Icons.business_rounded,
          logoColor: AppColors.grey200,
          certificationText: 'ISO Certified',
          services: const ['Pathology', 'X-Ray'],
          onViewDetails: () => context.push(AppRoutes.laboratoryDetails),
          onBookTest: () => context.push(AppRoutes.booking),
        ),
        const SizedBox(height: AppSpacing.md),

        // Lab 3: Apex Laboratories (Closed)
        LaboratoryListCard(
          name: 'Apex Laboratories',
          rating: 4.2,
          distance: '5.1 km',
          logoIcon: Icons.local_pharmacy_rounded,
          logoColor: AppColors.grey200,
          isOpen: false,
          services: const ['Blood Tests', 'Home Collection'],
          onViewDetails: () => context.push(AppRoutes.laboratoryDetails),
          onBookTest: () => context.push(AppRoutes.booking),
        ),
        const SizedBox(height: AppSpacing.md),

        // Lab 4: PrimeCare Labs
        LaboratoryListCard(
          name: 'PrimeCare Labs',
          rating: 4.5,
          distance: '2.0 km',
          logoIcon: Icons.medical_services_outlined,
          logoColor: AppColors.grey200,
          services: const ['COVID-19', 'Blood Tests'],
          onViewDetails: () => context.push(AppRoutes.laboratoryDetails),
          onBookTest: () => context.push(AppRoutes.booking),
        ),
        const SizedBox(height: AppSpacing.md),

        // Lab 5: HealthPlus Diagnostics
        LaboratoryListCard(
          name: 'HealthPlus Diagnostics',
          rating: 4.4,
          distance: '2.8 km',
          logoIcon: Icons.health_and_safety_outlined,
          logoColor: AppColors.grey200,
          services: const ['CT Scan', 'Blood Tests', 'Home Collection'],
          onViewDetails: () => context.push(AppRoutes.laboratoryDetails),
          onBookTest: () => context.push(AppRoutes.booking),
        ),
      ],
    );
  }
}

// ── Desktop Sidebar ──────────────────────────────────────────────────────────

class _DesktopSidebar extends StatelessWidget {
  const _DesktopSidebar({required this.currentIndex});

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      decoration: BoxDecoration(
        color: AppColors.grey100,
        border: Border(
          right: BorderSide(color: AppColors.border),
        ),
      ),
      child: Column(
        children: [
          const SizedBox(height: AppSpacing.md),
          _SidebarItem(
            icon: Icons.dashboard_rounded,
            label: 'Home',
            isActive: currentIndex == 0,
            onTap: () => context.go(AppRoutes.patientHome),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SidebarItem(
            icon: Icons.search_rounded,
            label: 'Search',
            isActive: currentIndex == 1,
            onTap: () => context.go(AppRoutes.search),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SidebarItem(
            icon: Icons.event_rounded,
            label: 'Appts',
            isActive: currentIndex == 2,
            onTap: () => context.push(AppRoutes.appointments),
          ),
          const SizedBox(height: AppSpacing.lg),
          _SidebarItem(
            icon: Icons.person_rounded,
            label: 'Profile',
            isActive: currentIndex == 4,
            onTap: () => context.push(AppRoutes.profilePatient),
          ),
        ],
      ),
    );
  }
}

class _SidebarItem extends StatelessWidget {
  const _SidebarItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppRadius.md),
      child: Container(
        width: 64,
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(AppRadius.md),
          color: isActive ? AppColors.secondarySurface : Colors.transparent,
        ),
        child: Column(
          children: [
            Icon(
              icon,
              color: isActive ? AppColors.secondaryDark : AppColors.textSecondary,
              size: AppSpacing.iconBase,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTypography.labelSmall.copyWith(
                fontSize: 10,
                color: isActive ? AppColors.secondaryDark : AppColors.textSecondary,
                fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
