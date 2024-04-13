import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/HomeController.dart';


class HomeBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> HomeController());
  }
}