import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../Controllers/AddPickUpController.dart';

class AddPickUp extends GetView<AddPickUpController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add your pick up location"),
        backgroundColor: Colors.teal[700],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            Icon(Icons.location_on, size: 100),


            Obx(() => Center(
              child: Text(controller.locationMessage.value,
                  style: TextStyle(
                      fontSize: 19,
                  ),),
            )),


            ElevatedButton(
              onPressed: () {
                controller.fetchLocation();
              },
              child: Text('View Current Location'),
            ),



            ElevatedButton(
              onPressed: ()  {
                controller.addPickUp();
             },
              child: Text('Send My Location'),
            ),



            Image.asset('images/geoloc.jpg', width: 250, height: 250),
          ],
        ),
      ),
    );
  }
}
