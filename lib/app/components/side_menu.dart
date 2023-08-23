import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../components/defText.dart';
import '../config/constants.dart';
import '../models/user_model.dart';
import '../routes/app_pages.dart';

class SideMenu extends StatelessWidget {
  final UserModel dataUser;
  final String? version;

  const SideMenu({
    Key? key,
    required this.dataUser,
    this.version,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            child: Container(
              color: secondaryColor,
              child: Image.asset('assets/images/image-removebg-preview.png'),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  DrawerListTile(
                    title: "Akun",
                    icon: Icons.account_circle_outlined,
                    press: () async {
                      Get.back();
                      Get.toNamed(Routes.PERSONAL_INFO_SCREEN);
                    },
                  ),
                  DrawerListTile(
                    title: "Surat Menyurat",
                    icon: Icons.mail_outline_rounded,
                    press: () async {
                      Get.back();
                      Get.toNamed(Routes.PERSONAL_INFO_SCREEN);
                    },
                  ),
                  DrawerListTile(
                    title: "Info KK",
                    icon: Icons.family_restroom_outlined,
                    press: () async {
                      Get.back();
                      Get.toNamed(Routes.FAMILY_INFO_SCREEN);
                    },
                  ),
                  Visibility(
                    visible: dataUser.data.isAdmin,
                    child: ExpansionTile(
                      title: const Text(
                        "Admin",
                        style: TextStyle(color: Colors.white54),
                      ),
                      leading: const Icon(
                        Icons.lock_open_rounded,
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DrawerListTile(
                            title: "List Family",
                            icon: Icons.people_alt_rounded,
                            press: () {
                              Get.back();
                              Get.toNamed(Routes.LIST_FAMILY_SCREEN);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DrawerListTile(
                            title: "List Member",
                            icon: Icons.account_circle_outlined,
                            press: () {
                              Get.back();
                              Get.toNamed(Routes.LIST_MEMBER_SCREEN);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DrawerListTile(
                            title: "List Vehicle",
                            icon: Icons.motorcycle_outlined,
                            press: () {
                              Get.back();
                              Get.toNamed(Routes.LIST_VEHICLE_SCREEN);
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: DrawerListTile(
                            title: "News",
                            icon: Icons.people_alt_rounded,
                            press: () {
                              Get.back();
                              Get.toNamed(Routes.LIST_NEWS_ADMIN_SCREEN);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  DrawerListTile(
                    title: "Settings",
                    icon: Icons.settings_outlined,
                    press: () async {
                      Get.back();
                      Get.toNamed(Routes.FAMILY_INFO_SCREEN);
                    },
                  ),
                  DrawerListTile(
                    title: "Keluar",
                    // svgSrc: "assets/icons/log_out_1.png",
                    icon: Icons.logout,
                    press: () {
                      var box = GetStorage();
                      box.erase();
                      Get.offAllNamed(Routes.LOGIN_SCREEN);
                    },
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    DefText("Crafted with ").small,
                    const Icon(
                      Icons.heart_broken,
                      size: 15,
                    ),
                    DefText(" by Rend").small,
                  ],
                ),
                DefText("1.0.1").small
              ],
            ),
          )
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.title,
    this.svgSrc,
    this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData? icon;
  final String? svgSrc;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading:
          icon != null ? Icon(icon) : const Icon(Icons.accessibility_outlined),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
