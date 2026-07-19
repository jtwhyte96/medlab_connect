import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

import '../widgets/auth_divider.dart';
import '../widgets/auth_text_field.dart';

/// Screen 002B — Doctor Login (Mobile / Responsive).
///
/// Faithfully implements the Stitch "Doctor Login - Mobile" design:
///
/// • Sticky top-app-bar with back arrow, logo icon, and centered wordmark
/// • Heading "Welcome Back, Doctor" + supporting description
/// • Login card: Email field (with badge icon), Password field (with visibility toggle),
///   Forgot Password link, "Sign In as Doctor" button with trailing login icon
/// • OR divider
/// • "Create Doctor Account" outlined button (using secondary color styling)
/// • Footer support text with a help icon
///
/// **Navigation** (GoRouter, no auth logic):
/// - Back button → `context.pop()`
/// - Sign In → [AppRoutes.doctorHome]
/// - Create Doctor Account → [AppRoutes.registerDoctor]
/// - Forgot Password → [AppRoutes.forgotPassword]
///
/// Responsive: content is centred and constrained to 480 dp on wide screens.
class DoctorLoginScreen extends StatefulWidget {
  const DoctorLoginScreen({super.key});

  @override
  State<DoctorLoginScreen> createState() => _DoctorLoginScreenState();
}

class _DoctorLoginScreenState extends State<DoctorLoginScreen> {
  bool _obscurePassword = true;

  void _togglePasswordVisibility() {
    setState(() => _obscurePassword = !_obscurePassword);
  }

  static const double _kMaxContentWidth = 480.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      // ── Sticky top app bar ──────────────────────────────────────────────
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_rounded),
          color: AppColors.textSecondary,
          onPressed: () => context.pop(),
          tooltip: 'Back',
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.medical_services_rounded,
              size: AppSpacing.iconBase,
              color: AppColors.primary,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'MedLab Connect',
              style: AppTypography.titleLarge.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        centerTitle: true,
        // Invisible trailing spacer to balance the back button
        actions: [const SizedBox(width: 48)],
      ),
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: _kMaxContentWidth),
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.base,
                vertical: AppSpacing.xl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Header text ─────────────────────────────────────
                  _HeaderText(),

                  const SizedBox(height: AppSpacing.xl2),

                  // ── Login card ──────────────────────────────────────
                  _LoginCard(
                    obscurePassword: _obscurePassword,
                    onTogglePasswordVisibility: _togglePasswordVisibility,
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  // ── OR divider ──────────────────────────────────────
                  const AuthDivider(),

                  const SizedBox(height: AppSpacing.xl),

                  // ── Create account button ───────────────────────────
                  OutlinedButton(
                    onPressed: () => context.push(AppRoutes.registerDoctor),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.secondary,
                      side: const BorderSide(color: AppColors.secondary),
                      minimumSize:
                          const Size.fromHeight(AppSpacing.buttonHeight),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.circularFull,
                      ),
                    ),
                    child: Text(
                      'Create Doctor Account',
                      style: AppTypography.labelLarge.copyWith(
                        color: AppColors.secondary,
                      ),
                    ),
                  ),

                  const SizedBox(height: AppSpacing.xl2),

                  // ── Footer support text ─────────────────────────────
                  const _FooterText(),
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

/// "Welcome Back, Doctor" heading + supporting description.
class _HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back, Doctor',
          style: AppTypography.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
          child: Text(
            'Sign in to access your patients, laboratory requests, '
            'diagnostic reports and clinical tools.',
            style: AppTypography.bodyMedium.copyWith(
              color: AppColors.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

/// Login card — email, password, forgot-password link, sign-in button.
class _LoginCard extends StatelessWidget {
  const _LoginCard({
    required this.obscurePassword,
    required this.onTogglePasswordVisibility,
  });

  final bool obscurePassword;
  final VoidCallback onTogglePasswordVisibility;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shadowColor: Colors.black.withValues(alpha: 0.12),
      shape: RoundedRectangleBorder(
        borderRadius: AppRadius.circularBase,
        side: BorderSide(color: AppColors.divider),
      ),
      color: AppColors.surface,
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.xl),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // ── Email field ───────────────────────────────────────────
            const AuthTextField(
              label: 'Doctor Email Address',
              prefixIcon: Icons.badge_outlined,
              hint: 'doctor@example.com',
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(height: AppSpacing.base),

            // ── Password field ────────────────────────────────────────
            AuthTextField(
              label: 'Password',
              prefixIcon: Icons.lock_outline_rounded,
              hint: '••••••••',
              obscureText: obscurePassword,
              suffixIcon: IconButton(
                icon: Icon(
                  obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: AppColors.grey500,
                  size: AppSpacing.iconBase,
                ),
                onPressed: onTogglePasswordVisibility,
                tooltip: obscurePassword ? 'Show password' : 'Hide password',
              ),
            ),

            // ── Forgot password link ──────────────────────────────────
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () => context.push(AppRoutes.forgotPassword),
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.primary,
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: Text(
                  'Forgot Password?',
                  style: AppTypography.labelLarge.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ),

            const SizedBox(height: AppSpacing.base),

            // ── Sign In button ────────────────────────────────────────
            FilledButton.icon(
              onPressed: () => context.push(AppRoutes.doctorHome),
              iconAlignment: IconAlignment.end,
              icon: const Icon(
                Icons.login_rounded,
                size: 20,
              ),
              label: Text(
                'Sign In as Doctor',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.textOnPrimary,
                ),
              ),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textOnPrimary,
                minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.circularFull,
                ),
                elevation: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// "Need help? Contact Support" footer text.
class _FooterText extends StatelessWidget {
  const _FooterText();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // TODO(support): Contact Support action
        },
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.help_outline_rounded,
              size: 18,
              color: AppColors.textSecondary,
            ),
            const SizedBox(width: AppSpacing.xs),
            Text(
              'Need help? Contact Support',
              style: AppTypography.bodyMedium.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
