import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:social_media_app/utils/pallete.dart";
import "package:social_media_app/widgets/feed-post.dart";

class HomeFeed extends StatefulWidget {
  @override
  _HomeFeedState createState() => _HomeFeedState();
}

class _HomeFeedState extends State<HomeFeed> {
  List<Widget> Feeds = [
    FeedCard(
      imagePath: "assets/images/card_image_1.jpg",
      status: "open",
      cardTitle: "Baranci",
      category: "Italian",
      distance: "12 km",
      description: "Baran(21) CS okumak hiç stresli değil",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_2.jpg",
      status: "open",
      cardTitle: "Baranci",
      category: "Italian",
      distance: "12 km",
      description: "Grand-son of Barney Stinson",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_3.jpg",
      status: "open",
      cardTitle: "Jozkeh",
      category: "Italian",
      distance: "12 km",
      description: "Varsa Şekliniz Bumble'a Bekleriz",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_4.jpg",
      status: "open",
      cardTitle: "Jozkeh",
      category: "Italian",
      distance: "12 km",
      description: "Bugün de Bitcoin'den battık",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_5.jpg",
      status: "open",
      cardTitle: "Isilsefunc",
      category: "Italian",
      distance: "12 km",
      description: "Life is meaningless if you have black hair",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_6.jpg",
      status: "open",
      cardTitle: "Isilsefunc",
      category: "Italian",
      distance: "12 km",
      description: "#tbt :(",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_7.jpg",
      status: "open",
      cardTitle: "Batuhandemir98",
      category: "Italian",
      distance: "12 km",
      description: "Gitarım şekil yolumdan çekil!",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_8.jpg",
      status: "open",
      cardTitle: "Batuhandemir98",
      category: "Italian",
      distance: "12 km",
      description: "Kralla çay keyfi",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_9.jpg",
      status: "open",
      cardTitle: "Ataberkylmaz",
      category: "Italian",
      distance: "12 km",
      description: "Corona drinking in Corona times",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_10.jpg",
      status: "open",
      cardTitle: "Ataberkylmaz",
      category: "Italian",
      distance: "12 km",
      description: "10 Like'a arkadaki kızları içmeye davet ederim",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_11.jpg",
      status: "open",
      cardTitle: "Goktug_calskan",
      category: "Italian",
      distance: "12 km",
      description: "Ben bir ceviz ağacıyım gülhane parkında..",
      isThereStatus: false,
      onTap: () {},
    ),
    SizedBox(
      height: 16.0,
    ),
    FeedCard(
      imagePath: "assets/images/card_image_12.jpg",
      status: "open",
      cardTitle: "Goktug_calskan",
      category: "Italian",
      distance: "12 km",
      description: "Ne sen bunun farkındasın ne de sincap.",
      isThereStatus: false,
      onTap: () {},
    ),
  ];
  int _currentIndex = 0;
  List <String> pages = ["/home", "/search", "/newpost", "/notification", "/profile"];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pushNamed(context, pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    FirebaseAnalytics().logEvent(name: 'Home',parameters:null);
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child:  Column(
          children: [
            Container(
              height: size.height,
              padding: EdgeInsets.only(left: 16, right: 16, top:0.0, bottom: 24,),
              child:  ListView(
                physics: BouncingScrollPhysics(),
                children: Feeds,
              )
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
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