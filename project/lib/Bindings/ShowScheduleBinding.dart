import 'package:get/get.dart';

import '../Controllers/ShowScheduleController.dart';

class ShowScheduleBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> ShowScheduleController());
  }
}

