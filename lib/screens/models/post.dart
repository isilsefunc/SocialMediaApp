import 'package:flutter/material.dart';

class AppPost {
  final image;
  final postID;
  final username;
  final description;
  final geo;
  final likes;
  final comments;

  AppPost({
    @required this.image,
    @required this.username,
    @required this.description,
    @required this.geo,
    @required this.likes,
    @required this.comments,
    @required this.postID,
  });
}