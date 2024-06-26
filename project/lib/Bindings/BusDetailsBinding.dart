import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/BusDetailsController.dart';
import 'package:xpertransitmobile_application/Controllers/DriverHomeController.dart';


class BusDetailsBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> BusDetailsController());
  }
}

