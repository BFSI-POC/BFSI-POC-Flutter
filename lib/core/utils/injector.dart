import 'dart:async';
import 'package:bfsi/core/enums/env.dart';
import 'package:bfsi/core/utils/app_config.dart';
import 'package:bfsi/domain/repositories/auth/auth_repository.dart';
import 'package:bfsi/infrastructure/network/bfsi_api_client.dart';
import 'package:bfsi/infrastructure/storage/bfsi_key_value_store.dart';
import 'package:bfsi/infrastructure/storage/bfsi_key_value_store_impl.dart';
import 'package:dio/dio.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

typedef AppRunner = FutureOr<void> Function();

class Injector {
  /// Initialises all app dependencies.
  /// that any potential errors can be caught as early as possible.
  ///
  /// [AppRunner] is called when everything is ready, at which point is when `runApp()`
  /// should be invoked.
  static Future<void> init({
    required AppRunner appRunner,
    Environment env = Environment.prod,
  }) async {
    if (env == Environment.dev) {
      Fimber.plantTree(DebugTree(useColors: true));
    }

    final appConfig = AppConfig.init(env: env);

    await _initDependencies(appConfig: appConfig);
    appRunner();
  }

  /// Initialises all [GetIt] dependencies.
  ///
  /// Dependencies must be registered in the order that they're required by other dependencies,
  /// eg:
  /// ```markdown
  /// `AppDatabase` -> `Dao` -> `Repository`
  /// ```
  static Future<void> _initDependencies({
    required AppConfig appConfig,
  }) async {
    await _injectUtils(appConfig);
    _injectRepositories();
    await _injectServices(appConfig);
    _injectApi();
    await GetIt.I.allReady();
  }
}

/// Register utils and misc tools.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
FutureOr<void> _injectUtils(AppConfig appConfig) async {
  GetIt.I.registerSingleton<AppConfig>(appConfig);
  GetIt.I.registerLazySingleton<Dio>(() => Dio());
  GetIt.I.registerLazySingleton<BfsiApiClient>(
      () => BfsiApiClient(GetIt.I<Dio>(), appConfig.baseUrl));
  GetIt.I.registerSingletonAsync<SharedPreferences>(
      () => SharedPreferences.getInstance());
  GetIt.I.registerLazySingleton<FlutterSecureStorage>(
      () => const FlutterSecureStorage());
  GetIt.I.registerLazySingleton<BfsiKeyValueStore>(
      () => BfsiKeyValueStoreImpl(GetIt.I<SharedPreferences>()));
}

/// Register all repository implementations.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
void _injectRepositories() {
  GetIt.I.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl());
}

void _injectApi() {
  //GetIt.I.registerLazySingleton<LoginApi>(() => LoginApiImpl());
}

/// Register all service-related implementations.
///
/// Please ensure modifications are kept in alphabetical order (where possible) to ensure legibility.
Future<void> _injectServices(AppConfig appConfig) async {
  // Notifications
}
