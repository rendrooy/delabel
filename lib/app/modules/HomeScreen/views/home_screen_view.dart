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
            drawer: SideMenu(
              dataUser: controller.userModel.value!,
            ),
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
                  },
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefText(
                          "News",
                          fontWeight: FontWeight.bold,
                        ).semiLarge,
                        GestureDetector(
                            onTap: () {
                              // Get.toNamed(
                              //   Routes.LIST_AGENDA_SCREEN,
                              //   arguments: category,
                              // );
                            },
                            child: DefText("Selengkapnya").normal),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                      child: PageView(
                        padEnds: true,
                        children: [
                          ...List.generate(4, (i) {
                            return _beasiswaItem();
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: kDefaultPadding),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        DefText(
                          "Event",
                          fontWeight: FontWeight.bold,
                        ).semiLarge,
                        GestureDetector(
                            onTap: () {
                              // Get.toNamed(
                              //   Routes.LIST_AGENDA_SCREEN,
                              //   arguments: category,
                              // );
                            },
                            child: DefText("Selengkapnya").normal),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.2,
                      child: PageView(
                        padEnds: true,
                        children: [
                          ...List.generate(4, (i) {
                            return _beasiswaItem();
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
  }

  Widget _beasiswaItem() {
    return Container(
        margin: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          color: secondaryColor,
          boxShadow: [kDefaultShadow],
          borderRadius: BorderRadius.circular(5),
        ),
        child: MaterialButton(
          padding: EdgeInsets.zero,
          onPressed: () {
            // Get.toNamed(Routes.DETAIL_AGENDA_SCREEN, arguments: {
            //   "data": dataAgendaModel,
            // });
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(5),
                  ),
                  child:
                      // dataAgendaModel.fileMedia!.isEmpty
                      //     ?
                      Container(
                          height: 150,
                          width: 150,
                          alignment: Alignment.center,
                          child: const Icon(Icons.image_not_supported_rounded))
                  //     : CachedNetworkImage(
                  //         imageUrl: dataAgendaModel.fileMedia![0].url!,
                  //         errorWidget: (c, s, e) {
                  //           return Icon(Icons.image_not_supported_outlined);
                  //         },
                  //         height: 150,
                  //         width: 150,
                  //         fit: BoxFit.cover,
                  //       )
                  ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Expanded(
                            child: DefText("dataAgendaModel.title!",
                                    fontWeight: FontWeight.bold, maxLine: 1)
                                .semiLarge,
                          ),
                        ],
                      ),
                      DefText(
                        "dataAgendaModel.deskripsi!",
                        textAlign: TextAlign.left,
                        maxLine: 3,
                      ).normal,
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
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
            onPressed: () => onClick(),
            child: Icon(icon),
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
