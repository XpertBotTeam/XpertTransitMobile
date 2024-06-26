import 'dart:convert';

class Bus{
  final String? name;
  final String? description;

  Bus({
    this.name,
    this.description

  });

  Map <String,dynamic> ToMap(){
    return {
      'name':name,
      'description':description
    };
  }

  String toJson()=>json.encode(ToMap());
}