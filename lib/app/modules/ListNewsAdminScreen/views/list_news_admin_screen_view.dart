import 'package:delabel_v3/app/config/constants.dart';
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
      child: Scaffold(
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.toNamed(Routes.FORM_NEWS_ADMIN_SCREEN);
          },
          icon: const Icon(Icons.add),
          label: DefText('Add News', color: Colors.black).normal,
        ),
        appBar: AppBarView(
          title: DefText('ListNewsAdminScreenView', fontWeight: FontWeight.bold)
              .large,
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
                    onLongPress: () {},
                    onPressed: () {},
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.horizontal(
                              left: Radius.circular(5),
                            ),
                            child: Container(
                                height: 150,
                                width: 150,
                                alignment: Alignment.center,
                                child: const Icon(
                                    Icons.image_not_supported_rounded))),
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.all(kDefaultPadding),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: DefText(
                                        "item.data.title",
                                        fontWeight: FontWeight.bold,
                                        maxLine: 1,
                                      ).semiLarge,
                                    ),
                                  ],
                                ),
                                const SizedBox(height: kDefaultPadding / 2),
                                DefText(
                                  "item.data.content",
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
      ),
    );
  }
}
