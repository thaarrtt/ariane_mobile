import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ariane_mobile/common/widgets/loading_spinner.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
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
