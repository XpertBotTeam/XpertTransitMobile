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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () {
              controller.getCode();
            },
            child: Text('Get Code'),
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.white)
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade500)
                ),
                hintText: "Enter Bus Code to Join Bus",
                hintStyle: TextStyle(color: Colors.black),
                fillColor: Colors.teal.shade300,
                filled: true,
              ),
              controller: controller.code,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              controller.joinBus();
            },
            child: Text('Join'),
          ),
        ],
      ),
    );
  }
}
