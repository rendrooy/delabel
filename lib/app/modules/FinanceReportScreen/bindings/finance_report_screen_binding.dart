import 'package:get/get.dart';

import '../controllers/finance_report_screen_controller.dart';

class FinanceReportScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FinanceReportScreenController>(
      () => FinanceReportScreenController(),
    );
  }
}
