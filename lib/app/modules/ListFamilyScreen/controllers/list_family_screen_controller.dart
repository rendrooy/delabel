import 'package:delabel_v3/app/models/family_model.dart';
import 'package:delabel_v3/app/services/family_service.dart';
import 'package:get/get.dart';

import '../../../util/func_util.dart';

class ListFamilyScreenController extends GetxController {
  //TODO: Implement ListFamilyScreenController

  final count = 0.obs;
  var title = "ListFamilyScreenView".obs;
  var listFamily = <FamilyModel>[].obs;

  @override
  void onInit() {
    getListMember();
    super.onInit();
  }

  Future<void> getListMember() async {
    var res = await FamilyService().getAllData();
    listFamily.value = res.map((e) => FamilyModel.fromJson(e)).toList();
    logKey({"asdasd": res});
    // print(res);
  }

  void increment() => count.value++;
}
