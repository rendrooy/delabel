import 'package:delabel_v3/app/models/family_model.dart';
import 'package:delabel_v3/app/models/member_model.dart';
import 'package:delabel_v3/app/services/family_service.dart';
import 'package:delabel_v3/app/services/member_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../util/func_util.dart';

class ListFamilyScreenController extends GetxController {
  //TODO: Implement ListFamilyScreenController

  final count = 0.obs;
  var title = "ListFamilyScreenView".obs;
  var listFamily = <FamilyModel>[].obs;

  @override
  void onInit() {
    getListFamily();
    super.onInit();
  }

  Future<void> getListFamily() async {
    var res = await FamilyService().getAllData();
    listFamily.value = res.map((e) => FamilyModel.fromJson(e)).toList();
    logKey({"asdasd": res});
    // print(res);
  }

  void deleteFamily(FamilyModel familyModel) async {
    dialogLoading();
    // List relatedMember = <MemberModel>[];
    await FamilyService().deleteData(id: familyModel.id);
    var res = await MemberService()
        .getRelatedFamily(value: familyModel.data.id, field: 'family_id');
    // print(res.toString());
    // relatedMember = res.map((e) => MemberModel.fromJson(e)).toList();
    for (var i = 0; i < res.length; i++) {
      MemberModel dataMember = MemberModel.fromJson(res[i]);
      MemberService().updateData(id: dataMember.id, data: {
        ...dataMember.data.toJson(),
        "family_id": "",
        "family_relation": "",
      });
    }
    Navigator.of(Get.overlayContext!).pop();
    // Get.back();
    showSnackbar(pesan: "Berhasil menghapus data");
    getListFamily();
  }

  void increment() => count.value++;
}
