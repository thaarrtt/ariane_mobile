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
  final routerKey = GlobalKey<NavigatorState>(debugLabel: 'routerKey');
  final oidcService = ref.watch(oidcServiceProvider);
  oidcService.init();
  ref.read(userServiceProvider).init();

  final router = GoRouter(
    navigatorKey: routerKey,
    refreshListenable: GoRouterRefreshStream(oidcService.userChanges),
    initialLocation: const SplashRoute().location,
    debugLogDiagnostics: true,
    routes: $appRoutes,
    redirect: (context, state) async {
      final container = ProviderScope.containerOf(context);
      final userAsync = container.read(currentUserProvider);

      // Don't redirect if we're on the splash screen
      if (state.uri.path == '/splash') {
        return null;
      }

      if (userAsync.isLoading) {
        return const SplashRoute().location;
      }

      if (userAsync.hasError || userAsync.value == null) {
        // Don't redirect if we're already on the welcome page
        if (state.uri.path == '/welcome') {
          return null;
        }
        return const WelcomeRoute().location;
      }

      // User is authenticated
      if (state.uri.path == '/welcome' || state.uri.path == '/splash') {
        // Redirect to home if on welcome or splash page
        return const HomeRoute().location;
      }

      // Allow access to all other routes when authenticated
      return null;
    },
  );

  ref.onDispose(router.dispose);

  return router;
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
