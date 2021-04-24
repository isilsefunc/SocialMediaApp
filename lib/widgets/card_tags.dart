import 'package:flutter/material.dart';
import "package:social_media_app/utils/colors.dart";

class CardTags extends StatelessWidget {
  final String title;
  final BoxDecoration decoration;

  CardTags({
    @required this.title,
    this.decoration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Opacity(
        opacity: 0.8,
        child: Container(
          width: 40,
          height: 14,
          decoration: decoration,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.secondary,
                fontFamily: "Josefin Sans",
                fontWeight: FontWeight.w700,
                fontSize: 40.0,
              )
            ),
          ),
        ),
      ),
    );
  }
}