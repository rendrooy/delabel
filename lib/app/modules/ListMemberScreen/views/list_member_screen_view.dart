import 'package:delabel_v3/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../config/constants.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../controllers/list_member_screen_controller.dart';

class ListMemberScreenView extends GetView<ListMemberScreenController> {
  const ListMemberScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarView(
          title: DefText(controller.title.value, fontWeight: FontWeight.bold)
              .large,
          // centerTitle: true,
        ),
        body: ListView(
          padding: const EdgeInsets.all(kDefaultPadding),
          shrinkWrap: true,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DefText("List Member", fontWeight: FontWeight.bold)
                        .semiLarge,
                    IconButton(
                      onPressed: () async {
                        await Get.toNamed(Routes.FORM_MEMBER_SCREEN);
                        controller.getListMember();
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
                          controller.listMember.value.length,
                          (index) => DataRow(cells: [
                            DataCell(
                              DefText(controller
                                      .listMember.value[index].data.nik)
                                  .normal,
                            ),
                            DataCell(
                              DefText(controller
                                      .listMember.value[index].data.name)
                                  .normal,
                            ),
                            DataCell(
                              DefText(
                                // dateFormater(
                                controller
                                    .listMember.value[index].data.birthDate,
                                // ),
                              ).normal,
                            ),
                            DataCell(
                              DefText(controller
                                      .listMember.value[index].data.phoneNumber)
                                  .normal,
                            ),
                            DataCell(
                              DefText(controller
                                      .listMember.value[index].data.relation)
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
            )
          ],
        ));
  }
}
