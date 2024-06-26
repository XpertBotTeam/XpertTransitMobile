import 'package:get/get.dart';

import '../Controllers/StudentHomeController.dart';

class StudentHomeBinding extends Bindings{
  @override
  void dependencies(){
    Get.lazyPut(() => StudentHomeController());
  }
}