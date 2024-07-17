import 'dart:async';

import 'package:ariane_mobile/auth/service/oidc_service.dart';
import 'package:ariane_mobile/auth/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oidc/oidc.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'routes.dart';

part 'router.g.dart';

@riverpod
GoRouter router(RouterRef ref) {
  print('Initializing router');
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final oidcService = ref.watch(oidcServiceProvider);
  oidcService.init();
  ref.read(userServiceProvider).init();

  return GoRouter(
    navigatorKey: routerKey,
    refreshListenable: GoRouterRefreshStream(oidcService.userChanges),
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) {
      final userAsync = ref.read(currentUserProvider);

      print('Redirect called for path: ${state.uri.path}');
      print('User state: $userAsync');

      // Always allow access to splash
      if (state.uri.path == '/splash') {
        print('On splash page, no redirect');
        return null;
      }

      if (userAsync.isLoading) {
        print('User state is loading');
        // Instead of redirecting, we'll stay on the current page
        return null;
      }

      final user = userAsync.value;

      if (user == null) {
        print('User is not authenticated');
        if (state.uri.path == '/welcome' || state.uri.path == '/regist') {
          print('On welcome or regist page, no redirect');
          return null;
        }
        print('Redirecting to welcome page');
        return const WelcomeRoute().location;
      } else {
        print('User is authenticated');
        if (state.uri.path == '/welcome' || state.uri.path == '/regist') {
          print('On welcome or regist page, redirecting to home');
          return const HomeRoute().location;
        }
        print('Allowing access to: ${state.uri.path}');
        return null;
      }
    },
  );
}

bool isProtectedRoute(String path) {
  final protectedPaths = ['/', '/chat_detail', '/shops'];
  return protectedPaths.any((protectedPath) => path.startsWith(protectedPath));
}

class GoRouterRefreshStream extends ChangeNotifier {
  GoRouterRefreshStream(Stream<OidcUser?> stream) {
    notifyListeners();
    _subscription = stream.asBroadcastStream().listen(
          (OidcUser? user) => notifyListeners(),
        );
  }

  late final StreamSubscription<OidcUser?> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
