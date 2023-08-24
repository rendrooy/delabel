import 'dart:io';

import 'package:delabel_v3/app/models/news_model.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../services/news_service.dart';
import '../../../util/firebase_storage.dart';

class FormNewsAdminScreenController extends GetxController {
  var listImage = <XFile>[].obs;
  final newsModel = Rxn<NewsModel>();
  final formNewsKey = GlobalKey<FormBuilderState>();

  final count = 0.obs;

  void uploadImage() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      listImage.add(image);
    }
    listImage.refresh();
  }

  void removeImage(int index) {
    listImage.removeAt(index);
    listImage.refresh();
  }

  void submitNews() async {
    Get.focusScope?.unfocus();
    if (!formNewsKey.currentState!.saveAndValidate()) return;
    dialogLoading();

    if (newsModel.value != null) {
    } else {
      var listUrl = <String>[];
      for (var i = 0; i < listImage.length; i++) {
        var res = await uploadImageToFirebase(File(listImage[i].path), 'news');
        listUrl.add(res!);
      }
      DataNewsModel dataNewsModel = DataNewsModel.fromJson({
        ...formNewsKey.currentState!.value,
        'list_images': listUrl,
        'isShowed': true,
        'created_at': DateTime.now(),
      });
      await NewsServices().insertData(value: dataNewsModel.toJson());
      Navigator.of(Get.overlayContext!).pop();
      Get.back();
    }
  }

  void increment() => count.value++;
}
