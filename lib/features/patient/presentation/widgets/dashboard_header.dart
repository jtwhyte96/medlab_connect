import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// The centered greeting text component in the dashboard header.
class GreetingSection extends StatelessWidget {
  const GreetingSection({
    super.key,
    required this.name,
  });

  final String name;

  @override
  Widget build(BuildContext context) {
    return Text(
      'Good Morning, $name',
      style: AppTypography.titleLarge.copyWith(
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimary,
      ),
      textAlign: TextAlign.center,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }
}

/// Sticky-style Top App Bar for the Patient Dashboard.
///
/// Contains:
/// - Leading profile avatar (navigates to `/profile/patient`)
/// - Centered [GreetingSection]
/// - Trailing notification icon with badge (navigates to `/notifications`)
class DashboardHeader extends StatelessWidget implements PreferredSizeWidget {
  const DashboardHeader({
    super.key,
    this.patientName = 'John Doe',
    this.avatarUrl =
        'https://lh3.googleusercontent.com/aida-public/AB6AXuDyquqbqa-nqFptAWhTctcGXOXMnjLz3OXI2MZbACBI_PXG0oOWHip1H_lKq4eE69YPG_E8JO43LFpmnPg6rlDH46d2h2A_4F9mroMnGBAKTKBQmPK7JtF2JAKVx1Vqx-NtI-hgq3LpvujoQH_ATPLPPGbgQnPS5QBrI_5Z4aXWYXJzieNMMGs-hgjhHsrcyxWHZF_GN-rcDny2GCaMpAHy2nSXftOHh_avXjCgjVYW3zwVcGCSm9lygQ',
  });

  final String patientName;
  final String avatarUrl;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.surface,
      elevation: 0,
      scrolledUnderElevation: 0,
      leadingWidth: 56,
      leading: Padding(
        padding: const EdgeInsets.only(left: AppSpacing.md),
        child: Center(
          child: GestureDetector(
            onTap: () => context.push(AppRoutes.profilePatient),
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.12),
                    blurRadius: 3,
                    offset: const Offset(0, 1),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: AppRadius.circularFull,
                child: Image.network(
                  avatarUrl,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: AppColors.primarySurface,
                    child: const Icon(
                      Icons.person_rounded,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      title: GreetingSection(name: patientName),
      centerTitle: true,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: AppSpacing.md),
          child: Center(
            child: Stack(
              children: [
                IconButton(
                  icon: const Icon(Icons.notifications_outlined),
                  color: AppColors.textSecondary,
                  onPressed: () => context.push(AppRoutes.notifications),
                  tooltip: 'Notifications',
                ),
                Positioned(
                  top: 8,
                  right: 8,
                  child: Container(
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: AppColors.error,
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: AppColors.surface,
                        width: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(AppSpacing.appBarHeight);
}
