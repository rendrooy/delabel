import 'package:cached_network_image/cached_network_image.dart';
import 'package:delabel_v3/app/config/constants.dart';
import 'package:delabel_v3/app/util/func_util.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../components/defText.dart';
import '../../../routes/app_pages.dart';
import '../../AppBar/views/app_bar_view.dart';
import '../controllers/list_news_screen_controller.dart';

class ListNewsScreenView extends GetView<ListNewsScreenController> {
  const ListNewsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarView(
        title: DefText('List News', fontWeight: FontWeight.bold).large,
      ),
      body: Obx(
        () => ListView.separated(
          padding: const EdgeInsets.all(kDefaultPadding),
          itemBuilder: (c, i) {
            return Container(
                decoration: BoxDecoration(
                  color: secondaryColor,
                  boxShadow: [kDefaultShadow],
                  borderRadius: BorderRadius.circular(5),
                ),
                child: MaterialButton(
                  padding: EdgeInsets.zero,
                  // onLongPress: () {},
                  onPressed: () {
                    Get.toNamed(Routes.DETAIL_NEWS_SCREEN);
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
                                const Icon(Icons.image_not_supported_rounded),
                          ),
                        ),
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
                                    child: DefText(
                                      controller.listNews.value[i].data.title,
                                      fontWeight: FontWeight.bold,
                                      maxLine: 1,
                                    ).semiLarge,
                                  ),
                                  const SizedBox(width: kDefaultPadding),
                                  DefText(
                                    dateFormater(
                                      controller
                                          .listNews.value[i].data.createdAt,
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
                ));
          },
          separatorBuilder: (context, index) =>
              const SizedBox(height: kDefaultPadding),
          itemCount: controller.listNews.value.length,
        ),
      ),
    );
  }
}
