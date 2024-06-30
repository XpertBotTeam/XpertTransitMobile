import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xpertransitmobile_application/Core/Network/DioClient.dart';
import 'package:xpertransitmobile_application/Models/schedule.dart';


import '../Core/showSuccessDialog.dart';
import '../Models/User.dart';

class AddScheduleController extends GetxController {
  Future<String> getToken() async {
    return prefs.getString('token') ?? '';
  }

  TextEditingController day = TextEditingController();
  TextEditingController start_time = TextEditingController();
  TextEditingController end_time = TextEditingController();
  RxBool is_attending = false.obs;

  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  void addschedule() async {
    Schedule schedule = Schedule(
      day: day.text,
      start_time: start_time.text,
      end_time: end_time.text,
      is_attending: is_attending.value,
    );

    String request_body = schedule.toJson();

    var dio = DioClient().getInstance();
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = "application/json";

    var post = await dio.post('/schedules', data: request_body);

    if (post.statusCode == 200) {
      showSuccessDialog(Get.context!, 'Success', 'Schedule Added Successfully', () {});
    } else {
      showSuccessDialog(Get.context!, 'Error', 'Error Adding Schedule', () {});
    }
  }
}
