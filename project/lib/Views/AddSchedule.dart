import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/AddScheduleController.dart';

class AddSchedule extends GetView<AddScheduleController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Driver's PickUp Route"),
        backgroundColor: Colors.teal[700],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            DropdownButtonFormField<String>(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                fillColor: Colors.teal.shade300,
                filled: true,
              ),
              value: controller.day.text.isNotEmpty ? controller.day.text : 'Monday',
              items: <String>[
                'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                controller.day.text = newValue!;
              },
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  final localizations = MaterialLocalizations.of(context);
                  controller.start_time.text = localizations.formatTimeOfDay(pickedTime);
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),
                    hintText: "Start Time",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.teal.shade300,
                    filled: true,
                  ),
                  controller: controller.start_time,
                ),
              ),
            ),
            SizedBox(height: 10),
            GestureDetector(
              onTap: () async {
                TimeOfDay? pickedTime = await showTimePicker(
                  context: context,
                  initialTime: TimeOfDay.now(),
                );
                if (pickedTime != null) {
                  final localizations = MaterialLocalizations.of(context);
                  controller.end_time.text = localizations.formatTimeOfDay(pickedTime);
                }
              },
              child: AbsorbPointer(
                child: TextField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500),
                    ),
                    hintText: "End Time",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.teal.shade300,
                    filled: true,
                  ),
                  controller: controller.end_time,
                ),
              ),
            ),
            SizedBox(height: 10),
            Obx(() => CheckboxListTile(
              title: Text('Is Attending'),
              value: controller.is_attending.value,
              onChanged: (bool? value) {
                if (value != null) {
                  controller.is_attending.value = value;
                }
              },
              controlAffinity: ListTileControlAffinity.leading,
              activeColor: Colors.teal.shade300,
              checkColor: Colors.white,
              tileColor: Colors.teal.shade300,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
                side: BorderSide(color: Colors.white),
              ),
            )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.addschedule,
              child: Text('Add'),
            ),
          ],
        ),
      ),
    );
  }
}
