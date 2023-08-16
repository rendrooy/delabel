import 'package:delabel_v3/app/components/input_builder.dart';
import 'package:delabel_v3/app/components/primary_button.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../../components/defText.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../controllers/form_member_screen_controller.dart';

class FormMemberScreenView extends GetView<FormMemberScreenController> {
  const FormMemberScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBarView(
          title: DefText('FormMemberScreenView', fontWeight: FontWeight.bold)
              .large,
        ),
        body: Column(
          children: [
            Expanded(
              child: FormBuilder(
                key: controller.formMember,
                child: ListView(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  children: [
                    InputBuilderText(
                      name: 'name',
                      label: 'Name',
                      initialValue: controller.memberModel.value?.data.name,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    InputBuilderText(
                      name: 'nik',
                      label: 'NIK',
                      isNumber: true,
                      readOnly: controller.memberModel.value != null,
                      initialValue:
                          "${controller.memberModel.value?.data.nik ?? ""}",
                    ),
                    const SizedBox(height: kDefaultPadding),
                    InputBuilderText(
                      name: 'phone_number',
                      label: 'No HP',
                      initialValue:
                          "${controller.memberModel.value?.data.phoneNumber ?? ""}",
                    ),
                    const SizedBox(height: kDefaultPadding),
                    InputBuilderText(
                      name: 'address',
                      label: 'Alamat',
                      initialValue: controller.memberModel.value?.data.address,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    InputBuilderText(
                      name: 'profession',
                      label: 'Pekerjaan',
                      initialValue:
                          controller.memberModel.value?.data.profession,
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const InputBuilderText(
                      name: 'birth_place',
                      label: 'Tempat Lahir',
                    ),
                    const SizedBox(height: kDefaultPadding),
                    FormBuilderDateTimePicker(
                      validator: FormBuilderValidators.required(),
                      name: "birth_date",
                      initialValue: controller.memberModel.value == null
                          ? null
                          : controller.memberModel.value!.data.birthDate,
                      inputType: InputType.date,
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Lahir',
                      ),
                      initialDate: DateTime.now(),
                      format: DateFormat("yyyy-MM-dd"),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    FormBuilderDropdown(
                      validator: FormBuilderValidators.required(),
                      decoration: const InputDecoration(
                        labelText: 'Agama',
                      ),
                      name: "religion",
                      initialValue: controller.memberModel.value?.data.religion,
                      items: controller.listReligion
                          .map(
                            (element) => DropdownMenuItem(
                              value: element,
                              child: DefText(element).normal,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    FormBuilderDropdown(
                      initialValue: controller.memberModel.value?.data.sex,
                      validator: FormBuilderValidators.required(),
                      decoration: const InputDecoration(
                        labelText: 'Jenis Kelamin',
                      ),
                      name: "sex",
                      items: controller.listSex
                          .map(
                            (element) => DropdownMenuItem(
                              value: element,
                              child: DefText(element).normal,
                            ),
                          )
                          .toList(),
                    ),
                    const SizedBox(height: kDefaultPadding),
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: PrimaryButton(
                height: 45,
                text: DefText(
                  'Simpan',
                  fontWeight: FontWeight.bold,
                ).normal,
                onPress: () {
                  if (controller.memberModel.value == null) {
                    controller.submitMember();
                  } else {
                    controller.updateMember();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
