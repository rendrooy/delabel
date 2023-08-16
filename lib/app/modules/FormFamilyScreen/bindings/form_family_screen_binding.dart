import 'package:get/get.dart';

import '../controllers/form_family_screen_controller.dart';

class FormFamilyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormFamilyScreenController>(
      () => FormFamilyScreenController(),
    );
  }
}
