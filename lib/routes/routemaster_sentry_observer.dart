import 'package:fimber/fimber.dart';
import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/// Observes all routing interactions and reports them to Sentry as
/// breadcrumbs if/when an error is reported.
class RoutemasterSentryObserver extends RoutemasterObserver {
  @override
  void didPush(Route route, Route? previousRoute) {
    Fimber.d('Pushed ${route.settings.name}');
    Sentry.addBreadcrumb(RouteObserverBreadcrumb(
      navigationType: 'didPush',
      from: RouteSettings(
        name: previousRoute?.settings.name,
        arguments: previousRoute?.settings.arguments,
      ),
      to: RouteSettings(
        name: route.settings.name,
        arguments: route.settings.arguments,
      ),
    ));
    super.didPush(route, previousRoute);
  }

  @override
  void didPop(Route route, Route? previousRoute) {
    Fimber.d('Popped ${route.settings.name}');
    Sentry.addBreadcrumb(RouteObserverBreadcrumb(
      navigationType: 'didPop',
      from: RouteSettings(
        name: previousRoute?.settings.name,
        arguments: previousRoute?.settings.arguments,
      ),
      to: RouteSettings(
        name: route.settings.name,
        arguments: route.settings.arguments,
      ),
    ));
    super.didPop(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    Fimber.d(
        'Replaced ${oldRoute?.settings.name} with ${newRoute?.settings.name}');
    Sentry.addBreadcrumb(RouteObserverBreadcrumb(
      navigationType: 'didReplace',
      from: RouteSettings(
        name: oldRoute?.settings.name,
        arguments: oldRoute?.settings.arguments,
      ),
      to: RouteSettings(
        name: newRoute?.settings.name,
        arguments: newRoute?.settings.arguments,
      ),
    ));
    super.didReplace(oldRoute: oldRoute, newRoute: newRoute);
  }

  @override
  void didRemove(Route route, Route? previousRoute) {
    Fimber.d(
        'Removed ${previousRoute?.settings.name}, back to ${route.settings.name}');
    Sentry.addBreadcrumb(RouteObserverBreadcrumb(
      navigationType: 'didRemove',
      from: RouteSettings(
        name: previousRoute?.settings.name,
        arguments: previousRoute?.settings.arguments,
      ),
      to: RouteSettings(
        name: route.settings.name,
        arguments: route.settings.arguments,
      ),
    ));
    super.didRemove(route, previousRoute);
  }
}
