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
import 'package:shared_preferences/shared_preferences.dart';

// String inRoute = 'login';
bool _seen = false;
void checkFirstSeen() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  _seen = (prefs.getBool('seen') ?? false);

  if (_seen) {
    await prefs.setBool('seen', false);
    // inRoute = '/';
  }
  else {
    //await prefs.setBool('seen', false);
    // inRoute = '/walkthrough';
  }
}


void main(){
  // WidgetsFlutterBinding.ensureInitialized();
  // SharedPreferences prefs = await SharedPreferences.getInstance();
  // await prefs.setBool('seen', false);
  // inRoute = await prefs.getBool('seen');


  checkFirstSeen();
  runApp(MaterialApp(
    initialRoute: _seen == false ? '/walkthrough' : '/',
    routes: {
      '/': (context) => Welcome(),
      '/login': (context) => LoginScreen(),
      '/signup': (context) => CreateNewAccount(),
      '/walkthrough': (context) => WalkThrough(),
      '/profile' : (context) => Profile1(),
      '/search' : (context) => SearchScreen(),
      '/home' : (context) => HomeFeed(),
      '/notification' : (context) => Notifications(),

    },
  ));
}
