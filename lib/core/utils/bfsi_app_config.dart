import 'package:bfsi/core/enums/env.dart';

class BfsiAppConfig {
  final String baseUrl;
  final Environment environment;
  final String clientAccess;

  const BfsiAppConfig({
    required this.baseUrl,
    required this.environment,
    required this.clientAccess,
  });
}
