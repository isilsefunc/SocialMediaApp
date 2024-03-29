import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/widgets/widgets.dart';


class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics().logEvent(name: 'Welcome_Page',parameters:null);
    return Stack(
      children: [
      BackgroundImage(
      image: 'assets/images/welcome_page_bg.jpg',
    ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Flexible(
                child: Center(
                  child: Text(
                    'Konnekt',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 60,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: 90,
                  ),
                  RoundedButton(
                    buttonName: 'Login',
                    directory: '/login',

                  ),
                  SizedBox(
                    height: 15,
                  ),
                  RoundedButton(
                    buttonName: 'Register',
                    directory: '/signup',
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        )
    ]
    );
  }
}
