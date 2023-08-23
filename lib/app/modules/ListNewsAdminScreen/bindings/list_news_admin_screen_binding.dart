import 'package:get/get.dart';

import '../controllers/list_news_admin_screen_controller.dart';

class ListNewsAdminScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListNewsAdminScreenController>(
      () => ListNewsAdminScreenController(),
    );
  }
}
