import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/settings_screen_controller.dart';

class SettingsScreenView extends GetView<SettingsScreenController> {
  const SettingsScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'SettingsScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
