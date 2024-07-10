import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/handler/auth_handler.dart';

import '../widgets/action_button.dart';

class RegistPage extends HookConsumerWidget {
  const RegistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<void> login() => ref.read(authHandlerProvider.notifier).regist(
          'myEmail',
          'myPassword',
        );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Regist Page'),
            ActionButton(
              onPressed: login,
              icon: const SizedBox.shrink(),
              label: const Text('Regist'),
            ),
          ],
        ),
      ),
    );
  }
}
