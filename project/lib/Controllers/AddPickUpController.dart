import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:geolocator/geolocator.dart';

import 'package:xpertransitmobile_application/Models/location.dart';

import '../Core/Network/DioClient.dart';
import '../Core/showSuccessDialog.dart';

class AddPickUpController extends GetxController {
  late SharedPreferences prefs;

  TextEditingController latitude = TextEditingController();
  TextEditingController longitude = TextEditingController();

  var locationMessage = ''.obs;
  var lat = ''.obs;
  var long = ''.obs;

  @override
  void onInit() async {
    super.onInit();
    prefs = await SharedPreferences.getInstance();
  }

  Future<String> getToken() async {
    return prefs.getString('token') ?? '';
  }

  Future<Position> getCurrentLocation() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied.');
    }

    return await Geolocator.getCurrentPosition();
  }

  void liveLocation() {
    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );
    Geolocator.getPositionStream(locationSettings: locationSettings)
        .listen((Position position) {
      lat.value = position.latitude.toString();
      long.value = position.longitude.toString();
      locationMessage.value = 'Latitude: ${lat.value}, Longitude: ${long.value}';
    });
  }



  void fetchLocation() async {
    try {
      Position position = await getCurrentLocation();
      latitude.text = position.latitude.toString();
      longitude.text = position.longitude.toString();
      locationMessage.value = 'Latitude: ${latitude.text}, Longitude: ${longitude.text}';
    } catch (e) {
      locationMessage.value = e.toString();
    }
  }




  void addPickUp() async {
    Location location = Location(
      latitude: latitude.value.text,
      longitude: longitude.value.text,
    );

    String request_body = location.toJson();

    var dio = DioClient().getInstance();
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Content-Type"] = "application/json";

    var post = await dio.post('/locations', data: request_body);

    if (post.statusCode == 200) {
      showSuccessDialog(
          Get.context!, 'Success', 'Location Sent to Driver', () {});
    } else {
      showSuccessDialog(Get.context!, 'Error', 'Error Adding Location', () {});
    }
  }
}
