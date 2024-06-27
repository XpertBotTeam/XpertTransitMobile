import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:xpertransitmobile_application/Models/bus.dart';

import '../Models/schedule.dart';

class ShowScheduleController extends GetxController {

  var schedules = <Schedule>[].obs;
  late SharedPreferences prefs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
    busDetails();
  }

  Future<String?> getToken() async {
    return prefs.getString('token');
  }

  void busDetails() async {
    try {
      final token = await getToken();
      if (token == null) {
        throw Exception('Token not found');
      }

      final url = Uri.parse('https://transit.xpertbotacademy.online/api/schedules');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> schedulesJson = jsonDecode(response.body)['data'];
        schedules.assignAll(schedulesJson.map((json) => Schedule.fromJson(json)).toList());
      } else {
        throw Exception('Failed to load schedule');
      }
    } catch (e) {
      print('Error fetching schedule: $e');
    }
  }
//dioclient




}
