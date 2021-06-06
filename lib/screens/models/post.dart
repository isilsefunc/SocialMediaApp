import 'package:flutter/material.dart';

class AppPost {
  final image;
  final username;
  final userID;
  final description;
  final geo;
  final likes;


  AppPost({
    @required this.image,
    @required this.username,
    @required this.userID,
    @required this.description,
    @required this.geo,
    @required this.likes,

  });
}