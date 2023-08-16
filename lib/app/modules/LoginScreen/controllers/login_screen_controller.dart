import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/constants.dart';
import '../../../models/member_model.dart';
import '../../../models/user_model.dart';
import '../../../routes/app_pages.dart';
import '../../../services/member_service.dart';
import '../../../services/users_service.dart';
import '../../../util/func_util.dart';

class LoginScreenController extends GetxController {
  GlobalKey<FormBuilderState> formKeyLogin = GlobalKey<FormBuilderState>();

  FirebaseAuth auth = FirebaseAuth.instance;

  final userModel = Rxn<UserModel>();
  final memberModel = Rxn<MemberModel>();

  final box = GetStorage();

  String title = "Welocome to Flutter!";

  final count = 0.obs;

  @override
  void onInit() async {
    await box.initStorage;

    super.onInit();
  }

  void firebaseAuth() async {
    if (!formKeyLogin.currentState!.saveAndValidate()) return;
    try {
      var dataRaw = formKeyLogin.currentState!.value;
      UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: dataRaw['email'], password: dataRaw['password']);
      findDataUser(dataRaw: dataRaw);
    } on FirebaseAuthException catch (e) {
      logKey(e.message);
      if (e.code == 'user-not-found') {
        showSnackbar(pesan: 'Email Tidak Ditemukan');
      } else if (e.code == 'wrong-password') {
        showSnackbar(pesan: 'Password Tidak Cocok');
      }
    }
  }

  void findDataUser({dataRaw}) async {
    // logKey("resUser", {"data": dataRaw});
    var resUser = await UserService().getOne(
      value: dataRaw['email'],
      field: "email",
    );
    userModel.value = UserModel.fromJson(resUser);
    var resMember = await MemberService().getOne(
      value: userModel.value!.data.memberId,
      field: "id",
    );
    memberModel.value = MemberModel.fromJson(resMember);
    box.write(kUserData, {userModel.value!.toJson()});
    Get.offAllNamed(Routes.MAIN_SCREEN);
  }

  void increment() => count.value++;
}
