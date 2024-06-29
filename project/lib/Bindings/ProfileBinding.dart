import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/BusDetailsController.dart';
import 'package:xpertransitmobile_application/Controllers/DriverHomeController.dart';
import 'package:xpertransitmobile_application/Controllers/ProfileController.dart';

import '../Controllers/RouteController.dart';


class ProfileBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> ProfileController());
  }
}

