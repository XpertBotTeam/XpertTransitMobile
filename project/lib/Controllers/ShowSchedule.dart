import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShowScheduleController extends GetxController{

  late SharedPreferences prefs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    prefs=await SharedPreferences.getInstance();
  }


}