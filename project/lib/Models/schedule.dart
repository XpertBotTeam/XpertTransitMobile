import 'dart:convert';

class Schedule{
  final String? day;
  final String? start_time;
  final String? end_time;
  final bool? is_attending;

  Schedule({
    this.day,
    this.start_time,
    this.end_time,
    this.is_attending

  });

  Map <String,dynamic> ToMap(){
    return {
      'day':day,
      'start_time':start_time,
      'end_time':end_time,
      'is_attending':is_attending
    };
  }

  String toJson()=>json.encode(ToMap());
}