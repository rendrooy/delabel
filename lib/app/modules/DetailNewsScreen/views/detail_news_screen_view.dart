import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delabel_v3/app/components/defText.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../config/constants.dart';
import '../controllers/detail_news_screen_controller.dart';

class DetailNewsScreenView extends GetView<DetailNewsScreenController> {
  const DetailNewsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Detail News"),
          centerTitle: true,
        ),
        body: ListView(
          // padding: const EdgeInsets.all(kDefaultPadding),
          children: [
            const SizedBox(height: kDefaultPadding),
            CarouselSlider(
              carouselController: CarouselController(),
              options: CarouselOptions(
                enableInfiniteScroll: true,
                viewportFraction: 0.78,
                autoPlay: true,
                height: Get.height * 0.2,
              ),
              items: controller.newsModel.value?.data.listImages
                  .map((e) => ClipRRect(
                        borderRadius: kDefaultBorderRadius,
                        // child: Placeholder(),
                        child: CachedNetworkImage(
                          fit: BoxFit.fill,
                          imageUrl: e,
                          placeholder: (context, url) {
                            return Center(
                              child: loading(),
                            );
                          },
                        ),
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(kDefaultPadding),
              child: Column(
                children: [
                  // const SizedBox(
                  //   height: kDefaultPadding,
                  // ),
                  Row(
                    children: [
                      Expanded(
                        child: DefText(
                          controller.newsModel.value?.data.title ?? "",
                        ).semiLarge,
                      ),
                      const SizedBox(
                        width: kDefaultPadding,
                      ),
                      DefText(
                        dateFormater(
                          controller.newsModel.value?.data.createdAt ?? "",
                          dateFormat: kDateFormatDateOnly,
                        ),
                        // controller.newsModel.value?.data.title ?? "",
                      ).semiLarge,
                    ],
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  DefText(
                    controller.newsModel.value?.data.content ?? "",
                  ).normal,
                ],
              ),
            ),
          ],
        ));
  }
}
