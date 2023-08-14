import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../models/member_model.dart';
import '../../../services/member_service.dart';

class FormMemberScreenController extends GetxController {
  final count = 0.obs;
  GlobalKey<FormBuilderState> formMember = GlobalKey<FormBuilderState>();
  final dataMemberModel = Rxn<DataMemberModel>();

  var listReligion = ['Islam', 'Kristen', 'Katolik', 'Hindu', 'Budha'].obs;
  var listSex = ['Laki Laki', 'Perempuan'].obs;

  void submitMember() async {
    if (!formMember.currentState!.saveAndValidate()) return;

    dialogLoading();
    // logKey(dataMemberModel.value!.toJson());
    // return;
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
    // logKey({"asdasd": listMember});
  }

  void increment() => count.value++;
}
