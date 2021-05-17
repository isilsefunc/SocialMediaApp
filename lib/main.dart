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

import 'package:firebase_core/firebase_core.dart';

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

  WidgetsFlutterBinding.ensureInitialized();
  checkFirstSeen();

  runApp(App());
}


class App extends StatelessWidget {
  /// The future is part of the state of our widget. We should not call `initializeApp`
  /// directly inside [build].
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override


  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          print(snapshot.error);
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: SearchScreen(),
          );;
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            home: _seen == false ? WalkThrough() : Welcome(),
            routes: {
              '/welcome': (context) => Welcome(),
              '/login': (context) => LoginScreen(),
              '/signup': (context) => CreateNewAccount(),
              '/walkthrough': (context) => WalkThrough(),
              '/profile' : (context) => Profile1(),
              '/search' : (context) => SearchScreen(),
              '/home' : (context) => HomeFeed(),
              '/notification' : (context) => Notifications(),

            },

          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          title: 'Flutter Demasdfafasdo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Profile1(),
        );
      },
    );
  }
}
