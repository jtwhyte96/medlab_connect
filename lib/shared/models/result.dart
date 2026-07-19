/// Represents the outcome of a use-case or repository call.
///
/// Inspired by the functional Either type — avoids throwing exceptions
/// across layers and keeps error handling explicit.
sealed class Result<T> {
  const Result();

  /// Creates a successful result containing [data].
  const factory Result.success(T data) = Success<T>;

  /// Creates a failure result containing an [AppError].
  const factory Result.failure(AppError error) = Failure<T>;

  /// Returns [true] if this is a [Success].
  bool get isSuccess => this is Success<T>;

  /// Returns [true] if this is a [Failure].
  bool get isFailure => this is Failure<T>;

  /// Executes [onSuccess] or [onFailure] and returns their result.
  R when<R>({
    required R Function(T data) onSuccess,
    required R Function(AppError error) onFailure,
  }) {
    return switch (this) {
      Success<T>(:final data) => onSuccess(data),
      Failure<T>(:final error) => onFailure(error),
    };
  }

  /// Maps the success value, leaving failures unchanged.
  Result<R> map<R>(R Function(T data) transform) {
    return switch (this) {
      Success<T>(:final data) => Result.success(transform(data)),
      Failure<T>(:final error) => Result.failure(error),
    };
  }
}

/// Successful result.
final class Success<T> extends Result<T> {
  final T data;
  const Success(this.data);
}

/// Failed result.
final class Failure<T> extends Result<T> {
  final AppError error;
  const Failure(this.error);
}

// ── AppError types ─────────────────────────────────────────────────────────

/// Base class for all typed application errors.
sealed class AppError {
  final String message;
  final String? code;

  const AppError({required this.message, this.code});

  @override
  String toString() => 'AppError($code): $message';
}

/// HTTP / network-level errors.
final class NetworkError extends AppError {
  final int? statusCode;

  const NetworkError({
    required super.message,
    super.code,
    this.statusCode,
  });
}

/// Application-level validation errors.
final class ValidationError extends AppError {
  final Map<String, List<String>>? fieldErrors;

  const ValidationError({
    required super.message,
    super.code,
    this.fieldErrors,
  });
}

/// Authentication / authorisation errors.
final class AuthError extends AppError {
  const AuthError({required super.message, super.code});
}

/// Local storage errors (Hive / SecureStorage).
final class StorageError extends AppError {
  const StorageError({required super.message, super.code});
}

/// Catch-all for unknown errors.
final class UnknownError extends AppError {
  final Object? originalError;

  const UnknownError({
    required super.message,
    super.code,
    this.originalError,
  });
}
