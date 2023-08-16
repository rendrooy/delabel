import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../config/constants.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../controllers/personal_info_screen_controller.dart';

class PersonalInfoScreenView extends GetView<PersonalInfoScreenController> {
  const PersonalInfoScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<PersonalInfoScreenController>(builder: (controller) {
      return Scaffold(
        appBar: AppBarView(
          title: DefText(controller.title.value, fontWeight: FontWeight.bold)
              .large,
        ),
        body: controller.obx(
          (state) => ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  boxShadow: [kDefaultShadow],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefText("Info Pribadi", fontWeight: FontWeight.bold)
                            .semiLarge,
                        GestureDetector(
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          onTap: () {},
                        )
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "Name",
                      value: controller.memberModel.value?.data.name,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "NIK",
                      value: controller.memberModel.value?.data.nik,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "Alamat",
                      value: controller.memberModel.value?.data.address,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "No HP",
                      value: controller.memberModel.value?.data.phoneNumber,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "Jenis Kelamin",
                      value: controller.memberModel.value?.data.sex,
                    ),
                    // const SizedBox(height: kDefaultPadding),
                    // itemRow(
                    //   field: "Pendidikan",
                    //   value: controller.memberModel.value?.data.education,
                    // ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "Pekerjaan",
                      value: controller.memberModel.value?.data.profession,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              Container(
                padding: const EdgeInsets.all(kDefaultPadding),
                decoration: BoxDecoration(
                  color: secondaryColor,
                  boxShadow: [kDefaultShadow],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefText("Info Organisasi", fontWeight: FontWeight.bold)
                            .semiLarge,
                        GestureDetector(
                          child: const Icon(
                            Icons.edit,
                            size: 20,
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "Name",
                      value: controller.organizationModel.value?.data.nameOrg,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "NIK",
                      value: controller.organizationModel.value?.data.position,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "Alamat",
                      value: controller.organizationModel.value?.data.typeOrg,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    itemRow(
                      field: "No HP",
                      value:
                          controller.organizationModel.value?.data.phoneNumber,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: DefText("Periode").normal,
                        ),
                        const SizedBox(width: kDefaultPadding),
                        Expanded(
                          flex: 2,
                          child: DefText(
                                  ": ${controller.organizationModel.value?.data.period[0]} - ${controller.organizationModel.value?.data.period[1]}")
                              .normal,
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          onLoading: const Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    });
  }

  Row itemRow({required field, required value}) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: DefText(field).normal,
        ),
        const SizedBox(width: kDefaultPadding),
        Expanded(
          flex: 2,
          child: DefText(": $value", maxLine: 3).normal,
        ),
      ],
    );
  }
}
