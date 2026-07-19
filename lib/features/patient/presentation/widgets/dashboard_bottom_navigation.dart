import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Reusable Bottom Navigation Bar for the Patient Dashboard.
///
/// Features Material 3 style active/inactive pill buttons matching Stitch specs.
class DashboardBottomNavigation extends StatelessWidget {
  const DashboardBottomNavigation({
    super.key,
    required this.currentIndex,
  });

  final int currentIndex;

  void _onNavigationItemTapped(BuildContext context, int index) {
    if (index == currentIndex) return;

    switch (index) {
      case 0:
        context.go(AppRoutes.patientHome);
        break;
      case 1:
        context.push(AppRoutes.search);
        break;
      case 2:
        context.push(AppRoutes.appointments);
        break;
      case 3:
        context.push(AppRoutes.results);
        break;
      case 4:
        context.push(AppRoutes.profilePatient);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: AppColors.grey100, // Matches surface-container
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(AppRadius.md),
          topRight: Radius.circular(AppRadius.md),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _BottomNavItem(
              icon: Icons.dashboard_rounded,
              label: 'Dashboard',
              isActive: currentIndex == 0,
              onTap: () => _onNavigationItemTapped(context, 0),
            ),
            _BottomNavItem(
              icon: Icons.search_rounded,
              label: 'Search',
              isActive: currentIndex == 1,
              onTap: () => _onNavigationItemTapped(context, 1),
            ),
            _BottomNavItem(
              icon: Icons.event_rounded,
              label: 'Appointments',
              isActive: currentIndex == 2,
              onTap: () => _onNavigationItemTapped(context, 2),
            ),
            _BottomNavItem(
              icon: Icons.biotech_rounded,
              label: 'Tests',
              isActive: currentIndex == 3,
              onTap: () => _onNavigationItemTapped(context, 3),
            ),
            _BottomNavItem(
              icon: Icons.person_rounded,
              label: 'Profile',
              isActive: currentIndex == 4,
              onTap: () => _onNavigationItemTapped(context, 4),
            ),
          ],
        ),
      ),
    );
  }
}

class _BottomNavItem extends StatelessWidget {
  const _BottomNavItem({
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
      borderRadius: BorderRadius.circular(AppRadius.full),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: AppSpacing.sm,
          vertical: AppSpacing.xs,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.base,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                borderRadius: AppRadius.circularFull,
                color: isActive ? AppColors.secondarySurface : Colors.transparent,
              ),
              child: Icon(
                icon,
                color: isActive ? AppColors.secondaryDark : AppColors.textSecondary,
                size: AppSpacing.iconBase,
              ),
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
