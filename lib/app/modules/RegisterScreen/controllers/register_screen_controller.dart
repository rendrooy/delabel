import 'package:delabel_v3/app/services/member_service.dart';
import 'package:delabel_v3/app/services/users_service.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../../models/member_model.dart';
import '../../../models/user_model.dart';

class RegisterScreenController extends GetxController {
  String nik = '';
  var isAvailable = false.obs;
  final memberModel = Rxn<MemberModel>();
  PageController pageController = PageController(initialPage: 0);
  FirebaseAuth auth = FirebaseAuth.instance;
  GlobalKey<FormBuilderState> formKeyRegister = GlobalKey<FormBuilderState>();

  final count = 0.obs;

  void checkNIK() async {
    Get.focusScope!.unfocus();
    print(nik);
    List res = await MemberService()
        .getRelatedFamily(value: int.parse(nik), field: 'nik');
    if (res.isNotEmpty) {
      memberModel.value = MemberModel.fromJson(res[0]);
      checkUser();
    } else {
      showSnackbar(pesan: 'NIK tidak ditemukan');
    }
  }

  void checkUser() async {
    var resUser = await UserService().getOne(
      value: memberModel.value!.data.id,
      field: "member_id",
    );
    if (resUser['id'] != null) {
      showSnackbar(pesan: 'Member Sudah Terdaftar');
    } else {
      pageController.animateToPage(
        1,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void firebaseAuth() async {
    if (!formKeyRegister.currentState!.saveAndValidate()) return;
    try {
      Map dataRaw = formKeyRegister.currentState!.value;
      UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: dataRaw['email'],
        password: dataRaw['password'],
      );

      Map<String, dynamic> dataUserRaw = {
        'member_id': memberModel.value!.data.id,
        'is_admin': false,
        'role': 'member',
        'email': dataRaw['email'],
      };
      DataUserModel userModel = DataUserModel.fromJson(
        <String, dynamic>{
          ...dataUserRaw,
          'permissions': {
            "master_member": {},
            "master_families": {},
          },
        },
      );
      UserService().insertData(value: userModel.toJson());
      Get.back();
      // Get.offNamedUntil(Routes.LOGIN_SCREEN, (route) => true);

      showSnackbar(pesan: "Berhasil Melakukan Pendaftaran");
    } on FirebaseAuthException catch (e) {
      Get.back();
      if (e.code == 'weak-password') {
        showSnackbar(pesan: 'Password Terlalu Lemah');
      } else if (e.code == 'email-already-in-use') {
        showSnackbar(pesan: 'Email Sudah Terdaftar');
      }
    } catch (e) {
      print(e);
    }
  }

  void increment() => count.value++;
}
