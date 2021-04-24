//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:social_media_app/screens/walkthrough.dart';
import 'package:social_media_app/screens/login-screen.dart';
import 'package:social_media_app/screens/create-new-account.dart';
import 'package:social_media_app/screens/welcome.dart';
import 'package:social_media_app/screens/profile.dart';
import 'package:social_media_app/screens/notifications.dart';
import 'package:social_media_app/screens/search-screen.dart';
import 'package:social_media_app/screens/home.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/home',
    routes: {
      '/': (context) => Welcome(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => CreateNewAccount(),
      '/walkthrough': (context) => WalkThrough(),
      '/profile' : (context) => Profile1(),
      '/search' : (context) => SearchScreen(),
      '/home' : (context) => HomeFeed(),

    },
  ));
}
