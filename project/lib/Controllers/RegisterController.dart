import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';


class RegisterController extends GetxController{
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController role=TextEditingController();

  late SharedPreferences prefs;  // no need to re-register when re-entering the app
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    prefs= await SharedPreferences.getInstance();
  }


  void register() async
  {
    User user= User(name:name.value.text, email:email.value.text, phone:phone.value.text,password: password.value.text, role:role.value.text);
    String request_body=user.toJson();
    var post = await DioClient().getInstance().post('/register',data: request_body);
    if(post.statusCode==200)
      {
        showSuccessDialog(Get.context!, "Success", "User Registered Successfully", (){
          print(post.data);
          prefs.setString('token',post.data['token']);//save the token so when re-entering the app no need to register again
          Get.offNamed(AppRoute.home);  // go to home page after successful registration
        });

      }
  }

}