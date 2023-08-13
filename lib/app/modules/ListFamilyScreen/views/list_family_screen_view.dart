import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_family_screen_controller.dart';

class ListFamilyScreenView extends GetView<ListFamilyScreenController> {
  const ListFamilyScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListFamilyScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListFamilyScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
