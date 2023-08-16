import 'package:delabel_v3/app/components/input_builder.dart';
import 'package:delabel_v3/app/components/primary_button.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../controllers/form_family_screen_controller.dart';

class FormFamilyScreenView extends GetView<FormFamilyScreenController> {
  const FormFamilyScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: DefText('FormFailyScreenView').large,
      ),
      body: Obx(
        () => FormBuilder(
          key: controller.familyFormKey,
          child: ListView(
            padding: const EdgeInsets.all(kDefaultPadding),
            children: [
              InputBuilderText(
                name: 'no_kk',
                hint: "No KK",
                initialValue:
                    "${controller.familyModel.value?.data.noKk ?? ""}",
              ),
              const SizedBox(height: kDefaultPadding),
              InputBuilderText(
                name: 'no_pbb',
                hint: "No PBB",
                initialValue:
                    "${controller.familyModel.value?.data.noPbb ?? ""}",
              ),
              const SizedBox(height: kDefaultPadding),
              InputBuilderText(
                name: 'postal_code',
                hint: "Kode Pos",
                initialValue:
                    "${controller.familyModel.value?.data.postalCode ?? ""}",
              ),
              const SizedBox(height: kDefaultPadding),
              FormBuilderDropdown(
                initialValue: controller.familyModel.value?.data.rt,
                decoration: const InputDecoration(
                  hintText: "RT",
                ),
                name: "rt",
                items: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.toString()),
                        ))
                    .toList(),
              ),
              const SizedBox(height: kDefaultPadding),
              InputBuilderText(
                name: 'address',
                hint: "Alamat",
                initialValue: controller.familyModel.value?.data.address,
              ),
              const SizedBox(height: kDefaultPadding),
              FormBuilderCheckbox(
                contentPadding: EdgeInsets.zero,
                name: 'status_adm',
                initialValue:
                    controller.familyModel.value?.data.statusAdm ?? false,
                title: DefText("Status Administrasi").normal,
              ),
              FormBuilderCheckbox(
                contentPadding: EdgeInsets.zero,
                name: 'status_dom',
                initialValue:
                    controller.familyModel.value?.data.statusDom ?? false,
                title: DefText("Status Domisili").normal,
              ),
              const SizedBox(height: kDefaultPadding),
              Obx(
                () => controller.familyModel.value == null
                    ? PrimaryButton(
                        height: 50,
                        text: DefText("Submit Keluarga").normal,
                        onPress: () {
                          controller.submitKeluarga();
                        },
                      )
                    : PrimaryButton(
                        height: 50,
                        text: DefText("Pilih Anggota Keluarga").normal,
                        onPress: () {
                          controller.bottomSheetAddMember();
                        },
                      ),
              ),
              const SizedBox(height: kDefaultPadding),
              ...List.generate(
                controller.listSelectedMember.value.length,
                (index) => Padding(
                  padding: const EdgeInsets.only(bottom: kDefaultPadding),
                  child: ListTile(
                    tileColor: secondaryColor,
                    title: DefText(controller
                            .listSelectedMember.value[index].data.name)
                        .semiLarge,
                    subtitle: DefText(controller.listSelectedMember.value[index]
                            .data.familyRelation)
                        .normal,
                    trailing: IconButton(
                      splashRadius: 30,
                      onPressed: () {},
                      icon: const Icon(Icons.delete_outline_outlined),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
