import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:provider/provider.dart';

import '../../../../../services/auth_service.dart';
import '../../../constants.dart';
import '../../../vm.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginVM>(
      builder: (context, LoginVM vm, _) {
        return Form(
          child: Column(
            children: [
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                cursorColor: kPrimaryColor,
                inputFormatters: [
                  vm.mask,
                ],
                onChanged: (email) {
                  vm.notifyListeners();
                },
                decoration: const InputDecoration(
                  hintText: "Telefon raqamingiz",
                  prefixIcon: Padding(
                    padding: EdgeInsets.all(defaultPadding),
                    child: Icon(Icons.person),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                child: TextFormField(
                  controller: vm.password,
                  textInputAction: TextInputAction.done,
                  obscureText: true,
                  cursorColor: kPrimaryColor,
                  decoration: const InputDecoration(
                    hintText: "Parolingiz",
                    prefixIcon: Padding(
                      padding: EdgeInsets.all(defaultPadding),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
              Hero(
                tag: "login_btn",
                child: ElevatedButton(
                  onPressed: vm.mask.isFill()
                      ? () async {
                          vm.change();
                          // await Future.delayed(Duration(seconds: 3));
                          await auth.signIn(
                            vm.mask.getUnmaskedText(),
                            vm.password.text,
                          );
                          vm.change();
                        }
                      : null,
                  child: Text(
                    "Login".toUpperCase(),
                  ),
                ),
              ),
              const SizedBox(height: defaultPadding),
            ],
          ),
        );
      },
    );
  }
}
