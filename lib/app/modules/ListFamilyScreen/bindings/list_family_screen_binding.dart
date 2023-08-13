import 'package:get/get.dart';

import '../controllers/list_family_screen_controller.dart';

class ListFamilyScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListFamilyScreenController>(
      () => ListFamilyScreenController(),
    );
  }
}
