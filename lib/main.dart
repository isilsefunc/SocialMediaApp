import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:social_media_app/screens/wrapper.dart';



/*bool _seen = false;
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
}*/


void main()  {

  WidgetsFlutterBinding.ensureInitialized();
  //checkFirstSeen();
  //runApp(Wrapper(seen: _seen));
  runApp(Wrapper());
}



