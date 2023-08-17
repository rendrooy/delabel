import 'package:delabel_v3/app/models/vehicle_model.dart';
import 'package:delabel_v3/app/services/vehicle_service.dart';
import 'package:get/get.dart';

class ListVehicleScreenController extends GetxController {
  //TODO: Implement ListVehicleScreenController

  var listVehicle = <VehicleModel>[].obs;
  var title = 'List Vehicle'.obs;

  final count = 0.obs;
  @override
  void onInit() {
    getListVehicle();
    super.onInit();
  }

  // void addVehicle(VehicleModel vehicle) {
  //   listVehicle.add(vehicle);
  // }

  void getListVehicle() async {
    var res = await VehicleServices().getAllData();
    listVehicle.value = res.map((e) => VehicleModel.fromJson(e)).toList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
