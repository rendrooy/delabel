import 'package:get/get.dart';

import '../controllers/list_member_screen_controller.dart';

class ListMemberScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListMemberScreenController>(
      () => ListMemberScreenController(),
    );
  }
}
