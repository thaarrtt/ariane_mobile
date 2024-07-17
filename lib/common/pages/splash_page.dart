import 'package:ariane_mobile/auth/service/oidc_service.dart';
import 'package:ariane_mobile/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ariane_mobile/common/widgets/loading_spinner.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:oidc/oidc.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<OidcUser?>>(currentUserProvider, (_, next) {
      if (next.hasValue) {
        if (next.value != null) {
          GoRouter.of(context).go(const HomeRoute().location);
        } else {
          GoRouter.of(context).go(const WelcomeRoute().location);
        }
      }
    });

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/logo-no-background.png',
              width: 0.8.sw,
            ),
            SizedBox(height: 0.04.sh),
            const LoadingSpinner(),
          ],
        ),
      ),
    );
  }
}
