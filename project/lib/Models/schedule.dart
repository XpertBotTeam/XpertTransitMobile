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

  factory Schedule.fromJson(Map<String, dynamic> json) {
    return Schedule(
      day: json['day'] as String?,
      start_time: json['start_time'] as String?,
      end_time: json['end_time'] as String?,
      is_attending: json['is_attending'] is bool ? json['is_attending'] : json['is_attending'] == 1,
    );
  }


}