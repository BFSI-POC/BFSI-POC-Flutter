import 'package:bfsi/core/enums/env.dart';

import 'app.dart';

Future<void> main() async {
  await initApp(env: Environment.prod);
}
