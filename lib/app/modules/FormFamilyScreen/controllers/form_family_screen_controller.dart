import 'package:delabel_v3/app/models/family_model.dart';
import 'package:delabel_v3/app/models/member_model.dart';
import 'package:delabel_v3/app/services/member_service.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../components/secondary_button.dart';
import '../../../config/constants.dart';
import '../../../services/family_service.dart';

class FormFamilyScreenController extends GetxController {
  //TODO: Implement FormFamilyScreenController

  final count = 0.obs;
  var listMember = <MemberModel>[].obs;
  final familyModel = Rxn<FamilyModel>();
  final memberModel = Rxn<MemberModel>();
  var listSelectedMember = <MemberModel>[].obs;

  GlobalKey<FormBuilderState> memberRelatedFormKey =
      GlobalKey<FormBuilderState>();
  GlobalKey<FormBuilderState> familyFormKey = GlobalKey<FormBuilderState>();
  @override
  void onInit() {
    familyModel.value = Get.arguments;
    getListRelatedMember();
    super.onInit();
  }

  Future<void> getListMember() async {
    var res = await MemberService().getMemberHasNotFamily();
    listMember.value = res.map((e) => MemberModel.fromJson(e)).toList();
  }

  void submitKeluarga() async {
    dialogLoading();
    if (!familyFormKey.currentState!.saveAndValidate()) return;
    final dataFamilyModel = Rxn<DataFamilyModel>();
    dataFamilyModel.value = DataFamilyModel.fromJson(
      familyFormKey.currentState!.value,
    );
    //! Check if family exist
    List resCheck = await FamilyService().getAllDataFilter(
      value: dataFamilyModel.value!.noKk,
      field: 'no_kk',
    );
    if (resCheck.isNotEmpty) {
      Get.snackbar(
        "Gagal",
        "No KK sudah terdaftar",
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      Navigator.of(Get.overlayContext!).pop();
      return;
    }
    //! Submit
    await FamilyService().insertData(
      value: dataFamilyModel.value!.toJson(),
    );
    //! Get Data Again
    var res = await FamilyService().getOne(
      value: dataFamilyModel.value!.id,
      field: 'id',
    );
    familyModel.value = FamilyModel.fromJson(res);
    Navigator.of(Get.overlayContext!).pop();
  }

  void addFamilyMember(data) async {
    dialogLoading();
    DataMemberModel dataMemberModel = DataMemberModel.fromJson({
      ...data['member']['data'],
      'family_relation': data['relation'],
      'family_id': familyModel.value!.data.id,
    });
    memberModel.value = MemberModel.fromJson({
      'id': data['member']["id"],
      "data": dataMemberModel.toJson(),
    });
    MemberService().updateData(
      id: memberModel.value!.id,
      data: memberModel.value!.data.toJson(),
    );
    listSelectedMember.add(memberModel.value!);
    Navigator.of(Get.overlayContext!).pop();
    showSnackbar(pesan: "Berhasil menambahkan anggota keluarga");
  }

  void bottomSheetAddMember() async {
    await getListMember();

    Get.bottomSheet(
      Container(
        color: secondaryColor,
        padding: const EdgeInsets.all(kDefaultPadding),
        child: FormBuilder(
          key: memberRelatedFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // const SizedBox(height: kDefaultPadding / 2),
              Obx(
                () => FormBuilderDropdown(
                  decoration: const InputDecoration(
                    hintText: "Warga",
                  ),
                  name: 'member',
                  items: listMember.value
                      .map(
                        (e) => DropdownMenuItem(
                          value: e.toJson(),
                          child: Text(e.data.name),
                        ),
                      )
                      .toList(),
                ),
              ),
              const SizedBox(height: kDefaultPadding),
              FormBuilderDropdown(
                decoration: const InputDecoration(
                  hintText: "Hubungan Keluarga",
                ),
                name: 'relation',
                items: [
                  "Kepala Keluarga",
                  "Istri",
                  "Anak",
                  "Cucu",
                  "Orang Tua",
                  "Menantu",
                  "Famili Lain",
                  "Pembantu"
                ]
                    .map(
                      (e) => DropdownMenuItem(
                        value: e,
                        child: Text(e),
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: kDefaultPadding),
              SecondaryButton(
                text: DefText("Tambah Anggota Keluarga").normal,
                onPress: () {
                  memberRelatedFormKey.currentState!.save();
                  addFamilyMember(memberRelatedFormKey.currentState!.value);
                  // listSelectedMember.add(
                  //   memberRelatedFormKey.currentState!.value,
                  // );
                  Get.back();
                },
              ),
              // const SizedBox(height: kDefaultPadding / 2),
            ],
          ),
        ),
      ),
    );
  }

  void deleteRelatedMember(MemberModel dataMember) {
    MemberService().updateData(
      id: dataMember.id,
      data: {
        ...dataMember.data.toJson(),
        'family_id': "",
        'family_relation': '',
      },
    );
    listSelectedMember.remove(dataMember);
    showSnackbar(pesan: "Berhasil menghapus anggota keluarga");
  }

  void getListRelatedMember() async {
    var res = await MemberService().getRelatedFamily(
      value: familyModel.value!.data.id,
      field: 'family_id',
    );
    listSelectedMember.value = res.map((e) => MemberModel.fromJson(e)).toList();
  }

  void increment() => count.value++;
}
