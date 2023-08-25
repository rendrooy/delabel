import 'package:get/get.dart';

import '../../../models/news_model.dart';

class DetailNewsScreenController extends GetxController {
  //TODO: Implement DetailNewsScreenController

  final count = 0.obs;
  final newsModel = Rxn<NewsModel>();

  @override
  void onInit() {
    newsModel.value = Get.arguments;
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
