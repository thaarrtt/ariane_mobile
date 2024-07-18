import 'package:ariane_mobile/auth/handler/auth_handler.dart';
import 'package:ariane_mobile/auth/model/auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  final authState = ref.watch(authHandlerProvider);
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');

  final refreshListenable = GoRouterRefreshNotifier();

  ref.listen<AsyncValue<Auth>>(authHandlerProvider, (_, next) {
    print('Auth state changed: $next');
    refreshListenable.notifyListeners();
  });

  return GoRouter(
    navigatorKey: routerKey,
    refreshListenable: refreshListenable,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      print('Redirect called for path: ${state.uri.path}');
      print('Current auth state: $authState');

      return authState.when(
        data: (auth) {
          if (auth is SignedIn) {
            print('User is authenticated, current path: ${state.uri.path}');
            if (state.uri.path == '/welcome' ||
                state.uri.path == '/regist' ||
                state.uri.path == '/splash') {
              print('Redirecting to home');
              return const HomeRoute().location;
            }
            print('Allowing access to: ${state.uri.path}');
            return null;
          } else {
            print('User is not authenticated');
            if (state.uri.path == '/welcome' || state.uri.path == '/regist') {
              print('On welcome or regist page, no redirect');
              return null;
            }
            print('Redirecting to welcome page');
            return const WelcomeRoute().location;
          }
        },
        loading: () {
          print('Auth state is loading');
          return const SplashRoute().location;
        },
        error: (error, _) {
          print('Auth error: $error');
          return const WelcomeRoute().location;
        },
      );
    },
  );
}

class GoRouterRefreshNotifier extends ChangeNotifier {
  @override
  void notifyListeners() {
    print('GoRouterRefreshNotifier: notifying listeners');
    super.notifyListeners();
  }
}
