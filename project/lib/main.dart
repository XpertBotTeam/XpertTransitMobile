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
      title: "XpertTransfer",
      theme:ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true
      ),
      initialRoute: AppRoute.login,
      getPages:AppPage.pages,
      home:Login()
    );
  }
}




