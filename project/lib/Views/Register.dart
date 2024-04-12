import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/RegisterController.dart';


class Register extends GetView<RegisterController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
        body:Padding(
            padding: EdgeInsets.only(top:10,left:10,right:10),
            child:Expanded(
                child:SingleChildScrollView(
                    child:Column(
                        children:[
                          SizedBox(height:40),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                  "Registration",
                                  style:TextStyle(
                                      fontSize: 35,
                                      color:Colors.deepPurple,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),
                          SizedBox(height:10),

                          Text("Name"),
                          SizedBox(height:10),
                          TextField(
                            controller: controller.name,
                          ),

                          SizedBox(height:10),

                          Text("Phone"),
                          SizedBox(height:10),
                          TextField(
                            controller: controller.phone,
                          ),

                          SizedBox(height:10),

                          Text("Email"),
                          SizedBox(height:10),
                          TextField(
                            controller: controller.email,
                          ),

                          SizedBox(height:10),

                          Text("Password"),
                          SizedBox(height: 10,),
                          TextField(
                            controller: controller.password,
                            obscureText: true,
                          ),


                          SizedBox(height:10),
                          Text("Role"),
                          SizedBox(height:10),
                          TextField(
                            controller: controller.role,
                          ),


                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              ElevatedButton(
                                  onPressed: (){
                                  controller.register();
                                  },child:Text("Register")
                              )
                            ],
                          )
                        ]
                    )
                )
            )

        )
    );
  }
}