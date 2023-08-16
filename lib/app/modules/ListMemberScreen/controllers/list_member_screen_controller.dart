import 'package:delabel_v3/app/models/member_model.dart';
import 'package:delabel_v3/app/routes/app_pages.dart';
import 'package:delabel_v3/app/services/member_service.dart';
import 'package:get/get.dart';

class ListMemberScreenController extends GetxController with StateMixin {
  //TODO: Implement ListMemberScreenController

  final count = 0.obs;
  var listMember = <MemberModel>[].obs;
  var title = 'List Member'.obs;

  @override
  void onInit() {
    super.onInit();
    getListMember();
  }

  void updateMember(MemberModel memberModel) async {
    await Get.toNamed(
      Routes.FORM_MEMBER_SCREEN,
      arguments: memberModel,
    );
    getListMember();
  }

  void deleteMember(data) async {
    await MemberService().deleteData(id: data);
    getListMember();
  }

  Future<void> getListMember() async {
    var res = await MemberService().getAllData();
    listMember.value = res.map((e) => MemberModel.fromJson(e)).toList();
    // logKey({"asdasd": res});
  }

  void increment() => count.value++;
}
