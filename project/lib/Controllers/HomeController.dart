import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

import '../Models/User.dart';


class HomeController extends GetxController{

  late SharedPreferences prefs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    prefs=await SharedPreferences.getInstance();
  }

  void logout()
  {
    prefs.remove("token");
    Get.offNamed(AppRoute.login);
  }
}