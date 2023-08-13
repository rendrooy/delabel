import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomResponsive extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const CustomResponsive(
      {Key? key,
      required this.desktop,
      required this.mobile,
      required this.tablet})
      : super(key: key);

  static bool isDesktop() => Get.width >= 1100;
  static bool isTablet() => Get.width >= 800 && Get.width < 1100;
  static bool isMobile() => Get.width < 800;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (Get.width >= 1100.0) {
          debugPrint("desktop: ${Get.width}");

          return desktop;
        } else if (Get.width >= 800 && Get.width < 1100.0) {
          debugPrint("tablet: ${Get.width}");

          return tablet;
        } else {
          debugPrint("mobile: ${Get.width}");

          return mobile;
        }
      },
    );
  }
}
