import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/data.dart';
import "package:social_media_app/widgets/notification_card.dart";


class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  int _currentIndex = 3;
  List <String> pages = ["/home", "/search", "/newpost", "/notification", "/profile"];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pushNamed(context, pages[index]);
    });
  }
  @override
  Widget build(BuildContext context) {
    FirebaseAnalytics().logEvent(name: 'Notifications',parameters:null);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Notifications",
        ),
        centerTitle: true,
        backgroundColor: AppColors.kBlue,
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.filter_list_alt,
            ),

            onPressed: () {},
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(10),
        separatorBuilder: (BuildContext context, int index) {
          return Align(
            alignment: Alignment.centerRight,
            child: Container(
              height: 0.5,
              width: MediaQuery.of(context).size.width / 1.3,
              child: Divider(),
            ),
          );
        },
        itemCount: notifications.length,
        itemBuilder: (BuildContext context, int index) {
          Map notif = notifications[index];
          return NotifCard(
            image:notif["dp"],
            notif: notif["notif"],
            time: notif["time"],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_filled),
            label: "Home",
            backgroundColor: AppColors.kBlue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.tag),
            label: "Search",
            backgroundColor: AppColors.kBlue,
          ),

          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.plus),
            label: "New Post",
            backgroundColor: AppColors.kBlue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: "Notifications",
            backgroundColor: AppColors.kBlue,
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Profile",
            backgroundColor: AppColors.kBlue,
          ),
        ],
      ),


      );

  }
}