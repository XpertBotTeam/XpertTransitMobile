import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/LoginController.dart';

class LoginBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> LoginController());
  }
}