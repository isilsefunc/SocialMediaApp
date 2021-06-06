import '../home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'welcome.dart';



class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);
    print('User: $user');

    if(user == null) {
      return Welcome();
    }
    else {
      return HomeFeed();
    }
  }
}