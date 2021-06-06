import 'package:flutter/material.dart';

class AppUser {
  final name;
  final surname;
  final username;
  final bio;
  final email;
  final public;
  final password;
  final following;
  final followers;
  final image;

  AppUser({
    @required this.image,
    @required this.name,
    @required this.surname,
    @required this.username,
    @required this.bio,
    @required this.email,
    @required this.public,
    @required this.password,
    @required this.following,
    @required this.followers,
  });
}