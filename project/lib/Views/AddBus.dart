import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import '../Controllers/AddBusController.dart';

class AddBus extends GetView<AddBusController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("Add a Bus"),
        backgroundColor: Colors.teal[700],
      ) ,

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextField(

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500)
              ),

              hintText: "Name",
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.teal.shade300,
              filled: true,


            ),
            controller: controller.name,
            //obscureText: true,

          ),


          TextField(

            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white)
              ),

              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey.shade500)
              ),

              hintText: "Description",
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.teal.shade300,
              filled: true,


            ),
            controller: controller.description,
            //obscureText: true,

          ),
          
          ElevatedButton(
              onPressed: (){
                controller.addbus();
              },
              child: Text('Add')
          
          )
        ],

      ),




    );
  }
}