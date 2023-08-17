import 'package:delabel_v3/app/models/family_model.dart';
import 'package:delabel_v3/app/models/vehicle_model.dart';
import 'package:delabel_v3/app/services/family_service.dart';
import 'package:delabel_v3/app/services/vehicle_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../components/input_builder.dart';
import '../../../components/secondary_button.dart';
import '../../../config/constants.dart';

class ListVehicleScreenController extends GetxController {
  //TODO: Implement ListVehicleScreenController

  var listVehicle = <VehicleModel>[].obs;
  var listFamily = <FamilyModel>[].obs;
  var title = 'List Vehicle'.obs;
  var formVehicleKey = GlobalKey<FormBuilderState>();
  final dataVehicleModel = Rxn<DataVehicleModel>();

  final count = 0.obs;
  @override
  void onInit() {
    getListVehicle();
    getListFamily();
    super.onInit();
  }

  // void addVehicle(VehicleModel vehicle) {
  //   listVehicle.add(vehicle);
  // }

  void bottomSheetFormVehicle({
    VehicleModel? vehicle,
  }) async {
    Get.bottomSheet(Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(kDefaultPadding),
          topRight: Radius.circular(kDefaultPadding),
        ),
      ),
      child: FormBuilder(
          key: formVehicleKey,
          child: ListView(
            shrinkWrap: true,
            children: [
              const SizedBox(height: kDefaultPadding / 2),
              InputBuilderText(
                name: 'brand',
                label: 'Brand',
                initialValue: vehicle?.data.brand ?? "",
              ),
              const SizedBox(height: kDefaultPadding),
              InputBuilderText(
                name: 'registration_no',
                label: 'No. Registrasi',
                initialValue: vehicle?.data.registrationNo ?? "",
              ),
              const SizedBox(height: kDefaultPadding),
              InputBuilderText(
                name: "product",
                label: "Product",
                initialValue: vehicle?.data.product ?? "",
              ),
              const SizedBox(height: kDefaultPadding),
              FormBuilderDropdown(
                initialValue: vehicle?.data.type ?? "",
                decoration: const InputDecoration(
                  labelText: "Type",
                ),
                name: 'type',
                items: ['Motor', 'Mobil']
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e),
                        ))
                    .toList(),
              ),
              const SizedBox(height: kDefaultPadding),
              FormBuilderDropdown(
                initialValue: vehicle?.data.familyId ?? "",
                decoration: const InputDecoration(
                  labelText: "Family",
                ),
                name: 'family_id',
                items: listFamily.value
                    .map((e) => DropdownMenuItem(
                          value: e.data.id,
                          child: Text(e.data.familyHead),
                        ))
                    .toList(),
              ),
              const SizedBox(height: kDefaultPadding),
              SecondaryButton(
                text: DefText("Simpan").normal,
                onPress: () {
                  submitVehicle();
                },
              )
            ],
          )),
    ));
  }

  void submitVehicle() async {
    if (!formVehicleKey.currentState!.saveAndValidate()) return;
    var data = formVehicleKey.currentState!.value;
    dataVehicleModel.value = DataVehicleModel.fromJson(data);
    var res = await VehicleServices().insertData(
      value: dataVehicleModel.value!.toJson(),
    );
    Get.back();
    getListVehicle();
  }

  void getListFamily() async {
    var res = await FamilyService().getAllData();
    listFamily.value = res.map((e) => FamilyModel.fromJson(e)).toList();
  }

  void getListVehicle() async {
    var res = await VehicleServices().getAllData();
    listVehicle.value = res.map((e) => VehicleModel.fromJson(e)).toList();
  }

  void increment() => count.value++;
}
