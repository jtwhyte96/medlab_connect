import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'core/services/hive_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // ── System UI ────────────────────────────────────────────────────────────
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );

  // ── Storage initialisation ────────────────────────────────────────────────
  await HiveService.init();

  // ── Launch ────────────────────────────────────────────────────────────────
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
