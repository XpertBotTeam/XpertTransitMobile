import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:xpertransitmobile_application/Views/Login.dart';
import '../Controllers/LoginController.dart';
import '../Controllers/ProfileController.dart';


class Profile extends GetView<ProfileController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("User's Profile"),
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