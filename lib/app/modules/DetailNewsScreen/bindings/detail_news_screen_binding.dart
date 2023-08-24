import 'package:get/get.dart';

import '../controllers/detail_news_screen_controller.dart';

class DetailNewsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailNewsScreenController>(
      () => DetailNewsScreenController(),
    );
  }
}
