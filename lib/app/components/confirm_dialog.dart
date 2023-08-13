import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';

import '../config/constants.dart';
import 'defText.dart';
import 'primary_button.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String? massage;
  final VoidCallback onConfrim;

  const ConfirmDialog({
    Key? key,
    required this.title,
    this.massage,
    required this.onConfrim,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(7),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            DefText(title).large,
            if (massage != null)
              Column(
                children: [
                  const SizedBox(height: 10),
                  DefText(massage!, textAlign: TextAlign.center).normal,
                ],
              ),
            const SizedBox(height: 25),
            Row(
              children: [
                Expanded(
                  child: PrimaryButton(
                    text: DefText("Confirm").normal,
                    onPress: onConfrim,
                    fontSize: 10,
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: PrimaryButton(
                      text: DefText("Cancel").normal,
                      //  "Cancel",
                      fontSize: 10,
                      onPress: () {
                        Get.back();
                      }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
