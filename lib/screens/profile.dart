import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:social_media_app/screens/models/post.dart';
import 'package:social_media_app/services/auth.dart';
import "package:social_media_app/utils/data.dart";
import "package:social_media_app/utils/pallete.dart";
import "package:social_media_app/widgets/feed-post.dart";

import 'package:flutter_swiper/flutter_swiper.dart';


class Profile1 extends StatefulWidget {
  final String profileId;

  const Profile1({Key key, this.profileId}) : super(key: key);

  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  final AuthService _auth = AuthService();
  final User currentUser = FirebaseAuth.instance.currentUser;
  final String currentUserId = FirebaseAuth.instance.currentUser.uid;

  int postCount = 0;
  bool isFollowing = false;
  List<AppPost> posts = [];


  List<Widget> Tabs = [

  Container(
    padding: EdgeInsets.only(left: 16, right: 16, top:0.0, bottom: 24,),
    child:  StreamBuilder(
      stream: FirebaseFirestore.instance.collection('posts').where('userID', isEqualTo: FirebaseAuth.instance.currentUser.uid).snapshots(),
      builder: (context, snapshot) {
        if(!snapshot.hasData) return const Text('Loading...');
        return ListView.builder(
          physics: BouncingScrollPhysics(),
          itemExtent: 80.0,
          itemCount: snapshot.data.docs.length,
          itemBuilder: (context, index) =>
              FeedCard(inf: snapshot.data.docs[index]),
        );
      },
      //child: ListView(

        //children: <Widget>[
          // FeedCard(
          //   imagePath: "assets/images/card_image_1.jpg",
          //   status: "open",
          //   cardTitle: "Baranci",
          //   category: "Italian",
          //   distance: "12 km",
          //   description: "Baran(21) CS okumak hiç stresli değil",
          //   isThereStatus: false,
          //   onTap: () {},
          // ),
          // SizedBox(
          //   height: 16.0,
          // ),
          // FeedCard(
          //   imagePath: "assets/images/card_image_2.jpg",
          //   status: "open",
          //   cardTitle: "Baranci",
          //   category: "Italian",
          //   distance: "12 km",
          //   description: "Grand-son of Barney Stinson",
          //   isThereStatus: false,
          //   onTap: () {},
          // ),
        //],
      //),
    ),
  ),
    Container(

      padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 24,),
      child:
      GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        physics: BouncingScrollPhysics(),
        children: List.generate(2, (int index) {
          int asset_index = index+1;
          return GestureDetector(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
                image: DecorationImage(
                  image: AssetImage("assets/images/card_image_$asset_index.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }),
      ),
    ),
  ];
  int _currentIndex = 4;
  List <String> pages = ["/home", "/search", "/newpost", "/notification", "/profile"];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pushNamed(context, pages[index]);
    });
  }

  Container buildButton(String text, Function function){

    return Container(
      padding: EdgeInsets.only(top:2.0),
      child: FlatButton(
        onPressed: function,
        child: Container(
          child: Text(text, style: TextStyle(color: Colors.white70),),


          decoration: BoxDecoration(
            color: Colors.blue,
            border: Border.all(
              color: Colors.blue,
            ),
            borderRadius: BorderRadius.circular(5.0),
          ),
      ),
      ),
    );
  }

  buildProfileButton(){
    bool isProfileOwner = currentUserId == widget.profileId;
    if(isProfileOwner){
      //return buildButton("Edit Profile", func());
    }
  }
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    FirebaseAnalytics().logEvent(name: 'Profile_Page',parameters:null);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBlue,
        actions: [
          TextButton(
          onPressed:  () async {
            dynamic result = await _auth.signOut();
            print(result);
            Navigator.pushNamed(context, "/welcome");
          },
          child: Text("Log Out", style: TextStyle(color: AppColors.kWhite),),
          )
        ],
      ),
      extendBodyBehindAppBar: false,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: size.height * 0.35,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/background1.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Column(
                    children: <Widget>[

                      SizedBox(
                        height: 36,
                      ),

                      CircleAvatar(
                        radius: 48,
                        backgroundImage: AssetImage("assets/images/avatar1.jpg"),
                      ),

                      SizedBox(
                        height: 16,
                      ),

                      Text(
                        "Name Surname",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),

                      SizedBox(
                        height: 4,
                      ),

                      Text(
                        "Bio",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                        ),
                      ),

                     /* Expanded(
                        child: Container(),
                      ),*/

                      Container(
                        height: 64,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                           /* Expanded(
                              child: Container(),
                            ),*/

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    "POSTS",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    "13",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    "FOLLOWING",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    "364",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),

                                ],
                              ),
                            ),

                            Container(
                              width: 110,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[

                                  Text(
                                    "FOLLOWERS",
                                    style: TextStyle(
                                      color: Colors.white70,
                                      fontSize: 12,
                                    ),
                                  ),

                                  SizedBox(
                                    height: 4,
                                  ),

                                  Text(
                                    "175",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),



                            /*
                            Expanded(
                              child: Container(),
                            ),*/

                          ],
                        ),
                      ),


                    ],
                  ),
                ),

                /*Material(
                  elevation: 1,
                  child: Container(
                    height: 56,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[

                        IconButton(
                          icon: Icon(
                            Icons.person_pin,
                            color: Colors.black,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),

                        IconButton(
                          icon: Icon(
                            Icons.image,
                            color: Colors.black,
                            size: 28,
                          ),
                            onPressed: () {},
                        ),


                        IconButton(
                          icon: Icon(
                            Icons.location_on,
                            color: Colors.black,
                            size: 28,
                          ),
                          onPressed: () {},
                        ),

                      ],
                    ),
                  ),
                ),*/

                Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return _buildSwiperList(Tabs[index], index);
                  },

                  itemWidth: size.width,
                  itemHeight: size.height * 0.60 - 56,
                  itemCount: Tabs.length,
                  layout: SwiperLayout.CUSTOM,
                  pagination: SwiperPagination(),
                  customLayoutOption:
                  new CustomLayoutOption(startIndex: -1, stateCount: 2)
                      .addRotate([0.0 / 180, 0.0, 0.0 / 180]).addTranslate([
                    new Offset(-400.0, 0.0),
                    new Offset(0.0, 0.0),
                    new Offset(400.0, 0.0)
                  ]),
                  // control:SwiperControl(),
                ),


                /*Container(


                ),*/


              ],
            ),

            // Positioned(
            //   top: 32,
            //   left: 16,
            //   child: GestureDetector(
            //     onTap: () {
            //
            //     },
            //     child: Icon(
            //       Icons.keyboard_arrow_left,
            //       color: Colors.white,
            //       size: 32,
            //     ),
            //   ),
            // ),

          ],
        ),
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

  Widget _buildSwiperList(Widget item, int index) {
    return Container(
      //margin: EdgeInsets.only(left: 15, right: 15),
      child: item,
    );
  }

  Function func() {}
}