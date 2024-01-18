import 'dart:async';
import 'package:bfsi/core/consts/storage_keys.dart';
import 'package:bfsi/infrastructure/storage/bfsi_key_value_store.dart';
import 'package:get_it/get_it.dart';

abstract class AuthRepository {
  FutureOr<bool?> hasCompletedLogin();

  FutureOr<void> completeLogin({bool isCompleteLogin = true});

  FutureOr<bool?> hasAdminLogin();

  FutureOr<void> completeAdminLogin({bool isAdminLogin = true});

  Future<String?> getToken();

  Future<String?> getRefreshToken();

  Future<void> saveToken(String token);

  Future<void> saveRefreshToken(String token);

  Future<void> saveUserModel(String userModel);

  Future<String?> getUserModel();

  Future<void> logoutUser();
}

class AuthRepositoryImpl extends AuthRepository {
  final _keyStore = GetIt.I<BfsiKeyValueStore>();

  @override
  FutureOr<bool?> hasCompletedLogin() =>
      _keyStore.read<bool>(StorageKeys.hasCompletedLogin, defaultValue: false);

  @override
  FutureOr<void> completeLogin({bool isCompleteLogin = true}) async {
    await _keyStore.write(StorageKeys.hasCompletedLogin, isCompleteLogin);
  }

  @override
  Future<void> logoutUser() async {
    await _keyStore.write(StorageKeys.hasCompletedLogin, false);
    await _keyStore.write(StorageKeys.hasAdminLogin, false);
    await _keyStore.write(StorageKeys.token, '');
    await _keyStore.write(StorageKeys.refreshToken, '');
    await _keyStore.write(StorageKeys.userModel, '');
  }

  @override
  Future<String?> getToken() async =>
      await _keyStore.read<String>(StorageKeys.token, defaultValue: '')
          as String;

  @override
  Future<void> saveToken(String token) async =>
      await _keyStore.write(StorageKeys.token, token);

  @override
  Future<void> saveUserModel(String userModel) async =>
      await _keyStore.write(StorageKeys.userModel, userModel);

  @override
  Future<String?> getUserModel() async =>
      await _keyStore.read<String>(StorageKeys.userModel, defaultValue: '');

  @override
  Future<void> saveRefreshToken(String token) async =>
      await _keyStore.write(StorageKeys.refreshToken, token);

  @override
  Future<String?> getRefreshToken() async =>
      await _keyStore.read<String>(StorageKeys.refreshToken, defaultValue: '')
          as String;

  @override
  FutureOr<bool?> hasAdminLogin() =>
      _keyStore.read<bool>(StorageKeys.hasAdminLogin, defaultValue: false);

  @override
  FutureOr<void> completeAdminLogin({bool isAdminLogin = true}) async {
    await _keyStore.write(StorageKeys.hasAdminLogin, isAdminLogin);
  }
}
