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
                    const InputBuilderText(
                      name: 'name',
                      label: 'Name',
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const InputBuilderText(
                      name: 'nik',
                      label: 'NIK',
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const InputBuilderText(
                      name: 'phone',
                      label: 'No HP',
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const InputBuilderText(
                      name: 'profession',
                      label: 'Pekerjaan',
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
                      inputType: InputType.date,
                      decoration: const InputDecoration(
                        labelText: 'Tanggal Lahir',
                      ),
                      initialDate: DateTime.now(),
                      format: DateFormat("yyyy-MM-dd"),
                    ),
                    const SizedBox(height: kDefaultPadding),
                    const InputBuilderText(
                      name: 'address',
                      label: 'Alamat',
                    ),
                    const SizedBox(height: kDefaultPadding),
                    FormBuilderDropdown(
                      validator: FormBuilderValidators.required(),
                      decoration: const InputDecoration(
                        labelText: 'Agama',
                      ),
                      name: "religion",
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
                  controller.submitMember();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
