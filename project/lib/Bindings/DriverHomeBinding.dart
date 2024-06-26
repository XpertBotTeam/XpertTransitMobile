import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/DriverHomeController.dart';


class DriverHomeBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> DriverHomeController());
  }
}

