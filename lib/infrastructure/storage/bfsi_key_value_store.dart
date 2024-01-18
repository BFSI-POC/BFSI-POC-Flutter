import 'dart:async';

/// Interface to hide away implementation between various key/value
/// storage options, such as FlutterSecureStorage, Hive, SharedPrefs.
abstract class BfsiKeyValueStore {
  const BfsiKeyValueStore();

  /// Insert a key/value pair.
  ///
  /// Allows for a dynamic value as various storage options
  /// are able to store String data types.
  FutureOr<void> write(String key, dynamic value);

  /// Return the value for the given `key`.
  ///
  /// If value doesn't exist, optionally return the given `defaultValue` of `<T>`.
  FutureOr<T?> read<T>(String key, {T? defaultValue});

  /// Delete a key/value pair.
  FutureOr<void> delete(String key);

  /// Delete all key/value pairs
  void deleteAll();
}
