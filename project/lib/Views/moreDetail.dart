import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Controllers/moreDetailedController.dart';

class moreDetailed extends GetView<moreDetailedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bus Profile"),
        backgroundColor: Colors.teal[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [

        ],
      ),
    );
  }
}
