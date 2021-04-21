import 'package:flutter/material.dart';
import "package:social_media_app/utils/data.dart";

class ProfileMedia extends StatefulWidget {
  @override
  _ProfileMediaState createState() => _ProfileMediaState();
}

class _ProfileMediaState extends State<ProfileMedia> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(

      height: size.height * 0.60 - 56,
      padding: EdgeInsets.only(left: 16, right: 16, top: 0, bottom: 24,),
      child:
      GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
        physics: BouncingScrollPhysics(),
        children: List.generate(notifications.length, (index) {
          Map post = notifications[index];
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              image: DecorationImage(
                image: AssetImage(posts[index]["img"]),
                fit: BoxFit.cover,
              ),
            ),
          );
        }),
      ),
    );
  }
}
