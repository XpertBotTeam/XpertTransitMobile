import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/HomeController.dart';


class Home extends GetView<HomeController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar: AppBar(
        title:Text("Home"),
        backgroundColor: Colors.teal,
      ),
      body:Column(
        children: [],
      ),
      drawer: Drawer(
        backgroundColor: Colors.teal,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            ElevatedButton(onPressed: (){
                controller.logout();
            }, child: Text("Logout"))
          ],
        )
      )


    );
  }
}