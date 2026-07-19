import 'package:flutter/material.dart';

/// Spacing tokens — all layout spacing should use these values.
abstract final class AppSpacing {
  static const double xs2 = 2.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double base = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xl2 = 32.0;
  static const double xl3 = 40.0;
  static const double xl4 = 48.0;
  static const double xl5 = 56.0;
  static const double xl6 = 64.0;
  static const double xl7 = 80.0;
  static const double xl8 = 96.0;

  // ── Padding helpers ───────────────────────────────────────────────────────
  static const EdgeInsets pagePadding =
      EdgeInsets.symmetric(horizontal: base, vertical: xl);

  static const EdgeInsets cardPadding = EdgeInsets.all(base);

  static const EdgeInsets inputPadding =
      EdgeInsets.symmetric(horizontal: base, vertical: md);

  static const EdgeInsets buttonPadding =
      EdgeInsets.symmetric(horizontal: xl2, vertical: md);

  static const EdgeInsets chipPadding =
      EdgeInsets.symmetric(horizontal: md, vertical: xs);

  // ── Icon sizes ────────────────────────────────────────────────────────────
  static const double iconXs = 12.0;
  static const double iconSm = 16.0;
  static const double iconMd = 20.0;
  static const double iconBase = 24.0;
  static const double iconLg = 28.0;
  static const double iconXl = 32.0;
  static const double iconXl2 = 40.0;

  // ── Component heights ─────────────────────────────────────────────────────
  static const double buttonHeight = 52.0;
  static const double inputHeight = 52.0;
  static const double appBarHeight = 64.0;
  static const double bottomNavHeight = 72.0;
  static const double cardElevation = 0.0;
  static const double dialogMaxWidth = 480.0;
  static const double snackBarMaxWidth = 600.0;
}

/// Border radius tokens.
abstract final class AppRadius {
  static const double none = 0.0;
  static const double xs = 4.0;
  static const double sm = 8.0;
  static const double md = 12.0;
  static const double base = 16.0;
  static const double lg = 20.0;
  static const double xl = 24.0;
  static const double xl2 = 32.0;
  static const double full = 9999.0;

  // ── BorderRadius shorthands ───────────────────────────────────────────────
  static const BorderRadius circularXs = BorderRadius.all(Radius.circular(xs));
  static const BorderRadius circularSm = BorderRadius.all(Radius.circular(sm));
  static const BorderRadius circularMd = BorderRadius.all(Radius.circular(md));
  static const BorderRadius circularBase =
      BorderRadius.all(Radius.circular(base));
  static const BorderRadius circularLg = BorderRadius.all(Radius.circular(lg));
  static const BorderRadius circularXl = BorderRadius.all(Radius.circular(xl));
  static const BorderRadius circularFull =
      BorderRadius.all(Radius.circular(full));

  // ── Convenient RadiusObjects ───────────────────────────────────────────────
  static const Radius radiusSm = Radius.circular(sm);
  static const Radius radiusMd = Radius.circular(md);
  static const Radius radiusBase = Radius.circular(base);
  static const Radius radiusLg = Radius.circular(lg);
}
