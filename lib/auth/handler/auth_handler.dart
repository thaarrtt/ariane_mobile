import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:ariane_mobile/auth/model/auth.dart';
import 'package:ariane_mobile/auth/service/user_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_handler.g.dart';

/// A mock of an Authenticated User
const _dummyUser = Auth.signedIn(
  id: -1,
  displayName: 'My Name',
  email: 'My Email',
  token: 'some-updated-secret-auth-token',
);

/// This controller is an [AsyncNotifier] that holds and handles our authentication state
@riverpod
class AuthHandler extends _$AuthHandler {
  @override
  Future<Auth> build() async {
    await ref.read(userServiceProvider).init();

    _persistenceRefreshLogic();

    return _loginRecoveryAttempt();
  }

  /// Tries to perform a login with the saved token on the persistant storage.
  /// If _anything_ goes wrong, deletes the internal token and returns a [User.signedOut].
  Future<Auth> _loginRecoveryAttempt() {
    try {
      final savedToken = ref.read(userServiceProvider).fetch();
      if (savedToken == null) {
        throw const UnauthorizedException('No auth token found');
      }

      return _loginWithToken(savedToken);
    } catch (_, __) {
      ref.read(userServiceProvider).del().ignore();
      return Future.value(const Auth.signedOut());
    }
  }

  /// Mock of a request performed on logout (might be common, or not, whatevs).
  Future<void> logout() async {
    await Future<void>.delayed(networkRoundTripTime);
    state = const AsyncData(Auth.signedOut());
  }

  /// Mock of a successful login attempt, which results come from the network.
  Future<void> login(String email, String password) async {
    final result = await Future.delayed(
      networkRoundTripTime,
      () => _dummyUser,
    );
    state = AsyncData(result);
  }

  Future<void> regist(String email, String password) async {
    final result = await Future.delayed(
      networkRoundTripTime,
      () => _dummyUser,
    );
    state = AsyncData(result);
  }

  /// Mock of a login request performed with a saved token.
  /// If such request fails, this method will throw an [UnauthorizedException].
  Future<Auth> _loginWithToken(String token) async {
    final logInAttempt = await Future.delayed(
      networkRoundTripTime,
      () => true,
    );

    if (logInAttempt) return _dummyUser;

    throw const UnauthorizedException('401 Unauthorized or something');
  }

  /// Internal method used to listen authentication state changes.
  /// When the auth object is in a loading state, nothing happens.
  /// When the auth object is in an error state, we choose to remove the token
  /// Otherwise, we expect the current auth value to be reflected in our persitence API
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
          if (kDebugMode) {
            ref.read(userServiceProvider).del().ignore();
          }
        },
      );
    });
  }
}

/// Simple mock of a 401 exception
class UnauthorizedException implements Exception {
  const UnauthorizedException(this.message);
  final String message;
}

/// Mock of the duration of a network request
final networkRoundTripTime = 2.seconds;
