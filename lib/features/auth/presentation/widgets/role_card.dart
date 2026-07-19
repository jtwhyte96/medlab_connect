import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Data class describing a role option on the Welcome screen.
class RoleCardData {
  const RoleCardData({
    required this.title,
    required this.icon,
    required this.iconBackgroundColor,
    required this.iconForegroundColor,
    required this.description,
    required this.buttonLabel,
    required this.route,
    required this.buttonStyle,
  });

  final String title;
  final IconData icon;
  final Color iconBackgroundColor;
  final Color iconForegroundColor;
  final String description;
  final String buttonLabel;
  final String route;
  final _RoleButtonStyle buttonStyle;
}

/// Distinguishes the two button styles used across role cards.
enum _RoleButtonStyle { filled, outlined }

/// Large elevated role-selection card.
///
/// Layout faithfully follows the Stitch card design:
/// - `rounded-2xl` border → [AppRadius.xl]
/// - `border border-outline-variant` + `shadow` → [Card] with [BorderSide]
/// - Icon avatar (filled circle) + title row
/// - Body description text
/// - Full-width CTA button (filled for Patient, outlined for Doctor)
///
/// Pressing the button navigates to [RoleCardData.route] via [GoRouter].
class RoleCard extends StatelessWidget {
  const RoleCard({
    super.key,
    required this.data,
  });

  final RoleCardData data;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularXl,
        side: BorderSide(color: AppColors.border),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Icon + title row ────────────────────────────────────────
            Row(
              children: [
                _RoleIconAvatar(
                  icon: data.icon,
                  backgroundColor: data.iconBackgroundColor,
                  foregroundColor: data.iconForegroundColor,
                ),
                const SizedBox(width: AppSpacing.base),
                Text(
                  data.title,
                  style: AppTypography.titleLarge,
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.base),
            // ── Description ─────────────────────────────────────────────
            Text(
              data.description,
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
            const SizedBox(height: AppSpacing.base),
            // ── CTA button ──────────────────────────────────────────────
            _RoleCTAButton(
              label: data.buttonLabel,
              route: data.route,
              style: data.buttonStyle,
            ),
          ],
        ),
      ),
    );
  }
}

// ── Private sub-widgets ───────────────────────────────────────────────────────

/// Circular icon avatar used inside each [RoleCard].
class _RoleIconAvatar extends StatelessWidget {
  const _RoleIconAvatar({
    required this.icon,
    required this.backgroundColor,
    required this.foregroundColor,
  });

  final IconData icon;
  final Color backgroundColor;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
      ),
      child: Icon(
        icon,
        size: AppSpacing.iconBase,
        color: foregroundColor,
      ),
    );
  }
}

/// CTA button inside a [RoleCard]. Supports both filled and outlined variants.
class _RoleCTAButton extends StatelessWidget {
  const _RoleCTAButton({
    required this.label,
    required this.route,
    required this.style,
  });

  final String label;
  final String route;
  final _RoleButtonStyle style;

  @override
  Widget build(BuildContext context) {
    final buttonChild = Text(
      label,
      style: AppTypography.labelLarge.copyWith(
        color: style == _RoleButtonStyle.filled
            ? AppColors.textOnPrimary
            : AppColors.primary,
      ),
    );

    final shape = RoundedRectangleBorder(
      borderRadius: AppRadius.circularFull,
    );

    if (style == _RoleButtonStyle.filled) {
      return FilledButton(
        onPressed: () => context.go(route),
        style: FilledButton.styleFrom(
          backgroundColor: AppColors.primary,
          minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
          shape: shape,
        ),
        child: buttonChild,
      );
    }

    return OutlinedButton(
      onPressed: () => context.go(route),
      style: OutlinedButton.styleFrom(
        foregroundColor: AppColors.primary,
        side: BorderSide(color: AppColors.primary),
        minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
        shape: shape,
      ),
      child: buttonChild,
    );
  }
}

// ── Exported convenience constants ────────────────────────────────────────────

/// Patient role card data — shared constant so [WelcomeScreen] stays readable.
const RoleCardData patientRoleCard = RoleCardData(
  title: 'Patient',
  icon: Icons.person_rounded,
  iconBackgroundColor: AppColors.primarySurface,
  iconForegroundColor: AppColors.primary,
  description:
      'Book laboratory tests, compare prices, track appointments and '
      'securely receive your results.',
  buttonLabel: 'Continue as Patient',
  route: '/login/patient',
  buttonStyle: _RoleButtonStyle.filled,
);

/// Doctor role card data — shared constant so [WelcomeScreen] stays readable.
const RoleCardData doctorRoleCard = RoleCardData(
  title: 'Doctor',
  icon: Icons.medical_services_rounded,
  iconBackgroundColor: AppColors.secondarySurface,
  iconForegroundColor: AppColors.secondary,
  description:
      'Recommend diagnostic tests, review patient laboratory reports and '
      'collaborate with laboratories.',
  buttonLabel: 'Continue as Doctor',
  route: '/login/doctor',
  buttonStyle: _RoleButtonStyle.outlined,
);
