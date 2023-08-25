import 'package:cached_network_image/cached_network_image.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../routes/app_pages.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../controllers/list_news_admin_screen_controller.dart';

class ListNewsAdminScreenView extends GetView<ListNewsAdminScreenController> {
  const ListNewsAdminScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () => Scaffold(
          floatingActionButton: controller.listSelectedNews.isNotEmpty
              ? FloatingActionButton.extended(
                  onPressed: () async {
                    // await Get.toNamed(Routes.FORM_NEWS_ADMIN_SCREEN,
                    //     arguments: controller.listSelectedNews);
                    controller.getListNews();
                  },
                  icon: const Icon(Icons.delete_outline),
                  label: DefText('Delete News', color: Colors.black).normal,
                )
              : FloatingActionButton.extended(
                  onPressed: () async {
                    await Get.toNamed(Routes.FORM_NEWS_ADMIN_SCREEN);
                    controller.getListNews();
                  },
                  icon: const Icon(Icons.add),
                  label: DefText('Add News', color: Colors.black).normal,
                ),
          appBar: AppBarView(
            title:
                DefText('ListNewsAdminScreenView', fontWeight: FontWeight.bold)
                    .large,
          ),
          body: Obx(
            () => ListView.separated(
              padding: const EdgeInsets.all(kDefaultPadding),
              itemBuilder: (c, i) {
                return Obx(
                  () => Container(
                      decoration: BoxDecoration(
                        color: controller.listSelectedNews
                                .contains(controller.listNews.value[i])
                            ? kInactiveColor.withOpacity(0.8)
                            : secondaryColor,

                        // secondaryColor,
                        boxShadow: [kDefaultShadow],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: MaterialButton(
                        padding: EdgeInsets.zero,
                        onLongPress: () {
                          controller.listSelectedNews.add(
                            controller.listNews.value[i],
                          );
                        },
                        onPressed: () {
                          if (controller.listSelectedNews.isNotEmpty) {
                            if (controller.listSelectedNews
                                .contains(controller.listNews.value[i])) {
                              controller.listSelectedNews.remove(
                                controller.listNews.value[i],
                              );
                            } else {
                              controller.listSelectedNews.add(
                                controller.listNews.value[i],
                              );
                            }
                            // controller.listSelectedNews.add(
                            //   controller.listNews.value[i],
                            // );
                          } else {
                            Get.toNamed(
                              Routes.FORM_NEWS_ADMIN_SCREEN,
                              arguments: controller.listNews.value[i],
                            );
                          }
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.horizontal(
                                left: Radius.circular(5),
                              ),
                              child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                child: CachedNetworkImage(
                                  height: 150,
                                  width: 150,
                                  imageUrl: controller
                                      .listNews.value[i].data.listImages.first,
                                  fit: BoxFit.cover,
                                  errorWidget: (context, url, error) =>
                                      const Icon(
                                          Icons.image_not_supported_rounded),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                padding: const EdgeInsets.all(kDefaultPadding),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: DefText(
                                            controller
                                                .listNews.value[i].data.title,
                                            fontWeight: FontWeight.bold,
                                            maxLine: 1,
                                          ).semiLarge,
                                        ),
                                        const SizedBox(width: kDefaultPadding),
                                        DefText(
                                          dateFormater(
                                            controller.listNews.value[i].data
                                                .createdAt,
                                            dateFormat: kDateFormatDateOnly,
                                          ),
                                        ).normal,
                                      ],
                                    ),
                                    const SizedBox(height: kDefaultPadding / 2),
                                    DefText(
                                      controller.listNews.value[i].data.content,
                                      textAlign: TextAlign.left,
                                      maxLine: 3,
                                    ).normal,
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      )),
                );
              },
              separatorBuilder: (context, index) =>
                  const SizedBox(height: kDefaultPadding),
              itemCount: controller.listNews.value.length,
            ),
          ),
        ),
      ),
    );
  }
}
