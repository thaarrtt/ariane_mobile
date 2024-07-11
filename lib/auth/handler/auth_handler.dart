import 'dart:async';

import 'package:ariane_mobile/auth/service/oidc_service.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ariane_mobile/auth/model/auth.dart';
import 'package:ariane_mobile/auth/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_handler.g.dart';

/// A mock of an Authenticated User
const _dummyUser = Auth.signedIn(
  id: 'asdasdas',
  displayName: 'My Name',
  email: 'My Email',
  token: 'some-updated-secret-auth-token',
);

@riverpod
class AuthHandler extends _$AuthHandler {
  @override
  Future<Auth> build() async {
    await ref.read(userServiceProvider).init();
    await ref.read(oidcServiceProvider).init();

    _listenToOidcUserChanges();

    _persistenceRefreshLogic();

    return _loginRecoveryAttempt();
  }

  void _listenToOidcUserChanges() {
    ref.read(oidcServiceProvider).userChanges.listen((oidcUser) {
      if (oidcUser != null) {
        state = AsyncData(Auth.signedIn(
          id: oidcUser.uid ?? 'no uid',
          displayName: 'display name',
          email: 'display email',
          token: oidcUser.idToken,
        ));
      } else {
        state = const AsyncData(Auth.signedOut());
      }
    });
  }

  Future<Auth> _loginRecoveryAttempt() async {
    try {
      final savedToken = ref.read(userServiceProvider).fetch();
      if (savedToken == null) {
        throw const UnauthorizedException('No auth token found');
      }

      final oidcService = ref.read(oidcServiceProvider);
      final user = oidcService.manager.currentUser;
      if (user == null) {
        throw const UnauthorizedException('No OIDC user found');
      }

      return Auth.signedIn(
        id: user.uid ?? 'no uids',
        displayName: 'display name',
        email: 'display email',
        token: user.idToken,
      );
    } catch (_, __) {
      ref.read(userServiceProvider).del().ignore();
      return const Auth.signedOut();
    }
  }

  Future<void> logout() async {
    await Future<void>.delayed(networkRoundTripTime);
    await ref.read(oidcServiceProvider).logout();
    state = const AsyncData(Auth.signedOut());
  }

  Future<void> login(String email, String password) async {
    final oidcService = ref.read(oidcServiceProvider);
    final user = await oidcService.manager
        .loginPassword(username: email, password: password);
    state = AsyncData(Auth.signedIn(
      id: user?.uid ?? 'no uids',
      displayName: 'display name',
      email: 'display email',
      token: user?.idToken ?? 'no token',
    ));
  }

  Future<void> regist(String email, String password) async {
    // Registration logic
    final result = await Future.delayed(
      networkRoundTripTime,
      () => _dummyUser,
    );
    state = AsyncData(result);
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
