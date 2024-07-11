// ignore_for_file: avoid_redundant_argument_values

import 'dart:io';

import 'package:async/async.dart';
import 'package:bdaya_shared_value/bdaya_shared_value.dart';
import 'package:flutter/foundation.dart';
import 'package:loggy/loggy.dart';
import 'package:oidc/oidc.dart';
import 'package:oidc_default_store/oidc_default_store.dart';

//This file represents a global state, which is bad
//in a production app (since you can't test it).

/// Gets the current manager used in the example.
OidcUserManager currentManager = duendeManager;

final duendeManager = OidcUserManager.lazy(
  discoveryDocumentUri: OidcUtils.getOpenIdConfigWellKnownUri(
    Uri.parse('https://ellesmere.arikassia.com'),
  ),
  // this is a public client,
  // so we use [OidcClientAuthentication.none] constructor.
  clientCredentials: const OidcClientAuthentication.none(
    clientId: 'bafeb5ab6754137e26cc',
  ),
  store: OidcDefaultStore(),

  // keyStore: JsonWebKeyStore(),
  settings: OidcUserManagerSettings(
    frontChannelLogoutUri: Uri(path: 'redirect.html'),
    uiLocales: ['ar'],
    refreshBefore: (token) {
      return const Duration(seconds: 1);
    },
    strictJwtVerification: true,
    // set to true to enable offline auth
    supportOfflineAuth: false,
    // scopes supported by the provider and needed by the client.
    scope: ['openid', 'profile', 'email', 'offline_access'],
    postLogoutRedirectUri: kIsWeb
        ? Uri.parse('http://localhost:22433/redirect.html')
        : Platform.isAndroid || Platform.isIOS || Platform.isMacOS
            ? Uri.parse('ariane.arikassia:/endsessionredirect')
            : Platform.isWindows || Platform.isLinux
                ? Uri.parse('http://localhost:0')
                : null,
    redirectUri: kIsWeb
        // this url must be an actual html page.
        // see the file in /web/redirect.html for an example.
        //
        // for debugging in flutter, you must run this app with --web-port 22433
        ? Uri.parse('http://localhost:22433/redirect.html')
        : Platform.isIOS || Platform.isMacOS || Platform.isAndroid
            // scheme: reverse domain name notation of your package name.
            // path: anything.
            ? Uri.parse('ariane.arikassia:/oauth2redirect')
            : Platform.isWindows || Platform.isLinux
                // using port 0 means that we don't care which port is used,
                // and a random unused port will be assigned.
                //
                // this is safer than passing a port yourself.
                //
                // note that you can also pass a path like /redirect,
                // but it's completely optional.
                ? Uri.parse('http://localhost:0')
                : Uri(),
  ),
);

final initMemoizer = AsyncMemoizer<void>();
Future<void> initApp() {
  return initMemoizer.runOnce(() async {
    currentManager.userChanges().listen((event) {
      cachedAuthedUser.$ = event;
      logInfo(
        'User changed: ${event?.claims.toJson()}, info: ${event?.userInfo}',
      );
    });

    await currentManager.init();
  });
}

final cachedAuthedUser = SharedValue<OidcUser?>(value: null);
