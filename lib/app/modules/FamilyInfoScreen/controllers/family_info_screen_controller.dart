import 'package:delabel_v3/app/config/constants.dart';
import 'package:delabel_v3/app/services/member_service.dart';
import 'package:delabel_v3/app/services/vehicle_service.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/family_model.dart';
import '../../../models/member_model.dart';
import '../../../models/user_model.dart';
import '../../../models/vehicle_model.dart';
import '../../../services/family_service.dart';
import '../../../util/func_util.dart';

class FamilyInfoScreenController extends GetxController with StateMixin {
  final box = GetStorage();
  final userModel = Rxn<UserModel>();

  final title = "Family Info".obs;
  final memberModel = Rxn<MemberModel>();
  final familyModel = Rxn<FamilyModel>();
  var listMemberFamily = <MemberModel>[].obs;
  var listVehicleFamily = <VehicleModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() async {
    box.initStorage;
    userModel.value = UserModel.fromJson(box.read(kUserData));
    await getPersonalInfo();
    await getFamilyInfo();
    getMemberFamily();
    getVehicleFamily();

    super.onInit();
  }

  Future<void> getPersonalInfo() async {
    var res = await MemberService()
        .getOne(value: userModel.value!.data.nik, field: "nik");
    memberModel.value = MemberModel.fromJson(res);
  }

  Future<void> getFamilyInfo() async {
    var data = await FamilyService()
        .getOne(value: memberModel.value!.data.noKk, field: "no_kk");
    logKey("getFamilyInfo", data);
    familyModel.value = FamilyModel.fromJson(data);
    change(null, status: RxStatus.success());
  }

  Future<void> getMemberFamily() async {
    List<Map<String, dynamic>> relatedFamily =
        await MemberService().getRelatedFamily(
      value: memberModel.value!.data.noKk,
      field: "no_kk",
    );
    listMemberFamily.value =
        relatedFamily.map((e) => MemberModel.fromJson(e)).toList();
  }

  Future<void> getVehicleFamily() async {
    // var res = await VehicleServices().getAllData();
    // logKey(res);
    List<Map<String, dynamic>> familyVehicle =
        await VehicleServices().getFamilyVehicle(
      value: memberModel.value!.data.noKk,
      field: "no_kk",
    );
    listVehicleFamily.value =
        familyVehicle.map((e) => VehicleModel.fromJson(e)).toList();
    // logKey({"dat": familyVehicle});
    // listMemberFamily.value =
    //     relatedFamily.map((e) => MemberModel.fromJson(e)).toList();
  }

  void increment() => count.value++;
}
