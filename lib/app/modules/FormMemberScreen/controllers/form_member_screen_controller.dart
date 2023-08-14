import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../models/member_model.dart';
import '../../../services/member_service.dart';

class FormMemberScreenController extends GetxController {
  final count = 0.obs;
  GlobalKey<FormBuilderState> formMember = GlobalKey<FormBuilderState>();
  final memberModel = Rxn<MemberModel>();
  var listStatus = ['Menikah', 'Belum Menikah'].obs;
  final listEducation = ['SD', 'SMP', 'SMA', 'D3', 'S1', 'S2', 'S3'].obs;
  final listReligion = ['Islam', 'Kristen', 'Katolik', 'Hindu', 'Budha'].obs;
  final listSex = ['Laki Laki', 'Perempuan'].obs;

  @override
  void onInit() {
    memberModel.value = Get.arguments;

    super.onInit();
  }

  void updateMember() async {
    final dataMemberModel = Rxn<DataMemberModel>();
    if (!formMember.currentState!.saveAndValidate()) return;
    dialogLoading();
    Map<String, dynamic> dataRaw = Map.from(formMember.currentState!.value);

    dataRaw.remove('nik');
    Navigator.of(Get.overlayContext!).pop();
    dataMemberModel.value = DataMemberModel.fromJson(dataRaw);
    MemberService().updateData(
      id: memberModel.value!.id,
      data: memberModel.value!.data.toJson(),
    );
    Get.back();
    showSnackbar(pesan: "Member Updated");
  }

  void submitMember() async {
    final dataMemberModel = Rxn<DataMemberModel>();
    if (!formMember.currentState!.saveAndValidate()) return;

    dialogLoading();

    var dataRaw = formMember.currentState!.value;
    List listMember = await MemberService()
        .getRelatedFamily(value: dataRaw['nik'], field: 'nik');
    if (listMember.isNotEmpty) {
      Navigator.of(Get.overlayContext!).pop();
      showSnackbar(pesan: "NIK sudah terdaftar");
      return;
    } else {
      Navigator.of(Get.overlayContext!).pop();
      dataMemberModel.value = DataMemberModel.fromJson(dataRaw);
      MemberService().insertData(value: dataMemberModel.toJson());
      Get.back();
      showSnackbar(pesan: "Member Added");
    }
  }

  void increment() => count.value++;
}
