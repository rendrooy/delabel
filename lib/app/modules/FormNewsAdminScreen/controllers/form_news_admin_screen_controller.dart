import 'dart:io';

import 'package:delabel_v3/app/models/news_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../util/firebase_storage.dart';

class FormNewsAdminScreenController extends GetxController {
  //TODO: Implement FormNewsAdminScreenController

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
    if (!formNewsKey.currentState!.validate()) return;
    // logKey(auth.currentUser!.uid);
    // // auth.
    // return;
    if (newsModel.value != null) {
      // update
    } else {
      var listUrl = <String>[];
      // create
      for (var i = 0; i < listImage.length; i++) {
        var res = await uploadImageToFirebase(File(listImage[i].path));
        // listUrl.add(res!);
        // await NewsServices().insertData(value: {
        //   ...formNewsKey.currentState!.value,
        //   'list_images': listUrl,
        //   'isShowed': true
        // });
      }
    }
  }

  void increment() => count.value++;
}
