import 'package:flutter/material.dart';

/// MedLab Connect – curated healthcare color palette.
/// All colours are defined here and nowhere else.
abstract final class AppColors {
  // ── Primary ──────────────────────────────────────────────────────────────
  static const Color primary = Color(0xFF0A6EBD);
  static const Color primaryLight = Color(0xFF3D8FD1);
  static const Color primaryDark = Color(0xFF004F8C);
  static const Color primarySurface = Color(0xFFE8F3FB);

  // ── Secondary / Teal accent ───────────────────────────────────────────────
  static const Color secondary = Color(0xFF00A896);
  static const Color secondaryLight = Color(0xFF33C4B5);
  static const Color secondaryDark = Color(0xFF007A6D);
  static const Color secondarySurface = Color(0xFFE0F7F5);

  // ── Semantic ──────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF2E9E6B);
  static const Color successSurface = Color(0xFFE4F5EE);

  static const Color warning = Color(0xFFF5A623);
  static const Color warningSurface = Color(0xFFFEF4E3);

  static const Color error = Color(0xFFD94F4F);
  static const Color errorSurface = Color(0xFFFCECEC);

  static const Color info = Color(0xFF3B82F6);
  static const Color infoSurface = Color(0xFFEFF6FF);

  // ── Neutrals ──────────────────────────────────────────────────────────────
  static const Color white = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF7F9FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF0F4F8);

  static const Color grey50 = Color(0xFFF8FAFC);
  static const Color grey100 = Color(0xFFF1F5F9);
  static const Color grey200 = Color(0xFFE2E8F0);
  static const Color grey300 = Color(0xFFCBD5E1);
  static const Color grey400 = Color(0xFF94A3B8);
  static const Color grey500 = Color(0xFF64748B);
  static const Color grey600 = Color(0xFF475569);
  static const Color grey700 = Color(0xFF334155);
  static const Color grey800 = Color(0xFF1E293B);
  static const Color grey900 = Color(0xFF0F172A);

  // ── Text ──────────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF0F172A);
  static const Color textSecondary = Color(0xFF475569);
  static const Color textTertiary = Color(0xFF94A3B8);
  static const Color textDisabled = Color(0xFFCBD5E1);
  static const Color textOnPrimary = Color(0xFFFFFFFF);

  // ── Border ────────────────────────────────────────────────────────────────
  static const Color border = Color(0xFFE2E8F0);
  static const Color borderFocus = Color(0xFF0A6EBD);
  static const Color borderError = Color(0xFFD94F4F);

  // ── Divider ───────────────────────────────────────────────────────────────
  static const Color divider = Color(0xFFF1F5F9);

  // ── Role-specific tints ───────────────────────────────────────────────────
  static const Color patientAccent = Color(0xFF6366F1);   // Indigo
  static const Color doctorAccent = Color(0xFF0A6EBD);    // Primary blue
  static const Color adminAccent = Color(0xFF8B5CF6);     // Violet
  static const Color labAccent = Color(0xFF00A896);       // Teal
}
