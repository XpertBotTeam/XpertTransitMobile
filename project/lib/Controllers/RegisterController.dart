import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';


class RegisterController extends GetxController{
  TextEditingController name=TextEditingController();
  TextEditingController phone=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController password=TextEditingController();
  TextEditingController role=TextEditingController();

  void register() async
  {
    User user= User(name:name.value.text, email:email.value.text, phone:phone.value.text,password: password.value.text, role:role.value.text);
    String request_body=user.toJson();
    var post = await DioClient().getInstance().post('/register',data: request_body);
    if(post.statusCode==200)
      {
        showSuccessDialog(Get.context!, "Success", "User Registered Successfully", (){
          print(post.data);
        });

      }
  }

}