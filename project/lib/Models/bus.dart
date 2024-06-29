import 'dart:convert';

class Bus{
  final int? id;
  final String? name;
  final String? description;

  Bus({
    this.id,
    this.name,
    this.description

  });

  Map <String,dynamic> ToMap(){
    return {
      'id':id,
      'name':name,
      'description':description
    };
  }

  String toJson()=>json.encode(ToMap());


  factory Bus.fromJson(Map<String, dynamic> json) {
    return Bus(
        id:json['id'] as int?,
        name: json['name'] as String?,
        description: json['description'] as String?,
        );
    }

}