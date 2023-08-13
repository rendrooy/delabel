import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/finance_report_screen_controller.dart';

class FinanceReportScreenView extends GetView<FinanceReportScreenController> {
  const FinanceReportScreenView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FinanceReportScreenView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'FinanceReportScreenView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
