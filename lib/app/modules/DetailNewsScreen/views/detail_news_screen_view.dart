import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/detail_news_screen_controller.dart';

class DetailNewsScreenView extends GetView<DetailNewsScreenController> {
  const DetailNewsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DetailNewsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'DetailNewsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
