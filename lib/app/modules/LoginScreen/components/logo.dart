// import 'package:demo_responsive/app/modules/loginScreen/controllers/login_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../util/custom_responsive.dart';
import '../controllers/login_screen_controller.dart';

class Logo extends GetView<LoginScreenController> {
  const Logo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool _isDesktop = CustomResponsive.isDesktop();
    final bool _isMobile = CustomResponsive.isMobile();
    final bool _isTablet = CustomResponsive.isTablet();

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        FlutterLogo(size: _isMobile ? 100 : 200),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: _isMobile
              ? DefText(
                  controller.title,
                  textAlign: TextAlign.center,
                ).large
              : DefText(
                  controller.title,
                  textAlign: TextAlign.center,
                ).extraLarge,
        )
      ],
    );
  }
}
