import 'dart:async';

import 'package:ariane_mobile/auth/view/welcome_page.dart';
import 'package:ariane_mobile/shop/view/shops_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ariane_mobile/common/pages/splash_page.dart';
import 'package:ariane_mobile/home/view/chat_detail.dart';
import 'package:ariane_mobile/home/view/home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

// PROTECTED (ONLY AUTHENTICATED USER CAN ACCESS)
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
