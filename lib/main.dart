//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:social_media_app/screens/walkthrough.dart';
import 'package:social_media_app/screens/login-screen.dart';
import 'package:social_media_app/screens/create-new-account.dart';
import 'package:social_media_app/screens/welcome.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/walkthrough',
    routes: {
      '/': (context) => Welcome(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => CreateNewAccount(),
      '/walkthrough': (context) => WalkThrough(),
    },
  ));
}
