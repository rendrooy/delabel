import 'package:get/get.dart';

import '../controllers/list_vehicle_screen_controller.dart';

class ListVehicleScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ListVehicleScreenController>(
      () => ListVehicleScreenController(),
    );
  }
}
