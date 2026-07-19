import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'app_button_styles.dart';
import 'app_colors.dart';
import 'app_spacing.dart';
import 'app_typography.dart';

/// Single source of truth for the application's Material 3 light theme.
abstract final class AppTheme {
  static ThemeData get light => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        fontFamily: AppTypography.fontFamily,
        colorScheme: _colorScheme,
        textTheme: AppTypography.textTheme,
        scaffoldBackgroundColor: AppColors.background,

        // ── AppBar ────────────────────────────────────────────────────────
        appBarTheme: AppBarTheme(
          backgroundColor: AppColors.surface,
          foregroundColor: AppColors.textPrimary,
          elevation: 0,
          scrolledUnderElevation: 1,
          shadowColor: AppColors.border,
          centerTitle: false,
          toolbarHeight: AppSpacing.appBarHeight,
          titleTextStyle: AppTypography.titleLarge,
          iconTheme: const IconThemeData(
            color: AppColors.textPrimary,
            size: AppSpacing.iconBase,
          ),
          actionsIconTheme: const IconThemeData(
            color: AppColors.textPrimary,
            size: AppSpacing.iconBase,
          ),
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark,
          ),
        ),

        // ── Card ──────────────────────────────────────────────────────────
        cardTheme: CardThemeData(
          color: AppColors.surface,
          surfaceTintColor: Colors.transparent,
          elevation: AppSpacing.cardElevation,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularBase,
            side: BorderSide(color: AppColors.border, width: 1),
          ),
        ),

        // ── Buttons ───────────────────────────────────────────────────────
        filledButtonTheme:
            FilledButtonThemeData(style: AppButtonStyles.filled),
        outlinedButtonTheme:
            OutlinedButtonThemeData(style: AppButtonStyles.outlined),
        textButtonTheme: TextButtonThemeData(style: AppButtonStyles.text),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            foregroundColor: AppColors.textOnPrimary,
            minimumSize:
                const Size(double.infinity, AppSpacing.buttonHeight),
            shape: const RoundedRectangleBorder(
              borderRadius: AppRadius.circularMd,
            ),
            textStyle: AppTypography.labelLarge,
            elevation: 2,
          ),
        ),
        iconButtonTheme: IconButtonThemeData(style: AppButtonStyles.icon),

        // ── Input / Form ──────────────────────────────────────────────────
        inputDecorationTheme: AppInputTheme.theme,

        // ── Divider ───────────────────────────────────────────────────────
        dividerTheme: const DividerThemeData(
          color: AppColors.divider,
          thickness: 1,
          space: 1,
        ),

        // ── Bottom navigation ─────────────────────────────────────────────
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.surface,
          selectedItemColor: AppColors.primary,
          unselectedItemColor: AppColors.grey400,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          type: BottomNavigationBarType.fixed,
          elevation: 8,
        ),

        // ── Navigation bar (M3) ───────────────────────────────────────────
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: AppColors.surface,
          indicatorColor: AppColors.primarySurface,
          iconTheme: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return const IconThemeData(color: AppColors.primary);
            }
            return const IconThemeData(color: AppColors.grey400);
          }),
          labelTextStyle: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppTypography.labelSmall
                  .copyWith(color: AppColors.primary);
            }
            return AppTypography.labelSmall
                .copyWith(color: AppColors.grey400);
          }),
          height: AppSpacing.bottomNavHeight,
        ),

        // ── Chip ──────────────────────────────────────────────────────────
        chipTheme: ChipThemeData(
          backgroundColor: AppColors.surfaceVariant,
          selectedColor: AppColors.primarySurface,
          labelStyle: AppTypography.labelMedium,
          side: const BorderSide(color: AppColors.border),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularFull,
          ),
          padding: AppSpacing.chipPadding,
        ),

        // ── Dialog ────────────────────────────────────────────────────────
        dialogTheme: const DialogThemeData(
          backgroundColor: AppColors.surface,
          surfaceTintColor: Colors.transparent,
          elevation: 8,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.circularLg,
          ),
          titleTextStyle: AppTypography.titleLarge,
          contentTextStyle: AppTypography.bodyMedium,
        ),

        // ── SnackBar ──────────────────────────────────────────────────────
        snackBarTheme: SnackBarThemeData(
          backgroundColor: AppColors.grey800,
          contentTextStyle: AppTypography.bodyMedium.copyWith(
            color: AppColors.white,
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularMd,
          ),
          behavior: SnackBarBehavior.floating,
        ),

        // ── Switch / Checkbox / Radio ─────────────────────────────────────
        switchTheme: SwitchThemeData(
          thumbColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.grey300;
          }),
          trackColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primarySurface;
            }
            return AppColors.grey200;
          }),
        ),
        checkboxTheme: CheckboxThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return Colors.transparent;
          }),
          checkColor: WidgetStateProperty.all(AppColors.white),
          shape: const RoundedRectangleBorder(
            borderRadius: AppRadius.circularXs,
          ),
          side: const BorderSide(color: AppColors.border, width: 1.5),
        ),
        radioTheme: RadioThemeData(
          fillColor: WidgetStateProperty.resolveWith((states) {
            if (states.contains(WidgetState.selected)) {
              return AppColors.primary;
            }
            return AppColors.grey400;
          }),
        ),

        // ── Tab bar ───────────────────────────────────────────────────────
        tabBarTheme: TabBarThemeData(
          labelColor: AppColors.primary,
          unselectedLabelColor: AppColors.grey500,
          labelStyle: AppTypography.labelLarge,
          unselectedLabelStyle: AppTypography.labelLarge,
          indicatorColor: AppColors.primary,
          indicatorSize: TabBarIndicatorSize.label,
          dividerColor: AppColors.border,
        ),

        // ── List tile ─────────────────────────────────────────────────────
        listTileTheme: const ListTileThemeData(
          contentPadding:
              EdgeInsets.symmetric(horizontal: AppSpacing.base),
          minLeadingWidth: 0,
          iconColor: AppColors.grey500,
          textColor: AppColors.textPrimary,
        ),

        // ── Progress indicator ────────────────────────────────────────────
        progressIndicatorTheme: const ProgressIndicatorThemeData(
          color: AppColors.primary,
          linearTrackColor: AppColors.primarySurface,
          circularTrackColor: AppColors.primarySurface,
        ),

        // ── Floating action button ────────────────────────────────────────
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: AppColors.primary,
          foregroundColor: AppColors.white,
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: AppRadius.circularBase,
          ),
        ),

        // ── Tooltip ───────────────────────────────────────────────────────
        tooltipTheme: TooltipThemeData(
          decoration: BoxDecoration(
            color: AppColors.grey800,
            borderRadius: AppRadius.circularSm,
          ),
          textStyle: AppTypography.bodySmall.copyWith(
            color: AppColors.white,
          ),
        ),
      );

  static const ColorScheme _colorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: AppColors.primary,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primarySurface,
    onPrimaryContainer: AppColors.primaryDark,
    secondary: AppColors.secondary,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.secondarySurface,
    onSecondaryContainer: AppColors.secondaryDark,
    tertiary: AppColors.patientAccent,
    onTertiary: AppColors.white,
    tertiaryContainer: Color(0xFFEEF2FF),
    onTertiaryContainer: Color(0xFF3730A3),
    error: AppColors.error,
    onError: AppColors.white,
    errorContainer: AppColors.errorSurface,
    onErrorContainer: Color(0xFF7F1D1D),
    surface: AppColors.surface,
    onSurface: AppColors.textPrimary,
    surfaceContainerHighest: AppColors.surfaceVariant,
    onSurfaceVariant: AppColors.textSecondary,
    outline: AppColors.border,
    outlineVariant: AppColors.grey200,
    shadow: Color(0x1A000000),
    scrim: Color(0x80000000),
    inverseSurface: AppColors.grey800,
    onInverseSurface: AppColors.white,
    inversePrimary: AppColors.primaryLight,
    surfaceTint: Colors.transparent,
  );
}
