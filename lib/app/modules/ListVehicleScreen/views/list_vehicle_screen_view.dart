import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_vehicle_screen_controller.dart';

class ListVehicleScreenView extends GetView<ListVehicleScreenController> {
  const ListVehicleScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListVehicleScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ListVehicleScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
