import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

import '../Models/User.dart';


class DriverHomeController extends GetxController{

  late SharedPreferences prefs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    prefs=await SharedPreferences.getInstance();
  }

  void logout()    // to logout,remove token
  {
    prefs.remove("token");
    Get.offNamed(AppRoute.login);
  }
}