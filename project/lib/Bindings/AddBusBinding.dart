import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/AddBusController.dart';



class AddBusBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> AddBusController());
  }
}

