import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:social_media_app/screens/authenticate/authenticate.dart';
import 'package:social_media_app/screens/error/no_firebase.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'authenticate/create-new-account.dart';
import 'authenticate/login-screen.dart';
import 'home.dart';
import 'notifications.dart';
import 'profile.dart';
import 'search-screen.dart';
import 'walkthrough.dart';
import 'authenticate/welcome.dart';







class Wrapper extends StatelessWidget {


  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  FirebaseAnalytics analytics = FirebaseAnalytics();

 /* final bool seen;
  Wrapper({Key key, this.seen}) : super(key: key);*/

  @override
  Widget build(BuildContext context) {


    // return either the Home or Authenticate widget
    return FutureBuilder(

      future: _initialization,
      builder: (context, snapshot){
        if(snapshot.hasError) {
          print('Cannot connect to firebase: '+snapshot.error);
          return MaterialApp(
            home: NoFirebaseView(),
          );
        }

        if(snapshot.connectionState == ConnectionState.done) {
          print('Firebase connected');


          return StreamProvider<User>.value(
            value: AuthService().user,
            child: MaterialApp(
              //home: seen == false ? WalkThrough() : Authenticate(),
              home: Authenticate(),
              routes: {
                '/welcome': (context) => Welcome(),
                '/login': (context) => LoginScreen(),
                '/signup': (context) => RegisterScreen(),
                '/walkthrough': (context) => WalkThrough(),
                '/profile' : (context) => Profile1(),
                '/search' : (context) => SearchScreen(),
                '/home' : (context) => HomeFeed(),
                '/notification' : (context) => Notifications(),
              },
            ),
          );




          }

          return MaterialApp(
            home: WaitingFirebase(),
          );
      },
    );
  }
}