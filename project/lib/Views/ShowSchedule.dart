import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/ShowScheduleController.dart';
import '../Models/schedule.dart';

class ShowSchedule extends GetView<ShowScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student's Schedule"),
        backgroundColor: Colors.teal[700],
      ),

      body:
      Obx(
            () => ListView.builder(
          itemCount: controller.schedules.length,
          itemBuilder: (context, index) {
            Schedule schedule = controller.schedules[index];
            return Card(
              margin: EdgeInsets.all(10),
              child: ListTile(
                title: Text(schedule.day ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Start Time: ${schedule.start_time ?? ''}'),
                    Text('End Time: ${schedule.end_time ?? ''}'),
                    Text('Attending: ${schedule.is_attending ?? false ? 'Yes' : 'No'}'),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
