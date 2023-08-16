import 'package:delabel_v3/app/config/constants.dart';
import 'package:delabel_v3/app/models/member_model.dart';
import 'package:delabel_v3/app/services/member_service.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/organization_model.dart';
import '../../../models/user_model.dart';

class PersonalInfoScreenController extends GetxController with StateMixin {
  final count = 0.obs;
  final userModel = Rxn<UserModel>();
  final memberModel = Rxn<MemberModel>();

  final organizationModel = Rxn<OrganizationModel>();
  var title = "Personal Info".obs;
  var box = GetStorage();
  @override
  void onInit() async {
    box.initStorage;
    logKey("user data", box.read(kUserData));
    userModel.value = UserModel.fromJson(box.read(kUserData));
    // return;
    await getMember();
    await getOrganization();
    change(null, status: RxStatus.success());
    super.onInit();
  }

  Future<void> getMember() async {
    var data = await MemberService().getOne(
      field: "id",
      value: userModel.value!.data.memberId,
    );
    memberModel.value = MemberModel.fromJson(data);
    logKey("dari db", memberModel.value!.toJson());
  }

  Future<void> getOrganization() async {
    // var res = await OrganizationService().getOne(
    //   field: "nik",
    //   value: userModel.value!.data.id,
    // );
    // organizationModel.value = OrganizationModel.fromJson(res);
    // logKey(res);
  }

  void increment() => count.value++;
}
