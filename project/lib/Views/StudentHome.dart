import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xpertransitmobile_application/Controllers/StudentHomeController.dart';
import 'package:xpertransitmobile_application/Routes/AppRoute.dart';

class StudentHome extends GetView<StudentHomeController>
{
  @override
  Widget build(BuildContext)
  {
    return Scaffold(
        appBar: AppBar(
          title:Text("Student's Home"),
            backgroundColor: Colors.teal[700],
        ),
        body:
        Column(

          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

            Image.asset('images/boyStudent.jpg',width:400,height: 320,),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                ElevatedButton(
                    onPressed:(){
                      Get.toNamed(AppRoute.addschedule);
                    },
                    child: Center(
                      child: Text("Add Schedule",
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16
                        ),

                      ),
                    ),),

                ElevatedButton(
                    onPressed:(){
                      Get.toNamed(AppRoute.addpickup);
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),

                      child: Text("Pick-up Location",

                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,

                        ),

                      ),
                    ),

                ),
                
              ],
            ),


            ElevatedButton(onPressed: (){
              Get.toNamed(AppRoute.schedule);
            },
                child: Text('Show My Schedule',
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,

                  ),


                ))




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




               /* ElevatedButton(onPressed: (){
                  controller.logout();
                }, child: Text("Logout"))*/

              ],
            )
        )


    );
  }
}