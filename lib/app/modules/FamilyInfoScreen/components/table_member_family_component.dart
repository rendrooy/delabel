import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../config/constants.dart';
import '../../../util/func_util.dart';
import '../controllers/family_info_screen_controller.dart';

class TableMemberFamilyComponent extends GetView<FamilyInfoScreenController> {
  const TableMemberFamilyComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            DefText("Family Member", fontWeight: FontWeight.bold).semiLarge,
            IconButton(
              onPressed: () {},
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
                  label: Text('NIK'),
                ),
                DataColumn(
                  label: Text('Name'),
                ),
                DataColumn(
                  label: Text('BIrth Date'),
                ),
                DataColumn(
                  label: Text('Phone Number'),
                ),
                DataColumn(
                  label: Text('Relation'),
                ),
                DataColumn(
                  label: Text('Actions'),
                ),
              ],
              rows: [
                ...List.generate(
                  controller.listMemberFamily.value.length,
                  (index) => DataRow(cells: [
                    DataCell(
                      DefText("${controller.listMemberFamily.value[index].data.nik}")
                          .normal,
                    ),
                    DataCell(
                      DefText(controller
                              .listMemberFamily.value[index].data.name)
                          .normal,
                    ),
                    DataCell(
                      DefText(
                        dateFormater(
                          controller
                              .listMemberFamily.value[index].data.birthDate,
                        ),
                      ).normal,
                    ),
                    DataCell(
                      DefText("${controller.listMemberFamily.value[index].data.phoneNumber}")
                          .normal,
                    ),
                    DataCell(
                      DefText(controller.listMemberFamily.value[index].data
                              .familyRelation)
                          .normal,
                    ),
                    DataCell(
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            splashRadius: 20,
                            icon: const Icon(Icons.edit),
                          ),
                          IconButton(
                            onPressed: () {},
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
        ),
      ],
    );
  }
}
