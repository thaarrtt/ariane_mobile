import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';

class ListStyle extends StatelessWidget {
  const ListStyle({
    super.key,
    required this.name,
    required this.onClick,
  });

  final String name;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          height: 0.04.sh,
          width: 0.85.sw,
          child: Padding(
            padding: EdgeInsets.only(left: 0.02.sw, right: 0.02.sw),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(name, style: AppStyle.smallText),
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppStyle.grayBrandColor,
                  size: 16.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ListStyle2 extends StatelessWidget {
  const ListStyle2({
    super.key,
    required this.icon,
    required this.name,
    required this.subtitle,
    required this.trailing,
    required this.onClick,
  });

  final String icon;
  final String name;
  final String subtitle;
  final String trailing;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
      child: InkWell(
        onTap: onClick,
        child: SizedBox(
          height: 0.06.sh,
          width: 0.85.sw,
          child: Padding(
            padding: EdgeInsets.only(left: 0.04.sw, right: 0.04.sw),
            child: Row(
              children: [
                SvgPicture.asset(icon, height: 20.h),
                SizedBox(width: 0.06.sw),
                SizedBox(
                  width: 0.45.sw,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(name, style: AppStyle.textBodyBOLD),
                      Text(subtitle, style: AppStyle.smallTextGrey),
                    ],
                  ),
                ),
                const Spacer(),
                Text(
                  trailing,
                  style: AppStyle.microTextBlue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
