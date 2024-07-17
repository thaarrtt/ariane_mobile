import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DashBoardScreenHeader extends StatelessWidget {
  final int gemsBalance;
  final VoidCallback onProfileTap;
  final VoidCallback onTopUpTap;

  const DashBoardScreenHeader({
    super.key,
    required this.gemsBalance,
    required this.onProfileTap,
    required this.onTopUpTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 0.06.sh, // Reduced height
      padding:
          EdgeInsets.symmetric(horizontal: 12.w), // Reduced horizontal padding
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: onProfileTap,
            child: CircleAvatar(
              radius: 16.r, // Reduced radius
              backgroundColor: Colors.white,
              child: Icon(Icons.person,
                  color: Colors.blue, size: 20.r), // Reduced icon size
            ),
          ),
          GestureDetector(
            onTap: onTopUpTap,
            child: Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 8.w, vertical: 4.h), // Reduced padding
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius:
                    BorderRadius.circular(16.r), // Reduced border radius
              ),
              child: Row(
                children: [
                  SvgPicture.asset(
                    'assets/icons/diamond.svg',
                    width: 18.w, // Reduced width
                    height: 18.h, // Reduced height
                  ),
                  SizedBox(width: 4.w), // Reduced spacing
                  Text(
                    '$gemsBalance',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                      fontSize: 14.sp, // Reduced font size
                    ),
                  ),
                  SizedBox(width: 4.w), // Reduced spacing
                  Icon(Icons.add_circle_outline,
                      color: Colors.blue, size: 16.r), // Reduced icon size
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
