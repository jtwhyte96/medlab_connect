/// Named route path constants — single source of truth for GoRouter paths.
abstract final class AppRoutes {
  // ── Root / Shell ──────────────────────────────────────────────────────────
  static const String root = '/';
  static const String splash = '/splash';
  static const String welcome = '/welcome';
  static const String onboarding = '/onboarding';

  // ── Auth ──────────────────────────────────────────────────────────────────
  static const String login = '/auth/login';
  static const String loginPatient = '/login/patient';
  static const String loginDoctor = '/login/doctor';
  static const String register = '/auth/register';
  static const String registerPatient = '/register/patient';
  static const String registerDoctor = '/register/doctor';
  static const String forgotPassword = '/auth/forgot-password';
  static const String resetPassword = '/auth/reset-password';
  static const String verifyOtp = '/auth/verify-otp';

  // ── Patient ───────────────────────────────────────────────────────────────
  static const String patientHome = '/patient';
  static const String patientProfile = '/patient/profile';
  static const String patientResults = '/patient/results';
  static const String patientResultDetail = '/patient/results/:id';
  static const String patientAppointments = '/patient/appointments';
  static const String patientScan = '/patient/scan';

  // ── Doctor ────────────────────────────────────────────────────────────────
  static const String doctorHome = '/doctor';
  static const String doctorProfile = '/doctor/profile';
  static const String doctorPatients = '/doctor/patients';
  static const String doctorPatientDetail = '/doctor/patients/:id';
  static const String doctorOrders = '/doctor/orders';
  static const String doctorOrderDetail = '/doctor/orders/:id';

  // ── Laboratory ────────────────────────────────────────────────────────────
  static const String laboratoryHome = '/laboratory';
  static const String laboratoryTests = '/laboratory/tests';
  static const String laboratoryTestDetail = '/laboratory/tests/:id';
  static const String laboratoryResults = '/laboratory/results';
  static const String laboratoryResultDetail = '/laboratory/results/:id';
  static const String laboratoryOrders = '/laboratory/orders';

  // ── Admin ─────────────────────────────────────────────────────────────────
  static const String adminHome = '/admin';
  static const String adminUsers = '/admin/users';
  static const String adminUserDetail = '/admin/users/:id';
  static const String adminSettings = '/admin/settings';
  static const String adminReports = '/admin/reports';

  // ── Shared / Common ───────────────────────────────────────────────────────
  static const String notifications = '/notifications';
  static const String settings = '/settings';
  static const String error = '/error';

  // ── Patient Dashboard Shortcuts ──────────────────────────────────────────
  static const String profilePatient = '/profile/patient';
  static const String search = '/search';
  static const String bookTest = '/book-test';
  static const String laboratories = '/laboratories';
  static const String results = '/results';
  static const String appointments = '/appointments';
  static const String appointmentDetails = '/appointments/details';
  static const String resultDetails = '/results/details';
  static const String laboratoryDetails = '/laboratory/details';
  static const String booking = '/booking';
}
