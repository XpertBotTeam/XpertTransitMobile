import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../Controllers/AddBusController.dart';
import '../Controllers/BusDetailsController.dart';
import '../Controllers/RouteConrtoller.dart';

class Route extends GetView<RouteController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("Driver's PickUp Route"),
        backgroundColor: Colors.teal[700],
      ) ,

      body: Column(),




    );
  }
}