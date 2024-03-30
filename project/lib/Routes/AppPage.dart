import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Bindings/LoginBinding.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';
import 'package:xpertransitmobile_application/Views/Login.dart';

class AppPage{
  static final List<GetPage> pages=[
    GetPage(name: AppRoute.login, page:()=>Login(),binding:LoginBinding())
  ];
}