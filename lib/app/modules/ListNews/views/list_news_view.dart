import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_news_controller.dart';

class ListNewsView extends GetView<ListNewsController> {
  const ListNewsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListNewsView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListNewsView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
