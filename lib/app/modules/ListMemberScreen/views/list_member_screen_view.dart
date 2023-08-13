import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_member_screen_controller.dart';

class ListMemberScreenView extends GetView<ListMemberScreenController> {
  const ListMemberScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListMemberScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListMemberScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
