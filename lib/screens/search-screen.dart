import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';
import 'package:social_media_app/widgets/tag_card.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:social_media_app/widgets/feed-post.dart";
import "package:social_media_app/widgets/profile_card.dart";
import "package:social_media_app/widgets/location_card.dart";


class SearchScreen extends StatefulWidget {
  //final SearchValue searchValue;

  //SearchResultsScreen(this.searchValue);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  List<bool> isSelected = List.generate(4, (_) => false);

  int _currentIndex = 1;
  List <String> pages = ["/home", "/search", "/newpost", "/notification", "/profile"];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pushNamed(context, pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
   /* void navigateToDetailScreen() {
      AppRouter.navigator.pushNamed(AppRouter.restaurantDetailsScreen);
    }*/

   // var controller = TextEditingController(text: searchValue.value);
    FirebaseAnalytics().logEvent(name: 'Search',parameters:null);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: new EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 16.0,
          ),
          child: Column(
            children: [
              Center(
                child:
                  Column(
                    children: [
                      SizedBox(height: 40,),
                      TextInputField(
                        isSearch: true,
                        icon: FontAwesomeIcons.search,
                        hint: 'Search',
                        inputAction: TextInputAction.next,
                      ),
                      Center(
                        child: ToggleButtons(
                          borderColor: AppColors.kBlue,
                          fillColor: AppColors.kBlue,
                          borderWidth: 2.5,
                          selectedBorderColor: Colors.black,
                          selectedColor: AppColors.kWhite,
                          splashColor: AppColors.kBlue,
                          highlightColor: const Color(0xFF580CBA),
                          borderRadius: BorderRadius.circular(0),
                          constraints: BoxConstraints.expand(width: 82, height: 20),
                          children: <Widget>[
                            Text("Profile"),
                            Text("Posts"),
                            Text("Tags"),
                            Text("Locations"),
                          ],
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0; buttonIndex < isSelected.length; buttonIndex++) {
                                if (buttonIndex == index) {
                                  isSelected[buttonIndex] = !isSelected[buttonIndex];
                                } else {
                                  isSelected[buttonIndex] = false;
                                }
                              }
                            });
                          },
                          isSelected: isSelected,
                        ),
                      ),
                    ],
                  ),
              ),
              SizedBox(height: 10),
              if(isSelected[0]) Column(
                children: [
                  ProfileCard(
                    username: "dabbegok",
                    imagePath: "assets/images/card_image_1.jpg",
                  ),
                  ProfileCard(
                    username: "Aataberk",
                    imagePath: "assets/images/card_image_10.jpg",
                  ),
                  ProfileCard(
                    username: "Isıl_Sefunc",
                    imagePath: "assets/images/card_image_5.jpg",
                  ),
                  ProfileCard(
                    username: "Jozkeh",
                    imagePath: "assets/images/card_image_3.jpg",
                  ),
                  ProfileCard(
                    username: "Batuhan",
                    imagePath: "assets/images/card_image_7.jpg",
                  ),
                ],
              ),
              if(isSelected[1]) Column(
                children: [
                  FeedCard(
                  imagePath: "assets/images/card_image_1.jpg",
                  status: "open",
                  cardTitle: "cimenbaran",
                  category: "Italian",
                  distance: "12 km",
                  description: "Baran(21): CS okumak hiç stresli değil",
                  isThereStatus: false,
                  onTap: () {},
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
                ],
              ),
              if(isSelected[2]) Column(
                children: [
                  TagCard(
                    tag: "naber_lan_tirrek",
                  ),
                ],
              ),
              if(isSelected[3]) Column(
                children: [
                  LocationCard(
                    location: "Sabancı University",
                  ),
                ],
              ),
            ],
          ),
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
}
