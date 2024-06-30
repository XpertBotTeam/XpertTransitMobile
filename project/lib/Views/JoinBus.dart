import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/JoinBusController.dart';

class JoinBus extends GetView<JoinBusController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join Bus"),
        backgroundColor: Colors.teal[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {

                String busId = '11';
                controller.getCode(busId);
              },
              child: Text('Get Code'),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500),
                ),
                hintText: "Enter Bus Code to Join Bus",
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.teal.shade300,
                filled: true,
              ),
              controller: controller.code,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                controller.joinBus();
              },
              child: Text('Join'),
            ),
          ],
        ),
      ),
    );
  }
}
