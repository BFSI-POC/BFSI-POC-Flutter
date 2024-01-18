import 'package:bfsi/core/consts/cli_consts.dart';
import 'package:bfsi/core/enums/env.dart';
import 'package:bfsi/core/utils/bfsi_app_config.dart';

class AppConfig extends BfsiAppConfig {
  /// Creates an [AppConfig] instance.
  ///
  /// Defines how the app will behave according to the given [Environment].
  const AppConfig({
    super.environment = Environment.prod,
    required super.baseUrl,
    required super.clientAccess,
  });

  static AppConfig init({
    Environment env = Environment.prod,
  }) {
    // Reading CLI args requires declaring variables as constants
    const baseUrlArg = String.fromEnvironment(CliConsts.baseUrl);
    const clientAccessArg = String.fromEnvironment(CliConsts.clientAccess);

    return AppConfig(
      baseUrl: baseUrlArg,
      environment: env,
      clientAccess: clientAccessArg,
    );
  }
}
