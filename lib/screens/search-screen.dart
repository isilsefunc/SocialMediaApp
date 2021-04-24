import 'package:flutter/material.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SearchScreen extends StatelessWidget {
  //final SearchValue searchValue;

  //SearchResultsScreen(this.searchValue);

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
                  TextInputField(
                    isSearch: true,
                    icon: FontAwesomeIcons.search,
                    hint: 'Search',
                    inputAction: TextInputAction.next,
                  ),
              ),

              /*FoodyBiteSearchInputField(
                ImagePath.searchIcon,
                controller: controller,
                textFormFieldStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                hintText: StringConst.HINT_TEXT_TRENDING_SEARCH_BAR,
                hintTextStyle:
                    Styles.customNormalTextStyle(color: AppColors.accentText),
                suffixIconImagePath: ImagePath.closeIcon,
                onTapOfSuffixIcon: () => Navigator.pop(context),
                borderWidth: 0.0,
                borderStyle: BorderStyle.solid,
              ), */
              /*Expanded(
                child: ListView.separated(
                  scrollDirection: Axis.vertical,
                  itemCount: 4,
                  separatorBuilder: (context, index) {
                    return SpaceH8();
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      child: FoodyBiteCard(
                        onTap: () => AppRouter.navigator.pushNamed(
                          AppRouter.restaurantDetailsScreen,
                          arguments: RestaurantDetails(
                            imagePath: imagePaths[index],
                            restaurantName: restaurantNames[index],
                            restaurantAddress: addresses[index],
                            rating: ratings[index],
                            category: category[index],
                            distance: distance[index],
                          ),
                        ),
                        imagePath: imagePaths[index],
                        status: status[index],
                        cardTitle: restaurantNames[index],
                        rating: ratings[index],
                        category: category[index],
                        distance: distance[index],
                        address: addresses[index],
                      ),
                    );
                  },
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
