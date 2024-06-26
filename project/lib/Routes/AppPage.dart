import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Bindings/AddBusBinding.dart';
import 'package:xpertransitmobile_application/Bindings/AddPickUpBinding.dart';
import 'package:xpertransitmobile_application/Bindings/BusDetailsBinding.dart';
import 'package:xpertransitmobile_application/Bindings/DriverHomeBinding.dart';
import 'package:xpertransitmobile_application/Bindings/LoginBinding.dart';
import 'package:xpertransitmobile_application/Bindings/ProfileBinding.dart';
import 'package:xpertransitmobile_application/Bindings/RegisterBinding.dart';
import 'package:xpertransitmobile_application/Bindings/RouteBinding.dart';
import 'package:xpertransitmobile_application/Bindings/ShowScheduleBinding.dart';
import 'package:xpertransitmobile_application/Bindings/StudentHomeBinding.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';
import 'package:xpertransitmobile_application/Views/AddBus.dart';
import 'package:xpertransitmobile_application/Views/AddPickUp.dart';
import 'package:xpertransitmobile_application/Views/AddSchedule.dart';
import 'package:xpertransitmobile_application/Views/BusDetails.dart';
import 'package:xpertransitmobile_application/Views/DriverHome.dart';
import 'package:xpertransitmobile_application/Views/Login.dart';
import 'package:xpertransitmobile_application/Views/Profile.dart';
import 'package:xpertransitmobile_application/Views/Register.dart';
import 'package:xpertransitmobile_application/Views/Route.dart';
import 'package:xpertransitmobile_application/Views/ShowSchedule.dart';
import 'package:xpertransitmobile_application/Views/StudentHome.dart';

import '../Bindings/AddScheduleBinding.dart';

class AppPage{
  static final List<GetPage> pages=[
    GetPage(name: AppRoute.login, page:()=>Login(),binding:LoginBinding()),
    GetPage(name: AppRoute.register, page:()=>Register(),binding:RegisterBinding()),
    GetPage(name: AppRoute.driverhome, page:()=>DriverHome(),binding:DriverHomeBinding()),
    GetPage(name: AppRoute.studenthome, page: ()=>StudentHome(),binding:StudentHomeBinding()),
    GetPage(name: AppRoute.addschedule, page: ()=>AddSchedule(),binding:AddScheduleBinding()),
    GetPage(name: AppRoute.addpickup, page: ()=>AddPickUp(),binding:AddPickUpBinding()),
    GetPage(name: AppRoute.busdetails, page: ()=>BusDetails(),binding:BusDetailsBinding()),
    GetPage(name: AppRoute.addbus, page: ()=>AddBus(),binding:AddBusBinding()),
    GetPage(name: AppRoute.route, page: ()=>Route(),binding:RouteBinding()),
    GetPage(name: AppRoute.profile, page: ()=>Profile(),binding:ProfileBinding()),
    GetPage(name: AppRoute.schedule, page: ()=>ShowSchedule(),binding:ShowScheduleBinding()),

  ];
}