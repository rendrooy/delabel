import 'package:get/get.dart';

import '../controllers/form_member_screen_controller.dart';

class FormMemberScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormMemberScreenController>(
      () => FormMemberScreenController(),
    );
  }
}
