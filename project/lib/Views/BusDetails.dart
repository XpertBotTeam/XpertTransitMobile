import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';


import '../Controllers/BusDetailsController.dart';

class BusDetails extends GetView<BusDetailsController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("View Bus Details"),
        backgroundColor: Colors.teal[700],
      ) ,

      body: Column(),




    );
  }
}