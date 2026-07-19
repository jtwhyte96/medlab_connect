import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

import '../widgets/appointment_card.dart';
import '../widgets/dashboard_bottom_navigation.dart';
import '../widgets/dashboard_header.dart';
import '../widgets/health_summary_card.dart';
import '../widgets/health_tip_card.dart';
import '../widgets/laboratory_card.dart';
import '../widgets/quick_action_card.dart';
import '../widgets/result_card.dart';
import '../widgets/search_bar_widget.dart';

/// Screen 003 — Patient Dashboard.
///
/// Implements the comprehensive dashboard view for John Doe:
/// - Header with centered greeting and notification icon
/// - Static Search bar routing to search page
/// - Health summary counts
/// - Quick Action Grid (Book Test, Find Lab, View Results, My Appointments)
/// - Upcoming appointment highlight
/// - Recent laboratory results list
/// - Nearby laboratories horizontal scroll
/// - Educational health tip
/// - Responsive sidebar for desktop/tablet, and bottom navigation for mobile.
class PatientDashboardScreen extends StatelessWidget {
  const PatientDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Detect layout based on screen width
    final isWideScreen = MediaQuery.of(context).size.width >= 768;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const DashboardHeader(),
      bottomNavigationBar: isWideScreen
          ? null
          : const DashboardBottomNavigation(currentIndex: 0),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Desktop Sidebar ────────────────────────────────────────────────
          if (isWideScreen) const _DesktopSidebar(currentIndex: 0),

          // ── Main Content Area ──────────────────────────────────────────────
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(AppSpacing.base),
              child: Center(
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 800),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Search Bar ──────────────────────────────────────────
                      const SearchBarWidget(),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Health Summary ──────────────────────────────────────
                      const HealthSummaryCard(),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Quick Actions Grid ──────────────────────────────────
                      _buildQuickActions(),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Upcoming Appointment ───────────────────────────────
                      _buildSectionHeader(
                        title: 'Upcoming Appointment',
                        onSeeAllPressed: () =>
                            context.push(AppRoutes.appointments),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      const AppointmentCard(),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Recent Results ──────────────────────────────────────
                      _buildSectionHeader(
                        title: 'Recent Results',
                        onSeeAllPressed: () => context.push(AppRoutes.results),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _buildRecentResults(context),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Nearby Laboratories ────────────────────────────────
                      _buildSectionHeader(
                        title: 'Nearby Laboratories',
                        onSeeAllPressed: () =>
                            context.push(AppRoutes.laboratories),
                      ),
                      const SizedBox(height: AppSpacing.sm),
                      _buildNearbyLaboratories(),

                      const SizedBox(height: AppSpacing.lg),

                      // ── Health Tip ──────────────────────────────────────────
                      const HealthTipCard(),
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

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onSeeAllPressed,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppTypography.titleMedium.copyWith(
            color: AppColors.textPrimary,
          ),
        ),
        TextButton(
          onPressed: onSeeAllPressed,
          style: TextButton.styleFrom(
            foregroundColor: AppColors.primary,
            padding: EdgeInsets.zero,
            minimumSize: Size.zero,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            'See All',
            style: AppTypography.labelLarge.copyWith(color: AppColors.primary),
          ),
        ),
      ],
    );
  }

  Widget _buildQuickActions() {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: QuickActionCard(
                title: 'Book Test',
                description: 'Schedule a new lab test.',
                icon: Icons.calendar_month_rounded,
                iconBackgroundColor: AppColors.primarySurface,
                iconColor: AppColors.primary,
                route: AppRoutes.bookTest,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: QuickActionCard(
                title: 'Find Lab',
                description: 'Locate nearby facilities.',
                icon: Icons.location_on_rounded,
                iconBackgroundColor: AppColors.secondarySurface,
                iconColor: AppColors.secondaryDark,
                route: AppRoutes.laboratories,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppSpacing.sm),
        Row(
          children: [
            Expanded(
              child: QuickActionCard(
                title: 'View Results',
                description: 'Access your medical data.',
                icon: Icons.description_rounded,
                iconBackgroundColor: AppColors.grey200,
                iconColor: AppColors.grey600,
                route: AppRoutes.results,
              ),
            ),
            const SizedBox(width: AppSpacing.sm),
            Expanded(
              child: QuickActionCard(
                title: 'My Appointments',
                description: 'Manage scheduled visits.',
                icon: Icons.event_available_rounded,
                iconBackgroundColor: AppColors.primarySurface,
                iconColor: AppColors.primary,
                route: AppRoutes.appointments,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRecentResults(BuildContext context) {
    return Column(
      children: [
        const ResultCard(
          title: 'Lipid Profile',
          subtitle: 'MedLab Central • 12 July 2026',
          route: AppRoutes.resultDetails,
        ),
        const SizedBox(height: AppSpacing.sm),
        const ResultCard(
          title: 'Thyroid Function Test',
          subtitle: 'City Health Clinic • 05 July 2026',
          route: AppRoutes.resultDetails,
        ),
        const SizedBox(height: AppSpacing.sm),
        const ResultCard(
          title: 'Urinalysis',
          subtitle: 'Lagos Diagnostic Centre • 28 June 2026',
          route: AppRoutes.resultDetails,
        ),
      ],
    );
  }

  Widget _buildNearbyLaboratories() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          LaboratoryCard(
            name: 'Skyline Labs',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuDxoS9omd5zut6lxAplvbFk1gs94lteiEmUz8jUv-8sCrFL9WlQrfzkWZki-hCIq1hwbnZbSG5pNx0uaYSeCkgzi6jxNSBlcF-EWdZ2yyK9l0kzB4Qs1eu5sJsJNd5keCpgjaK4qTIMpyjRwL9A0WUDlq8bi7Vl8k3PCJMHE540fZ6iC6J-Z27dGSVqw-mET5X6kShaoEK8vhTAyb6fzqhLDHy-6Nwt0OYG2-k90fOR8ofd4S5LH9Bvew',
            distance: '1.2 km',
            rating: '4.8/5',
            route: AppRoutes.laboratoryDetails,
          ),
          SizedBox(width: AppSpacing.sm),
          LaboratoryCard(
            name: 'Apex Diagnostics',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuCIFkDL1MsvJ-ghdeu0v7EGp8vdKnJ70p4sN9jPwMVUuZVnoC69j5zxIqSMxsptZJHIESvocqE3WHrIQK5B3kZGPpk1atQRhsaHNKDkIWtFwlhoAcw2wa5a7RnWd18KrcOMqyCVFcZEQQddelB5IHORzWkhY8MK_aD_F5wdAiUlFRSNPb5I4n4w4xUXcJzjZvHIshLRpWZinUfYqnefS86u1nQ0YGUrQbtxP4Sh5X8JKl70vhRm_mHvOA',
            distance: '2.5 km',
            rating: '4.5/5',
            route: AppRoutes.laboratoryDetails,
          ),
          SizedBox(width: AppSpacing.sm),
          LaboratoryCard(
            name: 'Premier Med Center',
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuB6ZTG4aO1vjM_v1UZTkywg6xBtZY5uKnJz4tZ27sbHIG-4mp3BQziO46RMbyQyKH3X9KEYqpiNsgoCEuN7rivkx4yko7GWopkJQeguQDInue9aMMHqLTcjMaFu5wAVXJ1wwXaGWJbwdoIH-gUzooeXuo72AIpREANPeWbb7cWjsKIXqC5l8-i1y1skOe8bgiRUr5CmR682HdFB0rujZH__3GsdT_vNXRVWYzlMc10DEtM0Aajj88YJ8w',
            distance: '3.8 km',
            rating: '4.2/5',
            route: AppRoutes.laboratoryDetails,
          ),
        ],
      ),
    );
  }
}

// ── Desktop Navigation Sidebar Rail ──────────────────────────────────────────

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
            icon: Icons.biotech_rounded,
            label: 'Tests',
            isActive: currentIndex == 3,
            onTap: () => context.push(AppRoutes.results),
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
