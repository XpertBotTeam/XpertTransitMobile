import "package:get/get.dart";
import 'package:flutter/material.dart';
import "package:xpertransitmobile_application/Routes/AppRoute.dart";
import "Routes/AppPage.dart";
import "Views/Login.dart";

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "XpertTransit",
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),

      initialRoute: AppRoute.login,
      getPages:AppPage.pages,

    );
  }
}




