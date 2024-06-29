import 'package:get/get.dart';

import '../Controllers/JoinBusController.dart';




class JoinBusBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> JoinBusController());
  }
}

