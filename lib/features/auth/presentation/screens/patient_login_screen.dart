import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:medlab_connect/core/constants/constants.dart';
import 'package:medlab_connect/core/theme/theme.dart';

import '../widgets/auth_divider.dart';
import '../widgets/auth_text_field.dart';

/// Screen 002 — Patient Login (Mobile).
///
/// Faithfully implements the Stitch "Patient Login - Mobile" design:
///
/// • Sticky top-app-bar with back arrow + centred wordmark
/// • Heading "Welcome Back" + supporting description
/// • Login card: Email field, Password field (with visibility toggle),
///   Forgot Password link, Sign In button
/// • OR divider
/// • "Create Patient Account" outlined button
/// • Footer support text
///
/// **Navigation** (GoRouter, no auth logic):
/// - Back button → `context.pop()`
/// - Sign In → [AppRoutes.patientHome]
/// - Create Patient Account → [AppRoutes.registerPatient]
/// - Forgot Password → [AppRoutes.forgotPassword]
///
/// Responsive: content is centred and constrained to 480 dp on wide screens.
class PatientLoginScreen extends StatefulWidget {
  const PatientLoginScreen({super.key});

  @override
  State<PatientLoginScreen> createState() => _PatientLoginScreenState();
}

class _PatientLoginScreenState extends State<PatientLoginScreen> {
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
          color: AppColors.primary,
          onPressed: () => context.pop(),
          tooltip: 'Back',
        ),
        title: Text(
          'MedLab Connect',
          style: AppTypography.headlineMedium.copyWith(
            color: AppColors.primary,
            fontWeight: FontWeight.w700,
          ),
        ),
        centerTitle: true,
        // Invisible trailing spacer mirrors the Stitch `w-10 h-10` spacer
        // so the title stays optically centred.
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
                    onPressed: () => context.go(AppRoutes.registerPatient),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: AppColors.textPrimary,
                      side: BorderSide(color: AppColors.border),
                      minimumSize:
                          const Size.fromHeight(AppSpacing.buttonHeight),
                      shape: RoundedRectangleBorder(
                        borderRadius: AppRadius.circularFull,
                      ),
                    ),
                    child: Text(
                      'Create Patient Account',
                      style: AppTypography.labelLarge,
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

/// "Welcome Back" heading + supporting description.
class _HeaderText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Welcome Back',
          style: AppTypography.headlineMedium,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppSpacing.sm),
        Text(
          'Sign in to securely access your laboratory tests, '
          'appointments and medical records.',
          style: AppTypography.bodyMedium.copyWith(
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

/// Login card — email, password, forgot-password link, sign-in button.
///
/// Accepts [obscurePassword] and [onTogglePasswordVisibility] from the
/// parent [_PatientLoginScreenState] to manage password visibility state
/// while keeping this widget itself stateless.
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
        borderRadius: AppRadius.circularMd,
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
              label: 'Email Address',
              prefixIcon: Icons.mail_outline_rounded,
              hint: 'patient@example.com',
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
                onPressed: () => context.go(AppRoutes.forgotPassword),
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
            FilledButton(
              onPressed: () => context.go(AppRoutes.patientHome),
              style: FilledButton.styleFrom(
                backgroundColor: AppColors.primary,
                foregroundColor: AppColors.textOnPrimary,
                minimumSize: const Size.fromHeight(AppSpacing.buttonHeight),
                shape: RoundedRectangleBorder(
                  borderRadius: AppRadius.circularFull,
                ),
                elevation: 2,
              ),
              child: Text(
                'Sign In',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.textOnPrimary,
                ),
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
    return Text.rich(
      TextSpan(
        text: 'Need help? ',
        style: AppTypography.bodyMedium.copyWith(
          color: AppColors.textSecondary,
        ),
        children: [
          WidgetSpan(
            alignment: PlaceholderAlignment.middle,
            child: GestureDetector(
              onTap: () {
                // TODO(support): Navigate to support screen when available.
              },
              child: Text(
                'Contact Support',
                style: AppTypography.labelLarge.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ),
          ),
        ],
      ),
      textAlign: TextAlign.center,
    );
  }
}
