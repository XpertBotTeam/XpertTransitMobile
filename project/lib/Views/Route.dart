import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/RouteController.dart';

class Route extends StatelessWidget {
  final RouteController routeController = Get.put(RouteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver's PickUp Route"),
        backgroundColor: Colors.teal[700],
      ),
      body: Obx(() {
        if (routeController.locations.isEmpty) {
          return Center(child: Text('No locations found'));
        }

        return ListView.builder(
          itemCount: routeController.locations.length,
          itemBuilder: (context, index) {
            final location = routeController.locations[index];
            return ListTile(
              title: Text('Latitude: ${location.latitude}, Longitude: ${location.longitude}'),
            );
          },
        );
      }),
    );
  }
}
