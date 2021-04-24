import 'package:flutter/material.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:social_media_app/widgets/feed-post.dart";

class SearchScreen extends StatefulWidget {
  //final SearchValue searchValue;

  //SearchResultsScreen(this.searchValue);
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>{
  List<bool> isSelected = List.generate(4, (_) => false);
  @override
  Widget build(BuildContext context) {
   /* void navigateToDetailScreen() {
      AppRouter.navigator.pushNamed(AppRouter.restaurantDetailsScreen);
    }*/

   // var controller = TextEditingController(text: searchValue.value);

    return Scaffold(
      body: SafeArea(
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
              if(isSelected[0]) Stack(
                children: [

                ],
              ),
              if(isSelected[1]) Stack(
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
                ],
              ),
              if(isSelected[2]) Stack(
                children: [

                ],
              ),
              if(isSelected[3]) Stack(
                children: [

                ],
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 1,
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
