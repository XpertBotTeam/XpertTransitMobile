import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
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
              child: Text(
                controller.locationMessage.value,
                style: TextStyle(fontSize: 19),
              ),
            )),
            ElevatedButton(
              onPressed: () {
                controller.fetchLocation();
              },
              child: Text('View Current Location'),
            ),
            ElevatedButton(
              onPressed: () {
                controller.addPickUp();
              },
              child: Text('Send My Location'),
            ),
            ElevatedButton(
              onPressed: () async {
                var latitude = controller.latitude.text;
                var longitude = controller.longitude.text;

                if (latitude.isEmpty || longitude.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Location not fetched yet')),
                  );
                  return;
                }

                if (!isNumeric(latitude) || !isNumeric(longitude)) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Invalid location coordinates')),
                  );
                  return;
                }

                var googleMapsUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';

                if (await canLaunch(googleMapsUrl)) {
                  await launch(googleMapsUrl);
                } else {
                  print('Could not launch $googleMapsUrl');
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not launch Google Maps')),
                  );
                }
              },
              child: Text('Open in Google Maps'),
            ),
            Image.asset('images/geoloc.jpg', width: 250, height: 250),
          ],
        ),
      ),
    );
  }

  bool isNumeric(String str) {
    if (str.isEmpty) return false;
    final number = num.tryParse(str);
    return (number != null);
  }
}
