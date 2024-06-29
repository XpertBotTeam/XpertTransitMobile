import 'dart:convert';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import '../Models/location.dart';

class RouteController extends GetxController {
 var locations = <Location>[].obs;
 late SharedPreferences prefs;

 @override
 void onInit() {
  super.onInit();
  initPrefs();
 }

 Future<void> initPrefs() async {
  prefs = await SharedPreferences.getInstance();
  fetchLocations();
 }

 Future<String?> getToken() async {
  return prefs.getString('token');
 }

 void fetchLocations() async {
  try {
   final token = await getToken();
   if (token == null) {
    throw Exception('Token not found');
   }

   final url = Uri.parse('https://transit.xpertbotacademy.online/api/locations');
   final response = await http.get(
    url,
    headers: {
     'Authorization': 'Bearer $token',
    },
   );

   if (response.statusCode == 200) {
    final List<dynamic> locationsJson = jsonDecode(response.body)['data'];
    locations.assignAll(locationsJson.map((json) => Location.fromJson(json)).toList());
    print(locationsJson);
   } else {
    throw Exception('Failed to load locations');
   }
  } catch (e) {
   print('Error fetching locations: $e');
  }
 }
}
