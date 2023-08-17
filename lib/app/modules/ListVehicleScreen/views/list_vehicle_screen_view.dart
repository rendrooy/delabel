import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/confirm_dialog.dart';
import '../../../components/defText.dart';
import '../../../config/constants.dart';
import '../controllers/list_vehicle_screen_controller.dart';

class ListVehicleScreenView extends GetView<ListVehicleScreenController> {
  const ListVehicleScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.title.value),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(kDefaultPadding),
        shrinkWrap: true,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DefText("List Vehicle", fontWeight: FontWeight.bold).semiLarge,
              IconButton(
                onPressed: () async {
                  // await Get.toNamed(Routes.FORM_FAMILY_SCREEN);
                  // controller.getlistVehicle();
                },
                splashRadius: 20,
                icon: const Icon(Icons.add),
              )
            ],
          ),
          const SizedBox(height: kDefaultPadding),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Obx(
              () => DataTable(
                columns: const [
                  DataColumn(
                    label: Text('No KK'),
                  ),
                  DataColumn(
                    label: Text('Kepala Keluarga'),
                  ),
                  DataColumn(
                    label: Text('Alamat'),
                  ),
                  // DataColumn(
                  //   label: Text('No PBB'),
                  // ),
                  // DataColumn(
                  //   label: Text('Kode Pos'),
                  // ),
                  DataColumn(
                    label: Text('Actions'),
                  ),
                ],
                rows: [
                  ...List.generate(
                    controller.listVehicle.value.length,
                    (index) => DataRow(cells: [
                      DataCell(
                        DefText(controller
                                .listVehicle.value[index].data.registrationNo)
                            .normal,
                      ),
                      DataCell(
                        DefText(controller
                                .listVehicle.value[index].data.product)
                            .normal,
                      ),
                      DataCell(
                        DefText(
                          controller.listVehicle.value[index].data.type,
                        ).normal,
                      ),
                      // DataCell(
                      //   DefText("${controller.listVehicle.value[index].data.noPbb ?? ""}")
                      //       .normal,
                      // ),
                      // DataCell(
                      //   DefText("${controller.listVehicle.value[index].data.postalCode ?? ""}")
                      //       .normal,
                      // ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              onPressed: () async {
                                // await Get.toNamed(
                                //   Routes.FORM_FAMILY_SCREEN,
                                //   arguments:
                                //       controller.listVehicle.value[index],
                                // );
                                // controller.getlistVehicle();
                              },
                              splashRadius: 20,
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.dialog(
                                  ConfirmDialog(
                                    title:
                                        "Yakin Menghapus ${controller.listVehicle.value[index].data.registrationNo}",
                                    onConfrim: () {
                                      Get.back();
                                      // controller.deleteFamily(
                                      // controller.listVehicle.value[index]);
                                    },
                                  ),
                                );
                              },
                              splashRadius: 20,
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        ),
                      ),
                    ]),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
