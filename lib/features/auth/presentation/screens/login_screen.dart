import 'package:flutter/material.dart';
import 'package:medlab_connect/core/theme/theme.dart';

/// Minimal login screen — entry point for authentication flow.
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: AppSpacing.pagePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: AppSpacing.xl4),
              // ── Brand mark ───────────────────────────────────────────────
              Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary,
                      borderRadius: AppRadius.circularMd,
                    ),
                    child: const Icon(
                      Icons.medical_services_rounded,
                      color: AppColors.white,
                      size: AppSpacing.iconXl,
                    ),
                  ),
                  const SizedBox(width: AppSpacing.md),
                  Text(
                    'MedLab Connect',
                    style: AppTypography.titleLarge,
                  ),
                ],
              ),
              const SizedBox(height: AppSpacing.xl4),
              // ── Headline ─────────────────────────────────────────────────
              Text('Welcome back', style: AppTypography.headlineSmall),
              const SizedBox(height: AppSpacing.xs),
              Text(
                'Sign in to your account to continue',
                style: AppTypography.bodyMedium.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: AppSpacing.xl2),
              // ── Email field ───────────────────────────────────────────────
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: 'Email address',
                  prefixIcon: Icon(Icons.email_outlined),
                ),
              ),
              const SizedBox(height: AppSpacing.base),
              // ── Password field ────────────────────────────────────────────
              TextFormField(
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  prefixIcon: Icon(Icons.lock_outline_rounded),
                  suffixIcon: Icon(Icons.visibility_off_outlined),
                ),
              ),
              const SizedBox(height: AppSpacing.sm),
              // ── Forgot password ───────────────────────────────────────────
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Forgot password?'),
                ),
              ),
              const SizedBox(height: AppSpacing.xl),
              // ── Sign in button ────────────────────────────────────────────
              FilledButton(
                onPressed: () {},
                child: const Text('Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
