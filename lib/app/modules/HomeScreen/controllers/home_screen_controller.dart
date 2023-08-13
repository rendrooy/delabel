import 'package:carousel_slider/carousel_controller.dart';
import 'package:delabel_v3/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  //TODO: Implement HomeScreenController
  final CarouselController controllerCarousel = CarouselController();
  var title = "HomeScreenView".obs;
  List imagesCarousel = [
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
    'https://images.unsplash.com/photo-1646299220293-3ae516d9c275?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=2638&q=80',
  ];

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

  final count = 0.obs;

  void increment() => count.value++;
}
