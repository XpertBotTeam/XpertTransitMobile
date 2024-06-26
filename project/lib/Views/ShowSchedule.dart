import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Controllers/ProfileController.dart';
import '../Controllers/ShowSchedule.dart';


class ShowSchedule extends GetView<ShowScheduleController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("Student's Schedule"),
        backgroundColor: Colors.teal[700],
      ) ,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [


        ],
      ),

    );
  }
}