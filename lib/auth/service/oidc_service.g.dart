// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'oidc_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$oidcServiceHash() => r'2c1d3f12608e8b1c2aaa2f6891c32e61d2c53e0c';

/// See also [oidcService].
@ProviderFor(oidcService)
final oidcServiceProvider = Provider<OidcService>.internal(
  oidcService,
  name: r'oidcServiceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$oidcServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef OidcServiceRef = ProviderRef<OidcService>;
String _$currentUserHash() => r'1b0be85d163700013638d438a11ddd06dba93de2';

/// See also [currentUser].
@ProviderFor(currentUser)
final currentUserProvider = AutoDisposeStreamProvider<OidcUser?>.internal(
  currentUser,
  name: r'currentUserProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$currentUserHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CurrentUserRef = AutoDisposeStreamProviderRef<OidcUser?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
