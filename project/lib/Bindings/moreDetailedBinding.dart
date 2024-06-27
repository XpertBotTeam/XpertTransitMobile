import 'package:get/get.dart';
import '../Controllers/moreDetailedController.dart';


class moreDetailedBinding extends Bindings{
  @override
  void dependencies () {
    Get.lazyPut(()=> moreDetailedController());
  }
}

