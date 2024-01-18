import 'package:bfsi/blocs/app_state_bloc.dart';
import 'package:bfsi/blocs/bfsi_bloc_observer.dart';
import 'package:bfsi/core/theme/bfsi_theme.dart';
import 'package:bfsi/routes/page_routes.dart';
import 'package:bfsi/routes/routemaster_sentry_observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:routemaster/routemaster.dart';
import 'core/consts/app_consts.dart';
import 'core/enums/env.dart';
import 'core/utils/injector.dart';

Future<void> initApp({Environment env = Environment.prod}) async {
  WidgetsFlutterBinding.ensureInitialized();

  /// Workaround for enabling landscape orientations in `Info.plist`
  ///
  /// Programmatically force portrait until told otherwise (eg. within video player)
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  Bloc.observer = BfsiBlocObserver();
  await Injector.init(
    env: env,
    appRunner: () => runApp(AppWrapper(env: env)),
  );
}

class AppWrapper extends StatelessWidget {
  final Environment env;

  const AppWrapper({
    super.key,
    required this.env,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AppStateBloc>(
      create: (context) => AppStateBloc()..add(const CheckAppStateEvent()),
      child: App(
        lockTimeout: const Duration(minutes: 10),
        observerList: [
          RoutemasterSentryObserver(),
        ],
      ),
    );
  }
}

class App extends StatefulWidget {
  final Duration lockTimeout;

  /// A list of [NavigatorObserver] that will capture all navigation events.
  ///
  /// Separate observers should be defined for separate purposes, depending
  /// on where the captured data is being sent.
  final List<RoutemasterObserver> observerList;

  const App({
    super.key,
    required this.lockTimeout,
    this.observerList = const [],
  });

  @override
  AppState createState() => AppState();
}

class AppState extends State<App> {
  late final RoutemasterDelegate routemaster;

  @override
  void initState() {
    routemaster = RoutemasterDelegate(
      observers: widget.observerList,
      routesBuilder: (context) {
        final state = BlocProvider.of<AppStateBloc>(context).state;
        if (state is CustomerTransactionHistory) {
          return PageRoutes.customerLoggedIn;
        } else if (state is AdminLoginState) {
          return PageRoutes.adminLoggedIn;
        } else if (state is AppLoginState) {
          return PageRoutes.login;
        } else {
          return PageRoutes.loading;
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppStateBloc, AppBlocState>(
      bloc: BlocProvider.of<AppStateBloc>(context),
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp.router(
          key: ObjectKey(state),
          title: AppConsts.appName,
          theme: BfsiAppTheme.appTheme(),
          routeInformationParser: const RoutemasterParser(),
          routerDelegate: routemaster,
          debugShowCheckedModeBanner: false,
          builder: (context, child) => MediaQuery(
            // override OS-level font scaling
            data: MediaQuery.of(context).copyWith(
              textScaler: const TextScaler.linear(1.0),
            ),
            child: child ?? const SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
