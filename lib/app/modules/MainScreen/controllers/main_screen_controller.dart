import 'package:delabel_v3/app/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../config/constants.dart';
import '../../HomeScreen/views/home_screen_view.dart';
import '../../ProfileScreen/views/profile_screen_view.dart';

class MainScreenController extends GetxController
    with GetTickerProviderStateMixin {
  final count = 0.obs;
  late TabController tabController;
  var selectedIndex = 0.obs;
  final userModel = Rxn<UserModel>();
  final box = GetStorage();

  var listDrawer = [
    "Home",
    "Favorites",
    "Calendar",
    "Profile",
    "Settings",
  ];

  var myTabs = [
    const Tab(child: HomeScreenView()),
    const Tab(child: Scaffold()),
    const Tab(child: Scaffold()),
    const Tab(child: ProfileScreenView()),
    const Tab(child: Scaffold()),
  ].obs;

  @override
  void onInit() {
    box.initStorage;
    tabController = TabController(
      length: myTabs.length,
      vsync: this,
      initialIndex: 0,
    );
    userModel.value = UserModel.fromJson(box.read(kUserData));
    // TODO: implement onInit
    super.onInit();
  }

  void changeTabIndex(int index) {
    selectedIndex.value = index;
    tabController.animateTo(
      index,
      curve: Curves.ease,
    );
    update();
  }

  void increment() => count.value++;
}
