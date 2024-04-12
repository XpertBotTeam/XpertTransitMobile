import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/RegisterController.dart';


class RegisterBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> RegisterController());
  }
}