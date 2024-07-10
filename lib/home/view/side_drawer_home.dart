import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/handler/auth_handler.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';

class SideDrawer {
  void showDrawer() {
    SmartDialog.show(
      backDismiss: true,
      alignment: Alignment.bottomLeft,
      useAnimation: true,
      animationType: SmartAnimationType.centerFade_otherSlide,
      builder: (_) {
        return const SideDrawerBody();
      },
    );
  }
}

class SideDrawerBody extends ConsumerWidget {
  const SideDrawerBody({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SafeArea(
      child: Container(
        height: 1.sh,
        width: 0.9.sw,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: AppStyle.grayBrandColor,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 0.04.sh),
              // SizedBox(
              //   width: 0.9.sw,
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       const Icon(Icons.close, color: Colors.white),
              //       // Text(
              //       //   'Tentang Aplikasi',
              //       //   style: AppStyle.textSubTitleBOLD,
              //       //   textAlign: TextAlign.center,
              //       // ),
              //       IconButton(
              //         onPressed: () {
              //           SmartDialog.dismiss();
              //         },
              //         icon: const Icon(Icons.close),
              //       ),
              //     ],
              //   ),
              // ),

              const Spacer(),
              ListTile(
                leading: const Icon(Icons.logout_outlined),
                title: const Text(
                  'Logout',
                ),
                onTap: () {
                  ref.read(authHandlerProvider.notifier).logout();
                },
              ),
              SizedBox(height: 0.04.sh),
            ],
          ),
        ),
      ),
    );
  }
}
