import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Bindings/HomeBinding.dart';
import 'package:xpertransitmobile_application/Bindings/LoginBinding.dart';
import 'package:xpertransitmobile_application/Bindings/RegisterBinding.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';
import 'package:xpertransitmobile_application/Views/Home.dart';
import 'package:xpertransitmobile_application/Views/Login.dart';
import 'package:xpertransitmobile_application/Views/Register.dart';

class AppPage{
  static final List<GetPage> pages=[
    GetPage(name: AppRoute.login, page:()=>Login(),binding:LoginBinding()),
    GetPage(name: AppRoute.register, page:()=>Register(),binding:RegisterBinding()),
    GetPage(name: AppRoute.home, page:()=>Home(),binding:HomeBinding())
  ];
}