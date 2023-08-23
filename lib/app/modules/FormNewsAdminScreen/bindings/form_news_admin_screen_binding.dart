import 'package:get/get.dart';

import '../controllers/form_news_admin_screen_controller.dart';

class FormNewsAdminScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FormNewsAdminScreenController>(
      () => FormNewsAdminScreenController(),
    );
  }
}
