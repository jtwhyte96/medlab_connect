import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Provides a singleton [FlutterSecureStorage] instance with sane defaults.
final secureStorageProvider = Provider<FlutterSecureStorage>((ref) {
  const androidOptions = AndroidOptions.defaultOptions;
  const iosOptions = IOSOptions(
    accessibility: KeychainAccessibility.first_unlock_this_device,
  );

  return const FlutterSecureStorage(
    aOptions: androidOptions,
    iOptions: iosOptions,
  );
});

/// Typed facade for reading / writing secure credentials.
///
/// Prefer calling this service over using [FlutterSecureStorage] directly so
/// all key access is centralised and unit-testable.
class SecureStorageService {
  SecureStorageService(this._storage);

  final FlutterSecureStorage _storage;

  Future<void> write({
    required String key,
    required String value,
  }) =>
      _storage.write(key: key, value: value);

  Future<String?> read({required String key}) => _storage.read(key: key);

  Future<void> delete({required String key}) => _storage.delete(key: key);

  Future<void> deleteAll() => _storage.deleteAll();

  Future<bool> containsKey({required String key}) =>
      _storage.containsKey(key: key);
}

/// Riverpod provider for [SecureStorageService].
final secureStorageServiceProvider = Provider<SecureStorageService>((ref) {
  final storage = ref.watch(secureStorageProvider);
  return SecureStorageService(storage);
});
