// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'permissions.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$permissionsHash() => r'd9a196a1c401a068c0821ccf99af248c3f75e52a';

/// If our user is signed out, this provider returns [UserRole.none]
/// Otherwise, it mocks a network request and gives out some [UserRole].
///
/// Copied from [permissions].
@ProviderFor(permissions)
final permissionsProvider = AutoDisposeFutureProvider<UserRole>.internal(
  permissions,
  name: r'permissionsProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$permissionsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef PermissionsRef = AutoDisposeFutureProviderRef<UserRole>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
