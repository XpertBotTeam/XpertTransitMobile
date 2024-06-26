import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/AddScheduleController.dart';
import 'package:xpertransitmobile_application/Controllers/DriverHomeController.dart';


class AddScheduleBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> AddScheduleController());
  }
}

