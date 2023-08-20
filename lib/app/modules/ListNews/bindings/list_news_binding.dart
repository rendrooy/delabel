import 'package:get/get.dart';

import '../controllers/list_news_controller.dart';

class ListNewsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListNewsController>(
      () => ListNewsController(),
    );
  }
}
