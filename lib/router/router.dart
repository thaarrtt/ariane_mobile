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
    refreshListenable.notifyListeners();
  });

  return GoRouter(
    navigatorKey: routerKey,
    refreshListenable: refreshListenable,
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      return authState.when(
        data: (auth) {
          if (auth is SignedIn) {
            if (state.uri.path == '/welcome' ||
                state.uri.path == '/regist' ||
                state.uri.path == '/splash') {
              return const HomeRoute().location;
            }
            return null;
          } else {
            if (state.uri.path == '/welcome' || state.uri.path == '/regist') {
              return null;
            }
            return const WelcomeRoute().location;
          }
        },
        loading: () {
          return const SplashRoute().location;
        },
        error: (error, _) {
          return const WelcomeRoute().location;
        },
      );
    },
  );
}

class GoRouterRefreshNotifier extends ChangeNotifier {
  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}
