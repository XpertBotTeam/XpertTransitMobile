import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';

class RegisterController extends GetxController {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  bool isStudentSelected = false;

  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  void register() async {
    User user = User(
      name: name.value.text,
      email: email.value.text,
      phone: phone.value.text,
      password: password.value.text,
      role: isStudentSelected ? 'student' : 'owner',
    );
    String requestBody = user.toJson();

    var post = await DioClient().getInstance().post('/register', data: requestBody);

    if (post.statusCode == 200) {
      showSuccessDialog(Get.context!, "Success", "User Registered Successfully", () {
        prefs.setString('token', post.data['token']);

        if (isStudentSelected) {
          Get.offNamed(AppRoute.studenthome); // Navigate to student home if student checkbox is selected
        } else {
          Get.offNamed(AppRoute.driverhome); // Navigate to driver home if driver checkbox is selected
        }
      });
    }
  }
}