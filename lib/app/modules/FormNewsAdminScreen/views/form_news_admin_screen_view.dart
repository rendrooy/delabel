import 'dart:io';

import 'package:delabel_v3/app/components/defText.dart';
import 'package:delabel_v3/app/components/input_builder.dart';
import 'package:delabel_v3/app/components/secondary_button.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../controllers/form_news_admin_screen_controller.dart';

class FormNewsAdminScreenView extends GetView<FormNewsAdminScreenController> {
  const FormNewsAdminScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('FormNewsAdminScreenView'),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: controller.formNewsKey,
                child: ListView(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  children: [
                    const InputBuilderText(name: 'title', label: 'Title'),
                    const SizedBox(height: kDefaultPadding),
                    const InputBuilderText(name: 'content', label: 'Content'),
                    const SizedBox(height: kDefaultPadding),
                    Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      decoration: BoxDecoration(
                        color: secondaryColor,
                        boxShadow: [kDefaultShadow],
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Column(
                        children: [
                          Obx(
                            () => GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3,
                                mainAxisSpacing: kDefaultPadding,
                                crossAxisSpacing: kDefaultPadding,
                              ),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.file(
                                    File(
                                      controller.listImage.value[index].path,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                );
                              },
                              itemCount: controller.listImage.value.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                          const SizedBox(height: kDefaultPadding),
                          SecondaryButton(
                            text: DefText("Upload Photo").normal,
                            onPress: () {
                              controller.uploadImage();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: SecondaryButton(
                text: DefText("Submit").normal,
                onPress: () {
                  controller.submitNews();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
