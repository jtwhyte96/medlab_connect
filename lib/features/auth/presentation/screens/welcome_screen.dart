import 'package:flutter/material.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

import '../widgets/hero_placeholder.dart';
import '../widgets/logo_placeholder.dart';
import '../widgets/role_card.dart';
import '../widgets/section_title.dart';

/// Welcome & Role Selection screen — Screen 001 of MedLab Connect.
///
/// This is the first screen a new user sees after the splash screen.
/// It presents the brand identity, a hero illustration, a short welcome
/// message, and two role cards (Patient / Doctor) so the user can choose
/// their login path.
///
/// **Navigation**: Both role cards navigate via [GoRouter]; no auth logic
/// is performed here.
///
/// **Responsive behaviour**:
/// - Mobile (< 600 dp): single-column, full-width content
/// - Tablet / Desktop (≥ 600 dp): content constrained to [_kMaxContentWidth]
///   and centred, matching the Stitch `max-w-md` breakpoint behaviour.
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  // Maximum content column width for wide screens (matches Stitch max-w-md).
  static const double _kMaxContentWidth = 480.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _kMaxContentWidth),
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(
                horizontal: AppSpacing.base,
                vertical: AppSpacing.xl2,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Top: Logo ─────────────────────────────────────────
                  const LogoPlaceholder(),

                  const SizedBox(height: AppSpacing.xl2),

                  // ── Hero: Illustration + welcome text ─────────────────
                  _HeroSection(),

                  const SizedBox(height: AppSpacing.xl2),

                  // ── Role cards ────────────────────────────────────────
                  const RoleCard(data: patientRoleCard),

                  const SizedBox(height: AppSpacing.base),

                  const RoleCard(data: doctorRoleCard),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Footer ────────────────────────────────────────────
                  const _FooterSection(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ── Private section widgets ───────────────────────────────────────────────────

/// Hero illustration + welcome heading + supporting text, centred.
///
/// Corresponds to the Stitch `<section>` block containing the image and
/// the `<h2>` / body-md copy block.
class _HeroSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HeroPlaceholder(),

        const SizedBox(height: AppSpacing.xl),

        const Padding(
          padding: EdgeInsets.symmetric(horizontal: AppSpacing.md),
          child: SectionTitle(
            title: 'Welcome to MedLab Connect',
            subtitle:
                'Connect with trusted laboratories, book diagnostic tests, '
                'track appointments and securely receive your laboratory results.',
          ),
        ),
      ],
    );
  }
}

/// Footer area: "Learn More" text button + version string.
///
/// Matches the Stitch `<footer>` element.
class _FooterSection extends StatelessWidget {
  const _FooterSection();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextButton(
          onPressed: () {
            // TODO(welcome): Wire up Learn More destination when available.
          },
          child: Text(
            'Learn More',
            style: AppTypography.labelLarge.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
        const SizedBox(height: AppSpacing.xs),
        Text(
          'Version ${AppConstants.appVersion}',
          style: AppTypography.labelSmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
