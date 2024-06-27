import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';


class moreDetailedController extends GetxController{

  Future<String?> getToken() async {
    return prefs.getString('token');
  }

  late SharedPreferences prefs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    prefs=await SharedPreferences.getInstance();

  }




  /*void deleteBus(String busId) async {
    try {
      var dio = DioClient().getInstance();
      var token = await getToken();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.delete('/buses/$busId');

      if (response.statusCode == 200) {
        showSuccessDialog(Get.context!, 'Success', 'Bus Deleted Successfully', () {});
      } else {
        showSuccessDialog(Get.context!, 'Error', 'Error Deleting Bus', () {});
      }
    } catch (e) {
      print('Error deleting bus: $e');
      showSuccessDialog(Get.context!, 'Error', 'Error Deleting Bus', () {});
    }
  }*/

}