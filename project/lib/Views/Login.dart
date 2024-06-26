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
      backgroundColor: Colors.teal[700],
      body:Padding(
        padding: EdgeInsets.only(top:10,left:10,right:10),

        child:Expanded(
          child:SingleChildScrollView(
            child:Column(
              children:[

                SizedBox(height:90),

                Icon(Icons.lock,size: 75,color: Colors.grey[900],),

                /*CircleAvatar(
                  radius: 50,
                  //backgroundImage: AssetImage('images/'),
                ),*/
                SizedBox(height:30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Text(
                      "XpertTransit",
                          style:TextStyle(
                            fontSize: 35,
                            color:Colors.black,
                            fontWeight: FontWeight.bold
                    )
                    )
                  ],
                ),
                Text('Welcome Back!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w700
                ),),

                SizedBox(height:20),

                SizedBox(height:20),

                TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white)
                      ),

                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey.shade500)
                      ),

                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.teal.shade300,
                      filled: true,
                    ),
                  controller: controller.email,

                ),

                SizedBox(height: 40),



                TextField(

                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade500)
                    ),

                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.teal.shade300,
                    filled: true,


                  ),
                  controller: controller.password,
                  obscureText: true,

                ),

                SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 40),

                    ElevatedButton(
                      onPressed: (){
                        print("clicked");
                        print("email");
                        print(controller.email.text);
                        controller.login();
                      },

                        child:Center(
                          child: Text("Login",
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),

                          ),
                        ),
                    ),

                    SizedBox(height: 0.2),

                    ElevatedButton(
                        onPressed: (){
                        Get.toNamed(AppRoute.register )  ;
                        },

                        child: Center(
                            child: Text("Register",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),

                            ),
                          ),

                        )

                      //Text("Register")

                  ],
                ),

              ]
            )
          )
        )

      )
    );
  }
}