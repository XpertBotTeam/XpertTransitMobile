import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';

class JoinBusController extends GetxController {
  TextEditingController code = TextEditingController();
  late SharedPreferences prefs;

  @override
  void onInit() {
    super.onInit();
    _initializePreferences();
  }

  void _initializePreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<String> getToken() async {
    return prefs.getString('token') ?? '';
  }

  void joinBus() async {
    var busCode = code.text;
    if (busCode.isEmpty) {
      showSuccessDialog(Get.context!, 'Error', 'Code cannot be empty', () {});
      return;
    }

    var dio = DioClient().getInstance();
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = "application/json";

    var response = await dio.post("/buses/join", data: {'code': busCode});

    if (response.statusCode == 200) {
      showSuccessDialog(Get.context!, 'Success', 'Successfully joined the bus', () {});
    } else {
      showSuccessDialog(Get.context!, 'Error', 'Error joining bus', () {});
    }
  }

  void getCode() {
    // Implement the logic for getting the code
  }
}
