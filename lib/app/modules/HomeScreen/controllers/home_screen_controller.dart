import 'package:carousel_slider/carousel_controller.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:delabel_v3/app/routes/app_pages.dart';
import 'package:delabel_v3/app/services/news_service.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../models/news_model.dart';
import '../../../models/user_model.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController
  final CarouselController controllerCarousel = CarouselController();
  var title = "HomeScreenView".obs;
  final box = GetStorage();
  var listNews = <NewsModel>[].obs;

  List imagesCarousel = [
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
  ];

  final userModel = Rxn<UserModel>();

  List menu = [
    {
      "icon": Icons.people_alt_outlined,
      "title": "Info KK",
      "onClick": Routes.FAMILY_INFO_SCREEN
    },
    {
      "icon": Icons.person,
      "title": "Info Pribadi",
      "onClick": Routes.PERSONAL_INFO_SCREEN
    },
    {
      "icon": Icons.account_balance,
      "title": "Laporan Keuangan",
    },
    {
      "icon": Icons.store,
      "title": "UMKM",
    },
  ];

  @override
  void onInit() {
    box.initStorage;
    getListNews();
    userModel.value = UserModel.fromJson(box.read(kUserData));
    // TODO: implement onInit
    super.onInit();
  }

  void getListNews() async {
    var res = await NewsServices().getAllData();
    logKey({"res": res});
    listNews.value = res.map((e) => NewsModel.fromJson(e)).toList();
  }

  final count = 0.obs;

  void increment() => count.value++;
}
