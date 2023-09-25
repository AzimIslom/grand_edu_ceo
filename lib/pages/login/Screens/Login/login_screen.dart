import 'package:flutter/material.dart';
import 'package:grand_edu_ceo/pages/login/constants.dart';
import 'package:grand_edu_ceo/pages/login/vm.dart';
import 'package:provider/provider.dart';

import '../../components/background.dart';
import '../../responsive.dart';
import 'components/login_form.dart';
import 'components/login_screen_top_image.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginVM>(
      create: (_) => LoginVM(),
      child: Consumer<LoginVM>(
        builder: (context, LoginVM vm, _) {
          return Stack(
            children: [
              IgnorePointer(
                ignoring: vm.isLoading,
                child: const Background(
                  child: SingleChildScrollView(
                    child: Responsive(
                      mobile: MobileLoginScreen(),
                      desktop: Row(
                        children: [
                          Expanded(
                            child: LoginScreenTopImage(),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 450,
                                  child: LoginForm(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              vm.isLoading
                  ? Container(
                      color: Colors.black.withOpacity(.3),
                      alignment: Alignment.center,
                      child: const Center(
                        child: SizedBox(
                          height: 50,
                          width: 50,
                          child: CircularProgressIndicator(
                            color: kPrimaryColor,
                          ),
                        ),
                      ),
                    )
                  : const SizedBox.shrink(),
            ],
          );
        },
      ),
    );
  }
}

class MobileLoginScreen extends StatelessWidget {
  const MobileLoginScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const LoginScreenTopImage(),
        Row(
          children: const [
            Spacer(),
            Expanded(
              flex: 8,
              child: LoginForm(),
            ),
            Spacer(),
          ],
        ),
      ],
    );
  }
}
