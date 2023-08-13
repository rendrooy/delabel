import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/main_screen_controller.dart';

class MainScreenView extends GetView<MainScreenController> {
  const MainScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // bottomNavigationBar: Obx(
        //   () => Padding(
        //     padding: const EdgeInsets.only(bottom: kDefaultPadding / 4),
        //     child: BottomNavyBar(
        //       containerHeight: 60,
        //       backgroundColor: Colors.transparent,
        //       selectedIndex: controller.selectedIndex.value,
        //       showElevation: false,
        //       items: [
        //         BottomNavyBarItem(
        //             inactiveColor: Colors.black,
        //             activeColor: Colors.blue,
        //             icon: const ImageIcon(
        //               AssetImage('assets/icons/Home.png'),
        //               color: Colors.white,
        //             ),
        //             title: DefText("Home").normal),
        //         BottomNavyBarItem(
        //             activeColor: Colors.blue,
        //             inactiveColor: Colors.black,
        //             icon: const ImageIcon(
        //               AssetImage('assets/icons/Star.png'),
        //               color: Colors.white,
        //             ),
        //             title: DefText("Favorites").normal),
        //         BottomNavyBarItem(
        //             activeColor: Colors.blue,
        //             inactiveColor: Colors.black,
        //             icon: const ImageIcon(
        //               AssetImage('assets/icons/Events.png'),
        //               color: Colors.white,
        //             ),
        //             title: DefText("Schedule").normal),
        //         BottomNavyBarItem(
        //             activeColor: Colors.blue,
        //             inactiveColor: Colors.black,
        //             icon: const ImageIcon(
        //               AssetImage('assets/icons/Male User.png'),
        //               color: Colors.white,
        //             ),
        //             title: DefText("Profile").normal),
        //         BottomNavyBarItem(
        //             activeColor: Colors.blue,
        //             inactiveColor: Colors.black,
        //             icon: const ImageIcon(
        //               AssetImage('assets/icons/Services.png'),
        //               color: Colors.white,
        //             ),
        //             title: DefText("Settings").normal),
        //       ],
        //       onItemSelected: (val) {
        //         controller.changeTabIndex(val);
        //       },
        //     ),
        //   ),
        // ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          controller: controller.tabController,
          children: controller.myTabs,
        ),
      ),
    );
  }
}
