import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants.dart';
import '../controllers/app_bar_controller.dart';

class AppBarView extends GetView implements PreferredSizeWidget {
  final Widget title;
  final bool isDashboard;

  const AppBarView({
    Key? key,
    required this.title,
    this.isDashboard = false,
    this.preferredSize = const Size.fromHeight(56),
  }) : super(key: key);

  @override
  final Size preferredSize;
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppBarController());
    log(controller.title.value);

    return AppBar(
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      actions: [
        isDashboard
            ? Padding(
                padding: const EdgeInsets.only(right: kDefaultPadding / 3),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              )
            : Container(),
      ],
      title: title,
    );
  }
}
