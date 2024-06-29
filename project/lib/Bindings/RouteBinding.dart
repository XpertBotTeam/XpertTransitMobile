import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/BusDetailsController.dart';
import 'package:xpertransitmobile_application/Controllers/DriverHomeController.dart';

import '../Controllers/RouteController.dart';


class RouteBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> RouteController());
  }
}

