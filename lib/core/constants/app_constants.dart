/// Application-wide string and environment constants.
abstract final class AppConstants {
  // ── App metadata ──────────────────────────────────────────────────────────
  static const String appName = 'MedLab Connect';
  static const String appVersion = '1.0.0';
  static const int appBuildNumber = 1;

  // ── API ───────────────────────────────────────────────────────────────────
  static const String baseUrl = 'https://api.medlabconnect.com/v1';
  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);
  static const Duration sendTimeout = Duration(seconds: 30);

  // ── Hive box names ────────────────────────────────────────────────────────
  static const String userBox = 'user_box';
  static const String settingsBox = 'settings_box';
  static const String cacheBox = 'cache_box';

  // ── Secure storage keys ───────────────────────────────────────────────────
  static const String accessTokenKey = 'access_token';
  static const String refreshTokenKey = 'refresh_token';
  static const String userIdKey = 'user_id';
  static const String userRoleKey = 'user_role';

  // ── Shared preferences / settings keys ───────────────────────────────────
  static const String onboardingCompletedKey = 'onboarding_completed';
  static const String themePreferenceKey = 'theme_preference';
  static const String localePreferenceKey = 'locale_preference';

  // ── Pagination ────────────────────────────────────────────────────────────
  static const int defaultPageSize = 20;
  static const int maxPageSize = 100;

  // ── Cache TTL ─────────────────────────────────────────────────────────────
  static const Duration shortCacheTtl = Duration(minutes: 5);
  static const Duration mediumCacheTtl = Duration(hours: 1);
  static const Duration longCacheTtl = Duration(hours: 24);

  // ── Validation ────────────────────────────────────────────────────────────
  static const int minPasswordLength = 8;
  static const int maxPasswordLength = 128;
  static const int otpLength = 6;
  static const int phoneNumberLength = 11;

  // ── Animation durations ───────────────────────────────────────────────────
  static const Duration animFast = Duration(milliseconds: 150);
  static const Duration animMedium = Duration(milliseconds: 300);
  static const Duration animSlow = Duration(milliseconds: 500);

  // ── Regex patterns ────────────────────────────────────────────────────────
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+\-]+@[a-zA-Z0-9.\-]+\.[a-zA-Z]{2,}$';
  static const String phonePattern = r'^\+?[0-9]{7,15}$';
  static const String passwordPattern =
      r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&]).{8,}$';
}
