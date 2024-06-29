import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';
import '../Models/bus.dart';

class BusDetailsController extends GetxController {
  var buses = <Bus>[].obs;
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

      final url = Uri.parse('https://transit.xpertbotacademy.online/api/buses');
      final response = await http.get(
        url,
        headers: {
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> busesJson = jsonDecode(response.body)['data'];
        buses.assignAll(busesJson.map((json) => Bus.fromJson(json)).toList());
        print(busesJson);
      } else {
        throw Exception('Failed to load buses');
      }
    } catch (e) {
      print('Error fetching buses: $e');
    }
  }



void deleteBus(int busId) async {
    try {
      var dio = DioClient().getInstance();
      var token = await getToken();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.delete('/buses/$busId');

      if (response.statusCode == 200) {
        showSuccessDialog(Get.context!, 'Success', 'Bus Deleted Successfully', () {});
      } else {
        showSuccessDialog(Get.context!, 'Error', 'Error Deleting Bus', () {});
      }
    } catch (e) {
      print('Error deleting bus: $e');
      showSuccessDialog(Get.context!, 'Error', 'Error Deleting Bus', () {});
    }
  }


}
