import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delabel_v3/app/components/defText.dart';
import 'package:delabel_v3/app/components/side_menu.dart';
import 'package:delabel_v3/app/modules/AppBar/views/app_bar_view.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

import '../../../config/constants.dart';
import '../controllers/home_screen_controller.dart';

class HomeScreenView extends GetView<HomeScreenController> {
  const HomeScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetX<HomeScreenController>(
        init: HomeScreenController(),
        builder: (controller) {
          return Scaffold(
            appBar: AppBarView(
              title: DefText(
                controller.title.value,
                fontWeight: FontWeight.bold,
              ).large,
              isDashboard: true,
            ),
            drawer: const SideMenu(),
            body: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: kDefaultPadding),
                CarouselSlider(
                  carouselController: controller.controllerCarousel,
                  options: CarouselOptions(
                    enableInfiniteScroll: true,
                    viewportFraction: 0.78,
                    autoPlay: true,
                    height: Get.height * 0.2,
                  ),
                  items: controller.imagesCarousel
                      .map((e) => ClipRRect(
                            borderRadius: kDefaultBorderRadius,
                            child: CachedNetworkImage(
                              fit: BoxFit.fill,
                              imageUrl: e,
                              placeholder: (context, url) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.asset(
                                    'assets/images/default_picture.jpeg',
                                  ),
                                );
                              },
                            ),
                          ))
                      .toList(),
                ),
                const SizedBox(height: kDefaultPadding / 2),
                AlignedGridView.count(
                  crossAxisCount: 4,
                  padding: const EdgeInsets.all(kDefaultPadding),
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.menu.length,
                  shrinkWrap: true,
                  mainAxisSpacing: kDefaultPadding,
                  crossAxisSpacing: kDefaultPadding,
                  itemBuilder: (context, index) {
                    return _menuItem(
                      icon: controller.menu[index]['icon'],
                      title: controller.menu[index]['title'],
                      onClick: () {
                        if (controller.menu[index]['onClick'] != null) {
                          Get.toNamed(controller.menu[index]['onClick']);
                        } else {
                          showSnackbar(pesan: "Menu belum tersedia");
                        }
                      },
                    );
                    // Container(
                    //   decoration: BoxDecoration(
                    //     borderRadius: BorderRadius.circular(5),
                    //     color: kSecondaryColor,
                    //     boxShadow: [kDefaultShadow],
                    //   ),
                    //   padding: const EdgeInsets.all(kDefaultPadding / 2),
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       borderRadius: BorderRadius.circular(5),
                    //       color: bgColor,
                    //     ),
                    //     padding: const EdgeInsets.all(kDefaultPadding),
                    //     child: Row(
                    //       children: [
                    //         Icon(controller.menu[index]['icon']),
                    //         const SizedBox(width: kDefaultPadding),
                    //         Expanded(
                    //           child: DefText(controller.menu[index]['title'])
                    //               .semiLarge,
                    //         )
                    //       ],
                    //     ),
                    //   ),
                    // );
                  },
                )
              ],
            ),
          );
        });
  }

  Widget _menuItem({
    required IconData icon,
    required String title,
    required VoidCallback onClick,
  }) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: secondaryColor,
            boxShadow: [kDefaultShadow],
            border: Border.all(
              width: 5,
              color: Colors.white,
            ),
          ),
          child: MaterialButton(
            shape: const CircleBorder(),
            padding: const EdgeInsets.all(kDefaultPadding / 2),
            onPressed: () {},
            // onClick(),
            // height: 25,
            child: Icon(icon),
            // ImageNetwork(
            //   image: image,
            //   onTap: () => onClick(),
            //   width: 30,
            //   onError: const Icon(
            //     Icons.error,
            //     color: Colors.white,
            //   ),
            // ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        DefText(title, textAlign: TextAlign.center).normal
      ],
    );
  }
}
