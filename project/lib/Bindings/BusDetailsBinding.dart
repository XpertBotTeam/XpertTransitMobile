import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/BusDetailsController.dart';


class BusDetailsBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> BusDetailsController());
  }
}

