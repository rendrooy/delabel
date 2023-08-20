import 'package:delabel_v3/app/components/defText.dart';
import 'package:delabel_v3/app/components/input_builder.dart';
import 'package:delabel_v3/app/components/primary_button.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  const RegisterScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('RegisterScreenView'),
          centerTitle: true,
        ),
        body: PageView(
          controller: controller.pageController,
          physics: const NeverScrollableScrollPhysics(),
          scrollDirection: Axis.horizontal,
          children: const [CheckNikComponent(), RegisterComponent()],
        ));
  }
}

class RegisterComponent extends GetView<RegisterScreenController> {
  const RegisterComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return FormBuilder(
      key: controller.formKeyRegister,
      child: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        children: [
          const SizedBox(height: kDefaultPadding),
          DefText("Hai ${controller.memberModel.value!.data.name}").extraLarge,
          const SizedBox(height: kDefaultPadding),
          const InputBuilderText(
            name: "email",
            label: "Email",
          ),
          const SizedBox(height: kDefaultPadding),
          InputBuilderText(
            name: "password",
            label: "Password",
            suffixIcon: IconButton(
                onPressed: () {}, icon: const Icon(Icons.visibility)),
          ),
          const SizedBox(height: kDefaultPadding),
          PrimaryButton(
            text: DefText('Register').normal,
            onPress: () {
              controller.firebaseAuth();
            },
          ),
        ],
      ),
    );
  }
}

class CheckNikComponent extends GetView<RegisterScreenController> {
  const CheckNikComponent({
    super.key,
    // required this.controller,
    // required this.controller,
  });

  // final RegisterScreenController controller;
  // final RegisterScreenController controller;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(kDefaultPadding),
      children: [
        InputBuilderText(
          name: "nik",
          label: "NIK",
          initialValue: "928374928374444",
          onChanged: (val) {
            controller.nik = val;
          },
        ),
        const SizedBox(height: kDefaultPadding),
        PrimaryButton(
          text: DefText('Check').normal,
          onPress: () => controller.checkNIK(),
        ),
      ],
    );
  }
}
