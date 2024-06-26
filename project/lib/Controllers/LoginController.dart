import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Core/Network/DioClient.dart';

import '../Models/User.dart';
import '../Routes/AppRoute.dart';


class LoginController extends GetxController{
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();

  late SharedPreferences prefs;
  @override
  void onInit() async{
    // TODO: implement onInit
    super.onInit();

    prefs= await SharedPreferences.getInstance();

    if(prefs.getString('token')!=null)        // not null token? go to home page
    {
      Get.offNamed(AppRoute.driverhome);  //to be changed
    }
  }


  void login () async
  {
    User user = User(email:email.value.text,password:password.value.text);
    String request_body=user.toJson();

    var post=await DioClient().getInstance().post("/login",data:request_body);

    if(post.statusCode==200)
      {
        prefs.setString("token", post.data['token']); //if null token, create a token
        prefs.setString("role", post.data['role']);

        if(post.data['role']=='student'){
          Get.offNamed(AppRoute.studenthome);
        }
        else{
          Get.offNamed(AppRoute.driverhome);
        }

        //Get.offNamed(AppRoute.studenthome);//when logged in take me to home page
        //add an if condition here + do not forget to add && at the top where if token present,
        //go directly to the specified homepage

      }

  }
}