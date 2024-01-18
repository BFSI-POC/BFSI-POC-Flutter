import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// An observer to instantiate within app init that captures transitions and events from every single bloc.
class BfsiBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    Fimber.d('blocOnChange');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    Fimber.d('blocOnEvent');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    super.onError(bloc, error, stackTrace);
    Fimber.d('blocOnError');
    Fimber.e('error', stacktrace: stackTrace);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    Fimber.d('blocOnCreate');
  }
}
