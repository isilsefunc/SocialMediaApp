import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import "package:social_media_app/utils/data.dart";
import "package:social_media_app/utils/pallete.dart";
import "package:social_media_app/widgets/feed-post.dart";


class Profile1 extends StatefulWidget {
  @override
  _Profile1State createState() => _Profile1State();
}

class _Profile1State extends State<Profile1> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[

            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[

                Container(
                  height: size.height * 0.30,
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

                      Expanded(
                        child: Container(),
                      ),

                      Container(
                        height: 64,
                        color: Colors.black.withOpacity(0.4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[

                            Expanded(
                              child: Container(),
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
                                    "555",
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
                                    "FOLLOWER",
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

                            Expanded(
                              child: Container(),
                            ),

                          ],
                        ),
                      ),

                    ],
                  ),
                ),

                Material(
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
                ),


                Column(
                  children: <Widget>[
                    FeedCard(
                      imagePath: "assets/images/card_image_1.jpg",
                      status: "open",
                      cardTitle: "Gramercy Tavern",
                      category: "Italian",
                      distance: "12 km",
                      description: "394 Broome St, New York, NY 10013, USA",
                      isThereStatus: false,
                      onTap: () {},
                    ),
                    SizedBox(
                      height: 16.0,
                    ),
                    FeedCard(
                      imagePath: "assets/images/card_image_2.jpg",
                      status: "open",
                      cardTitle: "Happy Bones",
                      category: "Italian",
                      distance: "12 km",
                      description: "394 Broome St, New York, NY 10013, USA",
                      isThereStatus: false,
                      onTap: () {},
                    ),
                  ],
                ),

                /*Container(

                  height: size.height * 0.60 - 56,
                  padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 24,),
                  child:
                  GridView.count(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    physics: BouncingScrollPhysics(),
                    children: List.generate(posts.length, (int index) {

                      return GestureDetector(
                        onTap: () {},
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                            image: DecorationImage(
                              image: AssetImage(posts[index]["img"]),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),*/


              ],
            ),

            Positioned(
              top: 32,
              left: 16,
              child: GestureDetector(
                onTap: () {

                },
                child: Icon(
                  Icons.keyboard_arrow_left,
                  color: Colors.white,
                  size: 32,
                ),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 4,
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
            icon: Icon(Icons.messenger),
            label: "Messages",
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