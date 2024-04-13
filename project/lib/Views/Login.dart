import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/LoginController.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

class Login extends GetView<LoginController>
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
                SizedBox(height:80),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "XpertTransit",
                          style:TextStyle(
                            fontSize: 35,
                            color:Colors.deepPurple,
                            fontWeight: FontWeight.bold
            )
                    )
                  ],
                ),
                SizedBox(height:30),
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: (){
                        print("clicked");
                        print("email");
                        print(controller.email.text);
                        controller.login();
                      },child:Text("Login")
                    ),
                    ElevatedButton(
                        onPressed: (){
                        Get.toNamed(AppRoute.register )  ;
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