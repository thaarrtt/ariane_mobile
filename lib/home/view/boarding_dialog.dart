import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/service/user_service.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';
import 'package:ariane_mobile/router/routes.dart';

class OnBoardingScreen extends ConsumerWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return OnBoardingSlider(
      pageBackgroundColor: AppStyle.grayBrandColor,
      headerBackgroundColor: AppStyle.grayBrandColor,
      controllerColor: AppStyle.brandColor,
      centerBackground: true,
      finishButtonText: 'Daftar',
      finishButtonTextStyle: AppStyle.textBodyWhite,
      onFinish: () {
        ref.read(userServiceProvider).disableBoard().ignore();
        Navigator.pop(context);
      },
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor: AppStyle.brandBlueColor,
      ),
      skipTextButton: const Text('Skip'),
      trailingFunction: () {
        ref.read(userServiceProvider).disableBoard().ignore();

        Navigator.pop(context);
      },
      trailing: const Text('Masuk'),
      background: const [
        SizedBox(),
        SizedBox(),
        SizedBox(),
      ],
      totalPage: 3,
      speed: 1.8,
      hasFloatingButton: true,
      pageBodies: [
        Column(
          children: <Widget>[
            SizedBox(height: 0.04.sh),
            SizedBox(
              height: 0.4.sh,
              child: Image.asset(
                'assets/images/Splash Image.png',
              ),
            ),
            SizedBox(height: 0.06.sh),
            Container(
              height: 0.24.sh,
              width: 1.sw,
              color: AppStyle.brandBlueColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Selamat datang di LAKSANA',
                    style: AppStyle.textTitleBOLDWhite,
                  ),
                  Text(
                    'LAKSANA adalah',
                    style: AppStyle.textBodyWhite,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 0.04.sh),
            SizedBox(
              height: 0.4.sh,
              child: Image.asset(
                'assets/images/Splash Image.png',
              ),
            ),
            SizedBox(height: 0.06.sh),
            Container(
              height: 0.24.sh,
              width: 1.sw,
              color: AppStyle.brandBlueColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'TITLE 2',
                      style: AppStyle.textTitleBOLDWhite,
                    ),
                    Text(
                      'SUBTITLE 2',
                      style: AppStyle.textBodyWhite,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          children: <Widget>[
            SizedBox(height: 0.04.sh),
            SizedBox(
              height: 0.4.sh,
              child: Image.asset(
                'assets/images/Splash Image.png',
              ),
            ),
            SizedBox(height: 0.06.sh),
            Container(
              height: 0.24.sh,
              width: 1.sw,
              color: AppStyle.brandBlueColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'TITLE 3',
                      style: AppStyle.textTitleBOLDWhite,
                    ),
                    Text(
                      'SUBTITLE 3',
                      style: AppStyle.textBodyWhite,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
