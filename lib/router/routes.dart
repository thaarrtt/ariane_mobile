import 'dart:async';

import 'package:ariane_mobile/auth/service/oidc_service.dart';
import 'package:ariane_mobile/auth/view/welcome_page.dart';
import 'package:ariane_mobile/shop/view/shops_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ariane_mobile/common/pages/regist_page.dart';
import 'package:ariane_mobile/common/pages/splash_page.dart';
import 'package:ariane_mobile/home/view/chat_detail.dart';
import 'package:ariane_mobile/home/view/home_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:loggy/loggy.dart';
import 'package:oidc/oidc.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) async {
    final container = ProviderScope.containerOf(context);
    final userAsync = container.read(currentUserProvider);

    logInfo('User state: ${userAsync.toString()}');

    if (userAsync.isLoading) {
      logInfo('Still loading, staying on splash');
      return null;
    }

    if (userAsync.hasError) {
      logInfo('Error in authentication, redirecting to login');
      return const WelcomeRoute().location;
    }

    final user = userAsync.value;

    if (user != null) {
      logInfo('User authenticated');
      final originalUri =
          state.uri.queryParameters[OidcConstants_Store.originalUri];
      if (originalUri != null) {
        logInfo('Redirecting to original URI: $originalUri');
        return originalUri;
      }
      logInfo('Redirecting to home');
      return const HomeRoute().location;
    } else {
      logInfo('User not authenticated, redirecting to login');
      return const WelcomeRoute().location;
    }
  }

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<ChatDetailRoute>(path: 'chat_detail'),
    TypedGoRoute<ShopsRoute>(path: 'shops'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage();
  }
}

@TypedGoRoute<WelcomeRoute>(path: '/welcome')
class WelcomeRoute extends GoRouteData {
  const WelcomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const WelcomePage();
  }
}

@TypedGoRoute<RegistRoute>(path: '/regist')
class RegistRoute extends GoRouteData {
  const RegistRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const RegistPage();
  }
}

class ChatDetailRoute extends GoRouteData {
  const ChatDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatPage();
  }
}

class ShopsRoute extends GoRouteData {
  const ShopsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const ShopsPage();
  }
}

/// This route shows how to parametrize a simple page and how to pass a simple query parameter.
@TypedGoRoute<DetailsRoute>(path: '/details/:id')
class DetailsRoute extends GoRouteData {
  const DetailsRoute(this.id, {this.isNuke = false});
  final int id;
  final bool isNuke;

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return Container();
  }
}
