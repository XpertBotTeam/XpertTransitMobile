import 'dart:convert';

class User{
  final String? name;
  final String? email;
  final String? phone;
  final String? password;
  final String? role;

  User({
   this.name,
   required this.email,
   this.phone,
   this.password,
    this.role

});

  Map <String,dynamic> ToMap(){
    return {
      'name':name,
      'email':email,
      'phone':phone,
      'password':password,
      'role':role
    };
  }
  String toJson()=>json.encode(ToMap());
}