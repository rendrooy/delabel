import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../components/secondary_button.dart';
import '../../../config/constants.dart';
import '../../../util/custom_responsive.dart';
import '../components/form_login.dart';
import '../components/logo.dart';
import '../controllers/login_screen_controller.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomResponsive(
      desktop: _desktop(),
      tablet: _tablet(),
      mobile: _mobile(),
    );
  }

  Widget _desktop() {
    return Scaffold(
      body: Center(
        child: Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Container(
                  color: kSecondaryColor,
                  height: double.infinity,
                  alignment: Alignment.center,
                  child: const Logo(),
                ),
              ),
              Expanded(
                  child: Container(
                padding: const EdgeInsets.all(kDefaultPadding * 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: SecondaryButton(
                            text: DefText("Sign in with Google").normal,
                            icon: Icons.email_outlined,
                            onPress: () {},
                          ),
                        ),
                        const SizedBox(width: kDefaultPadding),
                        Expanded(
                          child: SecondaryButton(
                            text: DefText("Sign in with Facebook").normal,
                            icon: Icons.facebook_sharp,
                            onPress: () {},
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                        DefText("Or with Email").semiSmall,
                        const Divider(
                          thickness: 1,
                          color: Colors.white,
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const FormLogin(),
                  ],
                ),
              )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _tablet() {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(32.0),
          constraints: const BoxConstraints(maxWidth: 500),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Logo(),
                const SizedBox(height: kDefaultPadding),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: SecondaryButton(
                        text: DefText("Sign in with Google").normal,
                        icon: Icons.email_outlined,
                        onPress: () {},
                      ),
                    ),
                    const SizedBox(width: kDefaultPadding),
                    Expanded(
                      child: SecondaryButton(
                        text: DefText("Sign in with Facebook").normal,
                        icon: Icons.facebook_sharp,
                        onPress: () {},
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                    DefText("Or with Email").semiSmall,
                    const Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                const FormLogin(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _mobile() {
    return Scaffold(
        body: Center(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 300),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Logo(),
              const SizedBox(height: kDefaultPadding),
              SecondaryButton(
                text: DefText("Sign in with Google").normal,
                icon: Icons.email_outlined,
                onPress: () {},
              ),
              const SizedBox(height: kDefaultPadding),
              SecondaryButton(
                text: DefText("Sign in with Facebook").normal,
                icon: Icons.facebook_sharp,
                onPress: () {},
              ),
              const SizedBox(height: kDefaultPadding),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                  DefText("Or with Email").semiSmall,
                  const Divider(
                    thickness: 1,
                    color: Colors.white,
                  ),
                ],
              ),
              const SizedBox(height: kDefaultPadding),
              const FormLogin()
            ],
          ),
        ),
      ),
    ));
  }
}
