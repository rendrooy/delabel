import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../config/constants.dart';
import '../controllers/family_info_screen_controller.dart';

class TableVehicleFamilyComponent extends GetView<FamilyInfoScreenController> {
  const TableVehicleFamilyComponent({
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
            DefText("List Vehicle", fontWeight: FontWeight.bold).semiLarge,
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
                  label: Text('No Polisi'),
                ),
                DataColumn(
                  label: Text('Merk'),
                ),
                DataColumn(
                  label: Text('Type'),
                ),
                DataColumn(
                  label: Text('Actions'),
                ),
              ],
              rows: [
                ...List.generate(
                  controller.listVehicleFamily.value.length,
                  (index) => DataRow(cells: [
                    DataCell(
                      DefText(controller.listVehicleFamily.value[index].data
                              .registrationNo)
                          .normal,
                    ),
                    DataCell(
                      DefText(controller
                              .listVehicleFamily.value[index].data.product)
                          .normal,
                    ),
                    DataCell(
                      DefText(controller
                              .listVehicleFamily.value[index].data.type)
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
