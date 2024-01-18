import 'package:bfsi/presentation/pages/admin_landing/admin_landing_page.dart';
import 'package:bfsi/presentation/pages/customer_request/customer_request_page.dart';
import 'package:bfsi/presentation/pages/customer_transaction_history/customer_transaction_history_page.dart';
import 'package:bfsi/presentation/pages/loading_page.dart';
import 'package:bfsi/presentation/pages/login/login_page.dart';
import 'package:bfsi/presentation/pages/not_found_page.dart';
import 'package:bfsi/presentation/pages/request_approve_reject/request_qpprove_reject_page.dart';
import 'package:bfsi/presentation/pages/signup/signup_page.dart';
import 'package:routemaster/routemaster.dart';

/// Defines the base routing paths within the app.
///
/// Should generally be limited to the root pages of each [RouteMap].
class InitialPageRoutes {
  static const root = '/';
  static const notFound = '/404';
  static const loading = '/loading';

  // forgot password
  static const forgotPin = '/forgotPassword';

  // onboarding routes
  static const login = '/login';

  // logged-in routes
  static const customerTransactionHistoryPage =
      '/customerTransactionHistoryPage';
  static const adminLandingPage = '/adminLandingPage';
}

/// Defines the available page route names.
///
/// Valid paths should be declared within the relevant [PageRoutes] value.
/// When [Routemaster.push] is invoked with a [RelativePageRoute], it
/// will be treated as a relative path to the current path, and push the
/// page on top.
///
/// Pushing a page with a leading `/` implies an absolute path, so this
/// will replace the current navigation stack with the new route path.
///
/// See [Routemaster.push] for more information.
class RelativePageRoutes {
  // Login
  static const signUp = '/signUp';
  static const customerRequest = '/customerRequest';
  static const requestApproveReject = '/requestApproveReject';
}

class PageRoutes {
  static final loading = RouteMap(
    routes: {
      InitialPageRoutes.loading: (_) => LoadingPage(),
    },
    onUnknownRoute: (path) => Redirect(
      InitialPageRoutes.loading,
      queryParameters: {'path': path},
    ),
  );

  /// Defines the primary routing map for a logged-in user.
  static final customerLoggedIn = RouteMap(
    routes: {
      InitialPageRoutes.notFound: (routeData) => NotFoundPage(
            path: routeData.queryParameters['path'] ?? '',
          ),
      InitialPageRoutes.loading: (routeData) => LoadingPage(),
      InitialPageRoutes.root: (routeData) => CustomerTransactionHistoryPage(
            keyValue: routeData.path,
            routeName: routeData.path,
            arguments: const <String, dynamic>{},
          ),

      // `/customerRequest`
      '${InitialPageRoutes.customerTransactionHistoryPage}/${RelativePageRoutes.customerRequest}':
          (routeData) {
        return CustomerRequestPage(
          keyValue: routeData.path,
          routeName: routeData.path,
          arguments: const <String, dynamic>{},
        );
      },
    },

    /// Redirect rather than directly returning [NotFoundPage] is preferred,
    /// as it allows us to `pop` back to home from it.
    onUnknownRoute: (path) => Redirect(
      InitialPageRoutes.notFound,
      queryParameters: {'path': path},
    ),
  );

  /// Defines the primary routing map for a logged-in user.
  static final adminLoggedIn = RouteMap(
    routes: {
      InitialPageRoutes.notFound: (routeData) => NotFoundPage(
            path: routeData.queryParameters['path'] ?? '',
          ),
      InitialPageRoutes.loading: (routeData) => LoadingPage(),
      InitialPageRoutes.root: (routeData) => AdminLandingPage(
            keyValue: routeData.path,
            routeName: routeData.path,
            arguments: const <String, dynamic>{},
          ),

      // `/customerRequest`
      '${InitialPageRoutes.adminLandingPage}/${RelativePageRoutes.requestApproveReject}':
          (routeData) {
        return RequestApproveRejectPage(
          keyValue: routeData.path,
          routeName: routeData.path,
          arguments: const <String, dynamic>{},
        );
      },
    },

    /// Redirect rather than directly returning [NotFoundPage] is preferred,
    /// as it allows us to `pop` back to home from it.
    onUnknownRoute: (path) => Redirect(
      InitialPageRoutes.notFound,
      queryParameters: {'path': path},
    ),
  );

  static final login = RouteMap(
    routes: {
      InitialPageRoutes.login: (_) => LoginPage(),

      // `/login/:signup`
      '${InitialPageRoutes.login}/${RelativePageRoutes.signUp}': (routeData) {
        return SignUpPage(
          keyValue: routeData.path,
          routeName: routeData.path,
          arguments: const <String, dynamic>{},
        );
      },
    },
    onUnknownRoute: (path) => const Redirect(InitialPageRoutes.login),
  );

  static int? _parseIntParam(Map<String, String> params, String paramName) {
    final value = params[paramName];
    if (value != null && value.isNotEmpty) {
      return int.tryParse(value);
    }
    return null;
  }

  static bool? _parseBoolParam(Map<String, String> params, String paramName) {
    final value = params[paramName];
    if (value != null) {
      return value.toLowerCase() == 'true';
    }
    return null;
  }
}
