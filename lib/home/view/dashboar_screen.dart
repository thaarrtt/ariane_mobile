import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/home/view/dash_screen_header.dart';
import 'package:ariane_mobile/home/widgets/fan_carousel.dart';
import 'package:ariane_mobile/home/widgets/home_icon_btn.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const DashBoardScreenHeader(),
          SizedBox(height: 0.02.sh),
          SizedBox(
            height: 0.5.sh,
            width: 0.8.sw,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 79.png',
                      name: 'Info Berita',
                      whiteSpace: 10.h,
                    ),
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 80.png',
                      name: 'Info Lokasi Layanan',
                    ),
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 81.png',
                      name: 'Riwayat Perdata',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 82.png',
                      name: 'Pengambilan Tilang',
                    ),
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 83.png',
                      name: 'Informasi Akun',
                    ),
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 84.png',
                      name: 'Pendaftaran Layanan',
                      whiteSpace: 10.h,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 85.png',
                      name: 'Layanan 1',
                    ),
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 81.png',
                      name: 'Layanan 2',
                      whiteSpace: 5.h,
                    ),
                    HomeIconBtn(
                      onTap: () {},
                      icon: 'assets/icons/Rectangle 87.png',
                      name: 'Layanan 3',
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 0.04.sh),
          const NewsCarousel(),
          SizedBox(height: 0.16.sh),
        ],
      ),
    );
  }
}
