import 'package:get/get.dart';

import '../Controllers/ShowSchedule.dart';

class ShowScheduleBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> ShowScheduleController());
  }
}

