import 'package:delabel_v3/app/config/constants.dart';
import 'package:delabel_v3/app/modules/FamilyInfoScreen/components/table_vehicle_family_componet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../components/table_member_family_component.dart';
import '../controllers/family_info_screen_controller.dart';

class FamilyInfoScreenView extends GetView<FamilyInfoScreenController> {
  const FamilyInfoScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<FamilyInfoScreenController>(builder: (controller) {
      return Scaffold(
        appBar: AppBarView(
          title: DefText(controller.title.value, fontWeight: FontWeight.bold)
              .large,
        ),
        body: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            controller.obx(
              (state) => Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  decoration: BoxDecoration(
                    color: secondaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      itemRow(
                        field: "No Kartu Keluarga",
                        value: controller.familyModel.value!.data.noKk,
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      itemRow(
                        field: "Alamat",
                        value: controller.familyModel.value!.data.addressKk,
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      itemRow(
                        field: "RT",
                        value: controller.familyModel.value!.data.rt,
                      ),
                      // const SizedBox(height: kDefaultPadding / 2),
                      // itemRow(
                      //   field: "Alamat",
                      //   value: controller.familyModel.value!.data.addressKk,
                      // ),
                      const SizedBox(height: kDefaultPadding / 2),
                      itemRow(
                        field: "No PBB",
                        value: controller.familyModel.value!.data.noPbb,
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      itemRow(
                        field: "Status Administrasi",
                        value: controller.familyModel.value!.data.statusAdm
                            ? "Ya"
                            : "Tidak",
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                      itemRow(
                        field: "Status Domisili",
                        value: controller.familyModel.value!.data.statusDom
                            ? "Ya"
                            : "Tidak",
                      ),
                      const SizedBox(height: kDefaultPadding / 2),
                    ],
                  )),
              onLoading: const Center(child: CircularProgressIndicator()),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            const TableMemberFamilyComponent(),
            const SizedBox(height: kDefaultPadding / 2),
            const TableVehicleFamilyComponent(),
          ],
        ),
      );
    });
  }

  Row itemRow({required value, required field}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DefText(field, fontWeight: FontWeight.bold).normal,
        ),
        DefText(":").normal,
        const SizedBox(width: kDefaultPadding / 2),
        Expanded(
          flex: 2,
          child: DefText("$value").normal,
        ),
      ],
    );
  }
}
