import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/handler/auth_handler.dart';
import 'package:ariane_mobile/auth/view/list_style.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';
import 'package:ariane_mobile/common/widgets/list_tile_styled.dart';

class AccountScreen extends ConsumerWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SizedBox(
        height: 1.sh,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              expandedHeight: 0.25.sh,
              floating: false,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(
                      'https://picsum.photos/800/600?random=1',
                      fit: BoxFit.cover,
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) return child;
                        return const Center(child: CircularProgressIndicator());
                      },
                      errorBuilder: (context, error, stackTrace) =>
                          const Icon(Icons.error),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.transparent,
                            Colors.black.withOpacity(0.7),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 20.h,
                      left: 20.w,
                      child: Row(
                        children: [
                          CircleAvatar(
                            radius: 40.r,
                            backgroundImage:
                                const NetworkImage('https://i.pravatar.cc/300'),
                            onBackgroundImageError: (exception, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                          SizedBox(width: 20.w),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Nama Account',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5.h),
                              Text(
                                'informasi account',
                                style: TextStyle(
                                  color: Colors.white70,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                decoration: BoxDecoration(
                  color: AppStyle.grayBrandColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(36),
                    topRight: Radius.circular(36),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(height: 0.02.sh),
                    Padding(
                      padding: EdgeInsets.only(left: 0.08.sw),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'PROFILE',
                          style: AppStyle.textBodyGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      width: 0.9.sw,
                      child: Column(
                        children: [
                          const Divider(
                            height: 0,
                            indent: 0,
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                          ListStyle(
                            name: 'Ubah Profile',
                            onClick: () {},
                          ),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          ListStyle(
                            name: 'Ubah Bahasa',
                            onClick: () {},
                          ),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          ListStyle(
                            name: 'Ubah Password',
                            onClick: () {},
                          ),
                          const Divider(
                            height: 0,
                            indent: 0,
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    Padding(
                      padding: EdgeInsets.only(left: 0.08.sw),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'PROFILE SECTION 2',
                          style: AppStyle.textBodyGrey,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                      ),
                      width: 0.9.sw,
                      child: Column(
                        children: [
                          const Divider(
                            height: 0,
                            indent: 0,
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                          ListStyle(
                            name: 'Pusat Bantuan',
                            onClick: () {},
                          ),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          ListStyle(
                            name: 'Syarat dan Ketentuan',
                            onClick: () {},
                          ),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          ListStyle(
                            name: 'Privasi',
                            onClick: () {},
                          ),
                          Divider(
                              height: 0,
                              indent: 0,
                              thickness: 2,
                              color: AppStyle.grayBrandColor),
                          ListStyle(
                            name: 'Tentang',
                            onClick: () async {},
                          ),
                          const Divider(
                            height: 0,
                            indent: 0,
                            thickness: 1,
                            color: Colors.transparent,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    ListTileStyled(
                      onTap: ref.read(authHandlerProvider.notifier).logout,
                      title: Text('Logout', style: AppStyle.smallTextRed),
                      icon: Icon(
                        Icons.logout_outlined,
                        color: Colors.red,
                        size: 16.h,
                      ),
                    ),
                    SizedBox(height: 0.04.sh),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
