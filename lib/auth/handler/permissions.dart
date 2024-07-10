import 'dart:math';

import 'package:ariane_mobile/auth/handler/auth_handler.dart';
import 'package:ariane_mobile/auth/model/user_role.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'permissions.g.dart';

/// If our user is signed out, this provider returns [UserRole.none]
/// Otherwise, it mocks a network request and gives out some [UserRole].
@riverpod
Future<UserRole> permissions(PermissionsRef ref) async {
  final userId = await ref.watch(
    authHandlerProvider.selectAsync(
      (value) => value.map(
        signedIn: (signedIn) => signedIn.id,
        signedOut: (signedOut) => null,
      ),
    ),
  );

  if (userId == null) return const UserRole.none();

  return _requestMock();
}

/// Gives a random [UserRole] based on a dice roll.
UserRole _requestMock() {
  // mock
  final random = Random().nextDouble();

  if (random < 0.0) {
    return const UserRole.admin();
  } else if (random < 1) {
    return const UserRole.user();
  } else {
    return const UserRole.guest();
  }
}
