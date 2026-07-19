import 'package:hive_flutter/hive_flutter.dart';

/// Centralises Hive initialisation and box access.
///
/// Call [HiveService.init] from [main] before [runApp].
class HiveService {
  HiveService._();

  /// Open all Hive boxes required at startup.
  ///
  /// Add any additional type adapters here before [Hive.openBox] calls.
  static Future<void> init() async {
    await Hive.initFlutter();

    // Register type adapters here as features are developed:
    // Hive.registerAdapter(UserModelAdapter());

    await Future.wait([
      Hive.openBox<dynamic>(_userBox),
      Hive.openBox<dynamic>(_settingsBox),
      Hive.openBox<dynamic>(_cacheBox),
    ]);
  }

  // ── Box name constants ─────────────────────────────────────────────────────
  static const String _userBox = 'user_box';
  static const String _settingsBox = 'settings_box';
  static const String _cacheBox = 'cache_box';

  // ── Box accessors ──────────────────────────────────────────────────────────
  static Box<dynamic> get userBox => Hive.box(_userBox);
  static Box<dynamic> get settingsBox => Hive.box(_settingsBox);
  static Box<dynamic> get cacheBox => Hive.box(_cacheBox);
}
