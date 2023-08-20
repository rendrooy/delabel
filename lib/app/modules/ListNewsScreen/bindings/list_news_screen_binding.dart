import 'package:get/get.dart';

import '../controllers/list_news_screen_controller.dart';

class ListNewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListNewsScreenController>(
      () => ListNewsScreenController(),
    );
  }
}
