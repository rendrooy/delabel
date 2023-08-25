import 'package:get/get.dart';

import '../../../models/news_model.dart';
import '../../../services/news_service.dart';

class ListNewsAdminScreenController extends GetxController {
  //TODO: Implement ListNewsAdminScreenController
  var listNews = <NewsModel>[].obs;
  var listSelectedNews = <NewsModel>[].obs;

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

  void increment() => count.value++;
}
