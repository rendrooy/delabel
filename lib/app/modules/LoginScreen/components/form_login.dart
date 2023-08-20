// import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';

// import 'package:demo_responsive/app/modules/loginScreen/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

// import '../../../components/defText.dart';
import '../../../components/defText.dart';
import '../../../components/input_builder.dart';
import '../../../components/primary_button.dart';
// import '../../../config/constans.dart';
import '../../../config/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_screen_controller.dart';

class FormLogin extends GetView<LoginScreenController> {
  const FormLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKeyLogin,
      child: Column(
        children: [
          const InputBuilderText(
            name: "email",
            label: "Email",
            initialValue: "rendrooy231@gmail.com",
          ),
          const SizedBox(height: kDefaultPadding),
          const InputBuilderText(
            name: "password",
            label: "Password",
            initialValue: "12345678",
          ),
          const SizedBox(height: kDefaultPadding),
          Align(
            alignment: Alignment.centerRight,
            child: DefText(
              "Forgot Password",
              fontWeight: FontWeight.w600,
              textAlign: TextAlign.right,
            ).normal,
          ),
          const SizedBox(height: kDefaultPadding),
          PrimaryButton(
            text: DefText("Sign in").normal,
            onPress: () {
              controller.firebaseAuth();
              // controller.login();
            },
          ),
          // const SizedBox(height: kDefaultPadding),
          PrimaryButton(
            text: DefText("Register").normal,
            onPress: () {
              Get.toNamed(Routes.REGISTER_SCREEN);
              // controller.firebaseAuth();
              // controller.login();
            },
          )
        ],
      ),
    );
  }
}
