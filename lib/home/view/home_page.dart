import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/view/account_screen.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';
import 'package:ariane_mobile/home/view/chat_screen.dart';
import 'package:ariane_mobile/home/view/faq_screen.dart';
import 'package:ariane_mobile/home/view/dashboar_screen.dart';
import 'package:ariane_mobile/home/view/side_drawer_home.dart';

class Index extends StateNotifier<int> {
  Index() : super(0);
  set value(int index) => state = index;
}

final indexHomeProvider = StateNotifierProvider((ref) => Index());

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePage1State();
}

class _HomePage1State extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
  }

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController(keepPage: true);
    final advancedDrawerController = AdvancedDrawerController();
    final int menuIndex = ref.watch(indexHomeProvider) as int;

    return AdvancedDrawer(
      drawer: const SideDrawerBody(),
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueGrey, Colors.blueGrey.withOpacity(0.2)],
          ),
        ),
      ),
      controller: advancedDrawerController,
      animationCurve: Curves.fastOutSlowIn,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false, // Ensure gestures are not disabled
      childDecoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(16)),
      ),
      child: PopScope(
        canPop: false,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: Colors.white,
            body: PageView(
              clipBehavior: Clip.antiAliasWithSaveLayer,
              pageSnapping: true,
              allowImplicitScrolling: true,
              controller: controller,
              children: const [
                DashboardScreen(),
                TicketListPage(),
                FAQScreen(),
                AccountScreen(),
              ],
              onPageChanged: (i) {
                ref.read(indexHomeProvider.notifier).value = i;
              },
            ),
            extendBody: true,
            bottomNavigationBar: BottomAppBar(
              height: 0.08.sh,
              surfaceTintColor: Colors.white,
              color: Colors.grey[300],
              shape: const CircularNotchedRectangle(),
              notchMargin: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      ref.read(indexHomeProvider.notifier).value = 0;
                      controller.animateToPage(0,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.home,
                          color: menuIndex == 0
                              ? AppStyle.brandColor
                              : Colors.grey,
                          size: 20,
                        ),
                        Text('Home',
                            style: TextStyle(
                                color: menuIndex == 0
                                    ? AppStyle.brandColor
                                    : Colors.grey,
                                fontSize:
                                    12)), // Adjust this value to change the text size
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(indexHomeProvider.notifier).value = 1;
                      controller.animateToPage(1,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          color: menuIndex == 1
                              ? AppStyle.brandColor
                              : Colors.grey,
                          size: 20,
                        ),
                        Text('Chat',
                            style: TextStyle(
                                color: menuIndex == 1
                                    ? AppStyle.brandColor
                                    : Colors.grey,
                                fontSize:
                                    12.0)), // Adjust this value to change the text size
                      ],
                    ),
                  ),
                  SizedBox(width: 0.2.sw),
                  InkWell(
                    onTap: () {
                      ref.read(indexHomeProvider.notifier).value = 2;
                      controller.animateToPage(2,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.forum_outlined,
                          color: menuIndex == 2
                              ? AppStyle.brandColor
                              : Colors.grey,
                          size: 20,
                        ),
                        Text('FAQ',
                            style: TextStyle(
                                color: menuIndex == 2
                                    ? AppStyle.brandColor
                                    : Colors.grey,
                                fontSize:
                                    12.0)), // Adjust this value to change the text size
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      ref.read(indexHomeProvider.notifier).value = 3;
                      controller.animateToPage(3,
                          duration: const Duration(milliseconds: 200),
                          curve: Curves.fastLinearToSlowEaseIn);
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.person,
                          color: menuIndex == 3
                              ? AppStyle.brandColor
                              : Colors.grey,
                          size: 20,
                        ),
                        Text('Profile',
                            style: TextStyle(
                                color: menuIndex == 3
                                    ? AppStyle.brandColor
                                    : Colors.grey,
                                fontSize:
                                    12.0)), // Adjust this value to change the text size
                      ],
                    ),
                  ),
                ],
              ),
            ),
            floatingActionButton: SizedBox(
              width: 70, // adjust the width as needed
              height: 70, // adjust the height as needed
              child: FloatingActionButton(
                heroTag: "btn home",
                isExtended: true,
                backgroundColor: AppStyle.brandColor,
                onPressed: () {},
                shape: const CircleBorder(), // This makes the button circular
                mini: false,
                child: Icon(
                  Icons.card_giftcard,
                  color: Colors.white,
                  size: 26.h,
                ), // This makes the button a bit bigger
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          ),
        ),
      ),
    );
  }
}
