import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:ariane_mobile/auth/handler/auth_handler.dart';
import 'package:ariane_mobile/auth/service/user_service.dart';
import 'package:ariane_mobile/common/utils/app_style.dart';
import 'package:ariane_mobile/common/widgets/action_button_styled.dart';
import 'package:ariane_mobile/home/view/boarding_dialog.dart';
import 'package:loggy/loggy.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class LoginPage extends StatefulHookConsumerWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginPage2State();
}

class _LoginPage2State extends ConsumerState<LoginPage> {
  @override
  void didChangeDependencies() {
    // showOnBoardingPageIfNeeded();
    super.didChangeDependencies();
  }

  showOnBoardingPageIfNeeded() {
    bool board = ref.read(userServiceProvider).isBoard();

    logInfo('boarding is $board');

    if (board) {
      showCupertinoModalBottomSheet<void>(
        context: context,
        builder: (_) => const OnBoardingScreen(),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final uname = useTextEditingController();
    final passwd = useTextEditingController();

    final obscurePasswd = useState(true);

    Future<void> login() => ref.read(authHandlerProvider.notifier).login(
          'myEmail',
          'myPassword',
        );

    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        height: 1.sh,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  SizedBox(
                    height: 0.4.sh,
                    width: 1.sw,
                    child: Column(
                      children: [
                        SizedBox(height: 0.14.sh),
                        Center(
                          child: Image.asset(
                            'assets/images/logo-no-background.png',
                            width: 0.8.sw,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 0.9.sw,
                      child: TextField(
                        controller: uname,
                        decoration: InputDecoration(
                          labelStyle: AppStyle.smallTextGrey,
                          labelText: 'email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 0.9.sw,
                      child: TextField(
                        controller: passwd,
                        obscureText: obscurePasswd.value,
                        decoration: InputDecoration(
                          labelStyle: AppStyle.smallTextGrey,
                          labelText: 'passwd',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide.none,
                          ),
                          filled: true,
                          fillColor: Colors.grey[300],
                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePasswd.value
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              final curr = obscurePasswd.value;

                              obscurePasswd.value = !curr;
                            },
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Lupa passwd?',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 0.08.sh),
                    ActionButtonStyled(
                      width: 0.9.sw,
                      onPressed: login,
                      btnColor: AppStyle.brandColor,
                      label: Center(
                        child: Text(
                          'Login',
                          style: AppStyle.textSubTitleWhite,
                        ),
                      ),
                    ),
                    SizedBox(height: 0.02.sh),
                    SizedBox(
                      width: 1.sw,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'belum punya akun?',
                            style: AppStyle.textSubTitleGrey,
                          ),
                          SizedBox(width: 0.01.sw),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              'Daftar sekarang',
                              style: AppStyle.textSubTitleBOLD,
                            ),
                          ),
                        ],
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
