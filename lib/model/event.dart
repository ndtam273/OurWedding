import 'package:flutter/material.dart';

class Event {
  final String id;
  final String manName;
  final String manAvatar;
  final String womanName;
  final String womanAvatar;
  final String background;
  final DateTime eventDate;

  Event({
    @required this.id,
    this.manName,
    this.manAvatar,
    this.womanName,
    this.womanAvatar,
    this.background,
    this.eventDate,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'date': eventDate,
      'woman_name': womanName,
      'woman_avt': womanAvatar,
      'man_name': manName,
      'man_avt': manAvatar,
      'background': background
    };
    if (id != null) {
      map['id'] = id;
    }
    return map;
  }
}
