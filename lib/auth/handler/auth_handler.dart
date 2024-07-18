import 'dart:async';

import 'package:ariane_mobile/auth/service/oidc_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ariane_mobile/auth/model/auth.dart';
import 'package:ariane_mobile/auth/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_handler.g.dart';

@riverpod
class AuthHandler extends _$AuthHandler {
  @override
  Future<Auth> build() async {
    // Initialize the OIDC service
    await ref.read(oidcServiceProvider).init();
    await ref.read(userServiceProvider).init();

    // Set up persistence refresh logic
    _persistenceRefreshLogic();

    // Attempt to recover login state
    return _loginRecoveryAttempt();
  }

  Future<Auth> _loginRecoveryAttempt() async {
    try {
      final oidcService = ref.read(oidcServiceProvider);
      final user = oidcService.manager.currentUser;

      if (user != null) {
        return Auth.signedIn(
          id: user.uid ?? 'no uid',
          displayName: user.attributes.toString(),
          email: user.userInfo.toString(),
          token: user.idToken,
        );
      } else {
        return const Auth.signedOut();
      }
    } catch (e) {
      ref.read(userServiceProvider).del().ignore();
      return const Auth.signedOut();
    }
  }

  Future<void> logout() async {
    await ref.read(oidcServiceProvider).logout();
    state = const AsyncData(Auth.signedOut());
  }

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      final oidcService = ref.read(oidcServiceProvider);
      final user = await oidcService.manager
          .loginPassword(username: email, password: password);
      if (user != null) {
        state = AsyncData(Auth.signedIn(
          id: user.uid ?? 'no uid',
          displayName: user.attributes.toString(),
          email: user.userInfo.toString(),
          token: user.idToken,
        ));
      } else {
        state = const AsyncError('Login failed', StackTrace.empty);
      }
    } catch (e, stack) {
      state = AsyncError('Login error: $e', stack);
    }
  }

  Future<void> refreshAuth() async {
    state = const AsyncLoading();
    try {
      final oidcService = ref.read(oidcServiceProvider);
      final user = oidcService.manager.currentUser;
      if (user != null) {
        state = AsyncData(Auth.signedIn(
          id: user.uid ?? 'no uid',
          displayName: user.attributes.toString(),
          email: user.userInfo.toString(),
          token: user.idToken,
        ));
      } else {
        state = const AsyncData(Auth.signedOut());
      }
    } catch (e, stack) {
      state = AsyncError('Refresh error: $e', stack);
    }
  }

  void _persistenceRefreshLogic() {
    ref.listenSelf((_, next) {
      if (next.isLoading) return;
      if (next.hasError) {
        ref.read(userServiceProvider).del().ignore();
        return;
      }

      next.requireValue.map<void>(
        signedIn: (signedIn) {
          ref.read(userServiceProvider).set(signedIn.token);
        },
        signedOut: (signedOut) {
          ref.read(userServiceProvider).del().ignore();
        },
      );
    });
  }
}

class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message);
  final String message;
}

final networkRoundTripTime = 2.seconds;
