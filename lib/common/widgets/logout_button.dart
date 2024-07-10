import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/handler/auth_handler.dart';

import 'action_button.dart';

class LogoutButton extends ConsumerWidget {
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionButton(
      onPressed: ref.read(authHandlerProvider.notifier).logout,
      icon: const Icon(Icons.logout),
      label: const Text('Logout'),
    );
  }
}
