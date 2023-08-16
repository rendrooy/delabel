import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/confirm_dialog.dart';
import '../../../components/defText.dart';
import '../../../config/constants.dart';
import '../../../routes/app_pages.dart';
import '../controllers/list_family_screen_controller.dart';

class ListFamilyScreenView extends GetView<ListFamilyScreenController> {
  const ListFamilyScreenView({Key? key}) : super(key: key);
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
              DefText("List Family", fontWeight: FontWeight.bold).semiLarge,
              IconButton(
                onPressed: () async {
                  await Get.toNamed(Routes.FORM_FAMILY_SCREEN);
                  // controller.getlistFamily();
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
                  DataColumn(
                    label: Text('No PBB'),
                  ),
                  DataColumn(
                    label: Text('Kode Pos'),
                  ),
                  DataColumn(
                    label: Text('Actions'),
                  ),
                ],
                rows: [
                  ...List.generate(
                    controller.listFamily.value.length,
                    (index) => DataRow(cells: [
                      DataCell(
                        DefText("${controller.listFamily.value[index].data.noKk}")
                            .normal,
                      ),
                      DataCell(
                        DefText(controller
                                .listFamily.value[index].data.familyHead)
                            .normal,
                      ),
                      DataCell(
                        DefText(
                          // dateFormater(
                          controller.listFamily.value[index].data.address,
                          // ),
                        ).normal,
                      ),
                      DataCell(
                        DefText("${controller.listFamily.value[index].data.noPbb ?? ""}")
                            .normal,
                      ),
                      DataCell(
                        DefText("${controller.listFamily.value[index].data.postalCode ?? ""}")
                            .normal,
                      ),
                      DataCell(
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {
                                Get.toNamed(
                                  Routes.FORM_FAMILY_SCREEN,
                                  arguments: controller.listFamily.value[index],
                                );
                                // controller.updateMember(
                                //   controller.listFamily.value[index],
                                // );
                              },
                              splashRadius: 20,
                              icon: const Icon(Icons.edit),
                            ),
                            IconButton(
                              onPressed: () {
                                Get.dialog(
                                  ConfirmDialog(
                                    title:
                                        "Yakin Menghapus ${controller.listFamily.value[index].data.noKk}",
                                    onConfrim: () {
                                      // controller.deleteMember(
                                      //   controller
                                      //       .listFamily.value[index].id,
                                      // );
                                      Get.back();
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
          // SingleChildScrollView(
          //   child: ,
          // )
        ],
      ),
    );
  }
}
