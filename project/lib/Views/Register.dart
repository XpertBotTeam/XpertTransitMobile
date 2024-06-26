import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/RegisterController.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final RegisterController controller = Get.put(RegisterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: Padding(
        padding: EdgeInsets.only(top: 10, left: 10, right: 10),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 40),
              Icon(Icons.person, size: 70),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Registration",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  SizedBox(height: 12),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      hintText: "Name",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.teal.shade300,
                      filled: true,
                    ),
                    controller: controller.name,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      hintText: "Phone",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.teal.shade300,
                      filled: true,
                    ),
                    controller: controller.phone,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      hintText: "Email",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.teal.shade300,
                      filled: true,
                    ),
                    controller: controller.email,
                  ),
                  SizedBox(height: 5),
                  TextField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade500),
                      ),
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.black),
                      fillColor: Colors.teal.shade300,
                      filled: true,
                    ),
                    controller: controller.password,
                    obscureText: true,
                  ),
                  SizedBox(height: 30),
                ],
              ),
              Column(
                children: [
                  Text(
                    'Role',
                    style: TextStyle(fontWeight: FontWeight.w800),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Checkbox(
                        value: !controller.isStudentSelected,
                        onChanged: (value) {
                          setState(() {
                            controller.isStudentSelected = !value!;
                          });
                        },
                      ),

                      SizedBox(width: 10),
                      Text('Driver'),
                      Checkbox(
                        value: controller.isStudentSelected,
                        onChanged: (value) {
                          setState(() {
                            controller.isStudentSelected = value!;
                          });
                        },
                      ),
                      SizedBox(width: 10),
                      Text('Student'),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      controller.register();
                    },
                    child: Center(
                      child: Text(
                        "Register",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16),
                      ),
                    ),
                  ),


                ],

              ),


              InkWell(
                onTap:(){
                  Get.toNamed(AppRoute.login);
                } ,
                child: Text('Already have an account?Login',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.bold,
                              fontSize: 16
                            ),


                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
