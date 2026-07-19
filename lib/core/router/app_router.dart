import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../features/admin/presentation/screens/admin_home_screen.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/doctor_login_screen.dart';
import '../../features/auth/presentation/screens/patient_login_screen.dart';
import '../../features/auth/presentation/screens/welcome_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/doctor/presentation/screens/doctor_home_screen.dart';
import '../../features/laboratory/presentation/screens/laboratory_home_screen.dart';
import '../../features/patient/presentation/screens/patient_dashboard_screen.dart';
import '../../features/patient/presentation/screens/search_laboratories_screen.dart';
import '../../features/patient/presentation/screens/patient_home_screen.dart';
import '../../shared/widgets/error_screen.dart';
import '../constants/constants.dart';

/// Riverpod provider that exposes the singleton [GoRouter] instance.
///
/// Replace [_redirect] implementation with actual auth-state logic once the
/// auth feature is built.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: AppRoutes.welcome,
    debugLogDiagnostics: true,
    errorBuilder: (context, state) => ErrorScreen(error: state.error),
    redirect: _redirect,
    routes: _routes,
  );
});

/// Global redirect guard — expanded with auth state watching in future.
String? _redirect(BuildContext context, GoRouterState state) {
  // TODO: Inject auth notifier and redirect to login when unauthenticated.
  return null;
}

/// Complete route tree for the application.
final List<RouteBase> _routes = [
  // ── Splash ────────────────────────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.splash,
    name: 'splash',
    builder: (context, state) => const SplashScreen(),
  ),

  // ── Welcome / Role Selection ─────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.welcome,
    name: 'welcome',
    builder: (context, state) => const WelcomeScreen(),
  ),

  // ── Auth ──────────────────────────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.login,
    name: 'login',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.loginPatient,
    name: 'loginPatient',
    builder: (context, state) => const PatientLoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.loginDoctor,
    name: 'loginDoctor',
    builder: (context, state) => const DoctorLoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.registerPatient,
    name: 'registerPatient',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.registerDoctor,
    name: 'registerDoctor',
    builder: (context, state) => const LoginScreen(),
  ),

  // ── Patient shell ──────────────────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.patientHome,
    name: 'patientHome',
    builder: (context, state) => const PatientDashboardScreen(),
  ),
  GoRoute(
    path: AppRoutes.profilePatient,
    name: 'profilePatient',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.search,
    name: 'search',
    builder: (context, state) => const SearchLaboratoriesScreen(),
  ),
  GoRoute(
    path: AppRoutes.booking,
    name: 'booking',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.bookTest,
    name: 'bookTest',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.laboratories,
    name: 'laboratories',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.results,
    name: 'results',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.appointments,
    name: 'appointments',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.appointmentDetails,
    name: 'appointmentDetails',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.resultDetails,
    name: 'resultDetails',
    builder: (context, state) => const LoginScreen(),
  ),
  GoRoute(
    path: AppRoutes.laboratoryDetails,
    name: 'laboratoryDetails',
    builder: (context, state) => const LoginScreen(),
  ),

  // ── Doctor shell ───────────────────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.doctorHome,
    name: 'doctorHome',
    builder: (context, state) => const DoctorHomeScreen(),
  ),

  // ── Laboratory shell ──────────────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.laboratoryHome,
    name: 'laboratoryHome',
    builder: (context, state) => const LaboratoryHomeScreen(),
  ),

  // ── Admin shell ────────────────────────────────────────────────────────────
  GoRoute(
    path: AppRoutes.adminHome,
    name: 'adminHome',
    builder: (context, state) => const AdminHomeScreen(),
  ),
];
