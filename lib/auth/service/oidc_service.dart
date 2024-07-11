import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'oidc_service.g.dart';

@Riverpod(keepAlive: true)
OidcService oidcService(OidcServiceRef ref) => OidcService();

class OidcService {
  late final OidcUserManager manager;

  Future<void> init() async {
    manager = OidcUserManager.lazy(
      discoveryDocumentUri: OidcUtils.getOpenIdConfigWellKnownUri(
        Uri.parse('https://ellesmere.arikassia.com'),
      ),
      clientCredentials: const OidcClientAuthentication.none(
        clientId: 'bafeb5ab6754137e26cc',
      ),
      store: OidcDefaultStore(),
      settings: OidcUserManagerSettings(
        frontChannelLogoutUri: Uri(path: 'redirect.html'),
        uiLocales: ['ar'],
        refreshBefore: (token) => const Duration(seconds: 1),
        strictJwtVerification: true,
        supportOfflineAuth: false,
        scope: ['openid', 'profile', 'email', 'offline_access'],
        postLogoutRedirectUri: _getPostLogoutRedirectUri(),
        redirectUri: _getRedirectUri(),
      ),
    );

    await manager.init();
    logInfo('OIDC manager initialized');
  }

  Stream<OidcUser?> get userChanges => manager.userChanges();

  Future<void> logout() => manager.logout();

  Uri? _getPostLogoutRedirectUri() {
    if (kIsWeb) return Uri.parse('http://localhost:22433/redirect.html');
    if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      return Uri.parse('ariane.arikassia:/endsessionredirect');
    }
    if (Platform.isWindows || Platform.isLinux) {
      return Uri.parse('http://localhost:0');
    }
    return null;
  }

  Uri _getRedirectUri() {
    if (kIsWeb) return Uri.parse('http://localhost:22433/redirect.html');
    if (Platform.isIOS || Platform.isMacOS || Platform.isAndroid) {
      return Uri.parse('ariane.arikassia:/oauth2redirect');
    }
    if (Platform.isWindows || Platform.isLinux) {
      return Uri.parse('http://localhost:0');
    }
    return Uri();
  }
}

@riverpod
Stream<OidcUser?> currentUser(CurrentUserRef ref) {
  final oidcService = ref.watch(oidcServiceProvider);
  return oidcService.userChanges;
}
