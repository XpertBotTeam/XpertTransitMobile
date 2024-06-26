import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/DriverHomeController.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';


class DriverHome extends GetView<DriverHomeController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(

      appBar: AppBar(
        title:Text("Driver's Home"),
        backgroundColor: Colors.teal[700],
      ),

      body:Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [

          Image.asset('images/driverslogo.jpg',height:320,width: 650,),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              ElevatedButton(
                  onPressed: (){
                    Get.toNamed(AppRoute.busdetails);
                  },
                  child: Text("Bus Details",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),

                  ),),

              ElevatedButton(
                  onPressed: (){
                    Get.toNamed(AppRoute.addbus);
                  },

                  child: Text("Add Bus",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                    ),

                  ),),
            ],
          ),


           ElevatedButton(
               onPressed: (){
                 Get.toNamed(AppRoute.route);
               },
               child:  Text("Route",
                   style: TextStyle(
                       color: Colors.black,
                       fontWeight: FontWeight.bold,
                       fontSize: 16
                   ),

                 ),
               ),


        ],
      ),
      drawer: Drawer(
          backgroundColor: Colors.teal[800],
        child:Column(

          children: [

            DrawerHeader(
                child:Icon(Icons.directions_bus_filled,size: 70,

                )

            ),

            ListTile(
              leading: Icon(Icons.person,size: 30,color: Colors.black,),
              title: Text('Profile',
                style: TextStyle(
                    fontSize: 20
                ),),
              onTap: (){
                Get.toNamed(AppRoute.profile);
              },
            ),



            ListTile(
                leading: Icon(Icons.logout,size: 30,color: Colors.black,),
                title: Text('Logout',
                style: TextStyle(
                  fontSize: 20
                ),),
                onTap: (){
                  controller.logout();
                },
            ),






            /*ElevatedButton(onPressed: (){
                controller.logout();
            },
              child: Row(
              children: [
                Icon(Icons.logout),
                Text("Logout")
              ],
            ),
            )*/
          ],
        )
      )


    );
  }
}