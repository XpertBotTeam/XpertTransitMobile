import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/BusDetailsController.dart';
import '../Models/bus.dart';

class BusDetails extends GetView<BusDetailsController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buses"),
        backgroundColor: Colors.teal[700],
      ),

      body: Obx(() {
        if (controller.buses.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ListView.builder(
            itemCount: controller.buses.length,
            itemBuilder: (context, index) {
              Bus bus = controller.buses[index];
              return ListTile(
                title: Text(bus.name ?? ''),
                subtitle: Text(bus.description ?? ''),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    //controller.deleteBus(bus.id); **********
                  },
                ),
              );
            },
          );
        }
      }),
    );
  }

  void _showDeleteConfirmationDialog(BuildContext context, Bus bus) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirm Deletion'),
          content: Text('Are you sure you want to delete this bus?'),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Delete'),
              onPressed: () {
                // Assuming bus name is unique and used as an identifier
                controller.deleteBus(bus.id!);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
