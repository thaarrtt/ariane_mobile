import 'package:ariane_mobile/auth/service/oidc_service.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';
import 'package:ariane_mobile/common/widgets/action_button_styled.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oidc/oidc.dart';

class WelcomePage extends ConsumerWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    OidcPlatformSpecificOptions_Web_NavigationMode webNavigationMode =
        OidcPlatformSpecificOptions_Web_NavigationMode.newPage;

    bool allowInsecureConnections = false;
    bool preferEphemeralSession = false;

    OidcPlatformSpecificOptions getOptions() {
      return OidcPlatformSpecificOptions(
        web: OidcPlatformSpecificOptions_Web(
          navigationMode: webNavigationMode,
          popupHeight: 800,
          popupWidth: 730,
        ),
        // these settings are from https://pub.dev/packages/flutter_appauth.
        android: OidcPlatformSpecificOptions_AppAuth_Android(
          allowInsecureConnections: allowInsecureConnections,
        ),
        ios: OidcPlatformSpecificOptions_AppAuth_IosMacos(
          preferEphemeralSession: preferEphemeralSession,
        ),
        macos: OidcPlatformSpecificOptions_AppAuth_IosMacos(
          preferEphemeralSession: preferEphemeralSession,
        ),
        windows: const OidcPlatformSpecificOptions_Native(),
      );
    }

    //remember, you can only enter this route if there is no user.
    final currentRoute = GoRouterState.of(context);
    final originalUri =
        currentRoute.uri.queryParameters[OidcConstants_Store.originalUri];
    final parsedOriginalUri =
        originalUri == null ? null : Uri.tryParse(originalUri);

    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 0.2.sh),
          Center(
            child: SizedBox(
              height: 0.4.sh,
              width: 0.8.sw,
              child: Image.asset('assets/images/logo-no-background.png'),
            ),
          ),
          SizedBox(height: 0.16.sh),
          ActionButtonStyled(
            btnColor: AppStyle.brandColor,
            width: 0.8.sw,
            onPressed: () async {
              await ref
                  .read(oidcServiceProvider)
                  .manager
                  .loginAuthorizationCodeFlow(
                    originalUri: parsedOriginalUri ?? Uri.parse('/'),
                    //store any arbitrary data, here we store the authorization
                    //start time.
                    extraStateData: DateTime.now().toIso8601String(),
                    options: getOptions(),
                    //NOTE: you can pass more parameters here.
                  );
            },
            label: Center(
              child: Text(
                'Link Start',
                style: AppStyle.textSubTitleWhite,
              ),
            ),
          ),
          SizedBox(height: 0.04.sh),
        ],
      ),
    );
  }
}
