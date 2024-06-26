import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Core/showSuccessDialog.dart';
import 'package:xpertransitmobile_application/Models/bus.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

import '../Core/Network/DioClient.dart';
import '../Models/User.dart';


class AddBusController extends GetxController{

  Future<String> getToken() async {
    return prefs.getString('token')??'';
    }


  TextEditingController name=TextEditingController();
  TextEditingController description=TextEditingController();


  late SharedPreferences prefs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();
    prefs=await SharedPreferences.getInstance();
  }


  void addbus() async{
      Bus bus=Bus(name:name.value.text,description: description.value.text);
      String request_body=bus.toJson();

      var dio=DioClient().getInstance();
      var token=await getToken();
      dio.options.headers["Authorization"]="Bearer $token";

      dio.options.headers["Content-Type"]="application/json";

      var post=await dio.post('/buses',data: request_body);

      if(post.statusCode==200){
        showSuccessDialog(Get.context!, 'Success', 'Bus Added Successfully', (){});
      }else{
        showSuccessDialog(Get.context!, 'Error', 'Error Adding Bus', (){});
      }

  }

 
}