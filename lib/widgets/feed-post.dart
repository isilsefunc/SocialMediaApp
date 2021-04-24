import 'package:flutter/material.dart';
import "package:social_media_app/utils/colors.dart";
import "package:social_media_app/widgets/card_tags.dart";

class FeedCard extends StatelessWidget {
  final String status;
  final String rating;
  final String imagePath;
  final String cardTitle;
  final String category;
  final String distance;
  final String description;
  final GestureTapCallback onTap;
  final bool bookmark;
  final bool isThereStatus;
  final double tagRadius;
  final double width;
  final double cardHeight;
  final double imageHeight;
  final double cardElevation;
  final double ratingsAndStatusCardElevation;
  final List<String> followersImagePath;

  FeedCard({
    this.status = "OPEN",
    this.rating = "4335",
    this.imagePath,
    this.cardTitle,
    this.category,
    this.distance,
    this.description,
    this.width = 380.0,
    this.cardHeight = 320.0,
    this.imageHeight = 220.0,
    this.tagRadius = 8.0,
    this.onTap,
    this.isThereStatus = true,
    this.bookmark = false,
    this.cardElevation = 4.0,
    this.ratingsAndStatusCardElevation = 8.0,
    this.followersImagePath,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        height: cardHeight,
        child: Card(
          elevation: cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Stack(
            children: <Widget>[
              Positioned(
                child: Column(
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Image.asset(
                        imagePath,
                        width: MediaQuery
                            .of(context)
                            .size
                            .width,
                        height: imageHeight,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 16.0,
                        vertical: 16.0,
                      ),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                cardTitle,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: AppColors.headingText,
                                  fontFamily: "Josefin Sans",
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20.0,
                                  letterSpacing: 0,
                                ),
                              ),
                              SizedBox(width: 4.0),
                              CardTags(
                                title: category,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment(0.9661, 0.5),
                                    end: Alignment(0, 0.5),
                                    stops: [
                                      0,
                                      1,
                                    ],
                                    colors: [
                                      Color.fromARGB(255, 255, 86, 115),
                                      Color.fromARGB(255, 255, 140, 72),
                                    ],
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Color.fromARGB(13, 0, 0, 0),
                                      offset: Offset(0, 3.33333),
                                      blurRadius: 33,
                                    ),
                                  ],
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(tagRadius),
                                  ),
                                ),
                              ),
                              SizedBox(width: 5.0),
                              CardTags(
                                title: distance,
                                decoration: BoxDecoration(
                                  color: Color.fromARGB(255, 132, 141, 255),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(tagRadius)),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              bookmark
                                  ? Container()
                                  : Container(
                                width: 40,
                                height: 20,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    Positioned(
                                      left: 21,
                                      child: Image.asset(
                                        "assets/images/pp_small_1.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                    Positioned(
                                      left: 12,
                                      child: Image.asset(
                                        "assets/images/pp_small_2.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                    Positioned(
                                      left: 0,
                                      child: Image.asset(
                                        "assets/images/pp_small_1.png",
                                        fit: BoxFit.none,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 12.0),
                          Row(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.topLeft,
                                child: Container(

                                  child: Flexible(child :Text(
                                    description,
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                      color: AppColors.accentText,
                                      fontFamily: "Josefin Sans",
                                      fontWeight: FontWeight.w400,
                                      fontSize: 14.0,
                                      letterSpacing: 0,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  ),
                                ),
                              ),
                              Spacer(
                                flex: 1,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  Image.asset(
                                    "assets/images/star_icon.png",
                                    height: 14.0,
                                    width: 14.0,
                                  ),
                                  SizedBox(width: 4.0),
                                  Text(
                                    rating,
                                    style: TextStyle(
                                      color: AppColors.headingText,
                                      fontFamily: "Josefin Sans",
                                      fontWeight: FontWeight.w600,
                                      fontSize: 14.0,
                                      letterSpacing: 0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 16.0,
                right: 16.0,
                top: 8.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    isThereStatus
                        ? Card(
                      elevation: ratingsAndStatusCardElevation,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0,
                            vertical: 8.0),
                        child: Text(
                          status,
                          style: status.toLowerCase() ==
                              "open"
                              ? TextStyle(
                            color: AppColors.KonnektGreen,
                            fontFamily: "Josefin Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: 10.0,
                            letterSpacing: 0,
                          )
                              : TextStyle(
                            color: Colors.red,
                            fontFamily: "Josefin Sans",
                            fontWeight: FontWeight.w700,
                            fontSize: 10.0,
                            letterSpacing: 0,
                          ),
                        ),
                      ),
                    )
                        : Container(),

                  ],
                ),
              ),
              bookmark
                  ? Positioned(
                top: (cardHeight / 2) + 16,
                left: width - 60,
                child: Container(
                  height: 60,
                  width: 60,
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Image.asset("assets/images/bookmarks_icon_on.png"),
                  ),
                ),
              )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }
}