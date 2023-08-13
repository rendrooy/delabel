import 'package:get/get.dart';

import '../controllers/family_info_screen_controller.dart';

class FamilyInfoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FamilyInfoScreenController>(
      () => FamilyInfoScreenController(),
    );
  }
}
