import 'package:get/get.dart';

import '../controllers/settings_screen_controller.dart';

class SettingsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SettingsScreenController>(
      () => SettingsScreenController(),
    );
  }
}
