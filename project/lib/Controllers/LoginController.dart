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
  void onInit() {
    super.onInit();
    initializePreferences();
  }

  Future<void> initializePreferences() async {
    prefs = await SharedPreferences.getInstance();

    if (prefs.getString('token') != null && prefs.getString('role')=='student') {
      Get.offNamed(AppRoute.studenthome);
    } else if(prefs.getString('token') != null && prefs.getString('role')=='owner')
      Get.offNamed(AppRoute.studenthome);
    else {
      Get.offNamed(AppRoute.login);
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



      }

  }
}