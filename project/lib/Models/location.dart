import 'dart:convert';

class Location{
  //final String? user_id;
  final String? latitude;
  final String? longitude;

  Location({
    //this.user_id,
    this.latitude,
    this.longitude
});

  Map <String,dynamic> ToMap(){
    return{
      //'user_id':user_id,
      'latitude':latitude,
      'longitude':longitude
    };
  }
  String toJson()=>json.encode(ToMap());
}