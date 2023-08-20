import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_news_screen_controller.dart';

class ListNewsScreenView extends GetView<ListNewsScreenController> {
  const ListNewsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListNewsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListNewsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
