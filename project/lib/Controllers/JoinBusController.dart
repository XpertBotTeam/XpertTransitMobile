import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http; // Add this line to import the http package
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

  Future<String?> getToken() async {
    return prefs.getString('token');
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

  Future<void> getCode(String busId) async {
    try {
      final token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }


      final studentsUrl = Uri.parse('https://transit.xpertbotacademy.online/api/buses/$busId/students');
      final studentsResponse = await http.get(
        studentsUrl,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (studentsResponse.statusCode != 200) {
        throw Exception('Failed to load students');
      }

      final List<dynamic> studentsData = jsonDecode(studentsResponse.body)['data'];
      if (studentsData.length < 5) {

        await fetchBusCode(busId, token);
      } else {

        await fetchBusWithLessStudents(token);
      }
    } catch (e) {
      print('Error fetching code: $e');
      showSuccessDialog(Get.context!, 'Error', 'Error fetching bus code', () {});
    }
  }

  Future<void> fetchBusCode(String busId, String token) async {

    final busUrl = Uri.parse('https://transit.xpertbotacademy.online/api/buses/$busId');
    final busResponse = await http.get(
      busUrl,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    if (busResponse.statusCode != 200) {
      throw Exception('Failed to load bus details');
    }

    final busData = jsonDecode(busResponse.body);
    final busCode = busData['code'];

    code.text = busCode;
    print('Bus code: $busCode');
  }

  Future<void> fetchBusWithLessStudents(String token) async {
    try {

      final busesUrl = Uri.parse('https://transit.xpertbotacademy.online/api/buses');
      final busesResponse = await http.get(
        busesUrl,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (busesResponse.statusCode != 200) {
        throw Exception('Failed to load buses');
      }

      final List<dynamic> busesData = jsonDecode(busesResponse.body)['data'];


      for (var bus in busesData) {
        final busId = bus['id'].toString();
        final studentsUrl = Uri.parse('https://transit.xpertbotacademy.online/api/buses/$busId/students');
        final studentsResponse = await http.get(
          studentsUrl,
          headers: {
            'Authorization': 'Bearer $token',
          },
        );

        if (studentsResponse.statusCode == 200) {
          final List<dynamic> studentsData = jsonDecode(studentsResponse.body)['data'];
          if (studentsData.length < 5) {
            await fetchBusCode(busId, token);
            return;
          }
        }
      }

      showSuccessDialog(Get.context!, 'Info', 'No available bus with less than 5 students', () {});
    } catch (e) {
      print('Error fetching bus with less students: $e');
      showSuccessDialog(Get.context!, 'Error', 'Error fetching bus with less students', () {});
    }
  }
}


