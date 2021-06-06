import 'package:flutter/material.dart';

class AppNotifications {

  final image;
  final username;
  final text;
  final type;
  final date;
  final response;

  AppNotifications({
    @required this.text,
    @required this.image,
    @required this.username,
    @required this.type,
    @required this.date,
    @required this.response,
  });
}