import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: WalkThrough(),
  ));
}

class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State {

  int  current = 0;
  int total = 4;
  List <String> appBarTitles = ["WELCOME","INTRO","PROFILES","CONTENT"];
  List <String> pageTitles = ["Our CS310 Project app","Signup easily","Create your profile","Start meeting new people"];
  List <String> imageURLs = ["https://dynamic.brandcrowd.com/asset/logo/0be64055-fc14-4068-a9b4-ef819ac154c7/logo?v=4",
    "https://www.tutorialrepublic.com/snippets/designs/simple-sign-up-form-with-blue-background.png",
    "https://media-exp1.licdn.com/dms/image/C4E03AQExq1Fy6mOxuw/profile-displayphoto-shrink_400_400/0/1599490689890?e=1623283200&v=beta&t=7tMELENB9UKZqaMrEiEwsUeygkAikYFrIAFnGaNsguA",
    "https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/friends-couch-tour-25th-anniversary-central-perk-1567629083.jpg"];
  List <String> imageCaptions = ["Your personal social media",
    "Just use your SU-Net account",
    "Stay in touch with your friends in these though times",
    "Connect with fellow sabanci students"];

  void nextPage() {
    if(current<3){current +=1;}
    setState(() {
      build(context);
    });
  }

  void prevPage() {
    if(current>0){current -=1;}
    setState(() {
      build(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2F2F7),
      appBar: AppBar(
        backgroundColor: Color(0xFFD1D1D6),
        centerTitle: true,
        title: Text(
          appBarTitles[current],
          style:TextStyle(
            letterSpacing: -1,
            color: Color(0xFF757575),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            Text(
              pageTitles[current],
              style: TextStyle(
                fontSize: 32.0,
                fontWeight: FontWeight.w800,
                letterSpacing: -1,
                color: Color(0xFF229A98),
              ),
            ),
            CircleAvatar(
              radius: 170.0,//280*280 was overflowing so i made it 140*140
              backgroundImage: NetworkImage(imageURLs[current]),
              backgroundColor: Color(0xFF229A98),
            ),
            Text(
              imageCaptions[current],
              style: TextStyle(
                color: Color(0xFF757575),
                fontSize: 24.0,
                fontWeight: FontWeight.w300,
                letterSpacing: -1,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextButton(onPressed: prevPage,
                  child: Text(
                    "Prev",
                    style: TextStyle(
                      color: Color(0xFF229A98),
                    ),
                  ),
                ),
                Text("${current+1}/$total"),
                TextButton(onPressed: nextPage,
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Color(0xFF229A98),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}