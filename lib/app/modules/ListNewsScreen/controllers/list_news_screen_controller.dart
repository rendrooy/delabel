import 'package:get/get.dart';

import '../../../models/news_model.dart';
import '../../../services/news_service.dart';

class ListNewsScreenController extends GetxController {
  //TODO: Implement ListNewsController

  var listNews = <NewsModel>[].obs;

  final count = 0.obs;
  @override
  void onInit() {
    getListNews();
    super.onInit();
  }

  Future getListNews() async {
    List res = await NewsServices().getAllData();
    // logKey(res[0]);
    listNews.value = res.map((e) => NewsModel.fromJson(e)).toList();
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
