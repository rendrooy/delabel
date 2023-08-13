import 'package:get/get.dart';

import '../controllers/personal_info_screen_controller.dart';

class PersonalInfoScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PersonalInfoScreenController>(
      () => PersonalInfoScreenController(),
    );
  }
}
