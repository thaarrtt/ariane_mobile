import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';

class HomeIconBtn extends StatelessWidget {
  final VoidCallback onTap;
  final String icon;
  final String name;
  final double? whiteSpace;

  const HomeIconBtn({
    super.key,
    required this.onTap,
    required this.icon,
    required this.name,
    this.whiteSpace,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        width: 0.24.sw,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
            ),
            if (whiteSpace != null) SizedBox(height: whiteSpace),
            Text(
              name,
              style: AppStyle.textBody,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
