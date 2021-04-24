import 'package:flutter/material.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';


class RoundedButton extends StatelessWidget {
  const RoundedButton({
    Key key,
    @required this.buttonName,
    String this.directory,
  }) : super(key: key);

  final String directory;
  final String buttonName;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.08,
      width: size.width * 0.8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppColors.kBlue,
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushNamed(context, directory);
        },
        child: Text(
          buttonName,
          style: AppStyles.kBodyText.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
