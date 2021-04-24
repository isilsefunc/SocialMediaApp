import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';

class LocationCard extends StatelessWidget{
  final String imagePath;
  final String location;
  final double width;
  final double cardHeight;
  final double imageHeight;
  final double cardElevation;
  final GestureTapCallback onTap;

  LocationCard({
    this.imagePath = "assets/images/location.png",
    this.location,
    this.width = 380,
    this.cardHeight = 60,
    this.imageHeight = 50,
    this.cardElevation = 4,
    this.onTap,
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
          child: Row(
            children: [
              SizedBox(width: 10),
              Image(image: AssetImage(imagePath), height: 25,),
              SizedBox(width: 5),
              Text(location, style: TextStyle(fontSize: 18, fontStyle: FontStyle.italic),),
            ],
          ),
        ),
      ),
    );
  }
}