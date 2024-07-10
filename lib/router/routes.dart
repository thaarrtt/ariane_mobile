import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:ariane_mobile/common/pages/admin_page.dart';
import 'package:ariane_mobile/common/pages/details_page.dart';
import 'package:ariane_mobile/common/pages/guest_page.dart';
import 'package:ariane_mobile/auth/view/login_page.dart';
import 'package:ariane_mobile/common/pages/regist_page.dart';
import 'package:ariane_mobile/common/pages/splash_page.dart';
import 'package:ariane_mobile/home/view/chat_detail.dart';
import 'package:ariane_mobile/home/view/home_page.dart';

part 'routes.g.dart';

@TypedGoRoute<HomeRoute>(
  path: '/',
  routes: [
    TypedGoRoute<AdminRoute>(path: 'admin'),
    TypedGoRoute<UserRoute>(path: 'user'),
    TypedGoRoute<GuestRoute>(path: 'guest'),
    TypedGoRoute<ChatDetailRoute>(path: 'chat_detail'),
  ],
)
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage1();
  }
}

@TypedGoRoute<SplashRoute>(path: '/splash')
class SplashRoute extends GoRouteData {
  const SplashRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const SplashPage();
  }
}

@TypedGoRoute<LoginRoute>(path: '/login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const LoginPage();
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

class AdminRoute extends GoRouteData {
  const AdminRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const AdminPage();
  }
}

class UserRoute extends GoRouteData {
  const UserRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomePage1();
  }
}

class ChatDetailRoute extends GoRouteData {
  const ChatDetailRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return ChatPage();
  }
}

class GuestRoute extends GoRouteData {
  const GuestRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const GuestPage();
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
    return DetailsPage(
      id,
      isNuclearCode: isNuke,
    );
  }
}
