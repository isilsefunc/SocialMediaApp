import 'package:flutter/material.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';

class ProfileCard extends StatelessWidget{
  final String imagePath;
  final String username;
  final double width;
  final double cardHeight;
  final double imageHeight;
  final double cardElevation;
  final GestureTapCallback onTap;

  ProfileCard({
    this.imagePath,
    this.username,
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
              CircleAvatar(
                backgroundImage: AssetImage(imagePath),
                radius: 22,
              ),
              SizedBox(width: 15),
              Text(username, style: TextStyle(fontSize: 18),),
            ],
          ),
        ),
      ),
    );
  }
}