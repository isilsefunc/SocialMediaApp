
import 'dart:io';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:social_media_app/screens/authenticate/create-new-account.dart';
import 'package:social_media_app/services/auth.dart';
import 'package:social_media_app/utils/pallete.dart';
import 'package:social_media_app/utils/styles.dart';
import 'package:social_media_app/widgets/widgets.dart';
import 'package:social_media_app/screens/authenticate/components/guugleSignIn.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'package:http/http.dart';

class Newpost extends StatefulWidget {
  @override
  _NewpostState createState() => _NewpostState();
}

class _NewpostState extends State<Newpost> {
  Map<String, dynamic> _user = {};
  File _image;
  String _description;
  final _picker = ImagePicker();
  void _onsaveProfile(){
    print:('User: $_user');
  }

  Future _getImage() async{
    final image = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(image.path);
      print('_image: $image');
    });
  }

  int _currentIndex = 2;
  List <String> pages = ["/home", "/search", "/newpost", "/notification", "/profile"];
  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      Navigator.pushNamed(context, pages[index]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kBlue,
        title: Text('New Post'),
        actions: <Widget>[
          GestureDetector(
            onTap: (){
              // Firestore pushlama eksik
              Navigator.pushNamed(context, pages[0]);
              },
            child: Container(
              padding: EdgeInsets.only(top:17, right:25),
              child: Text(
                'Post',
                style: TextStyle(fontSize: 18),
              ),
            ),
          )
        ],
      ),
      body: ListView(
        shrinkWrap: true,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(28),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(FontAwesomeIcons.cameraRetro,),
                    SizedBox(width: 5,),
                    Text('Picture', style: TextStyle(fontSize: 20),),
                  ],
                ),
                Divider(),
                GridView.count(
                  shrinkWrap: true,
                  primary: false,
                  padding: const EdgeInsets.all(20),
                  crossAxisSpacing: 10,
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  children: <Widget>[
                    GestureDetector(
                      onTap: _getImage,
                      child: Container(
                        color: Colors.black12,
                        child: _image == null ? Icon(FontAwesomeIcons.plus) : Image.file(_image),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(28),
            child: Column(
                children: <Widget>[
                  TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 20),
                      isDense: true,
                      hintText: 'Description here',
                      prefixIcon: Padding(
                        padding: EdgeInsets.only(top:15),
                        child: Icon(FontAwesomeIcons.envelopeOpenText),
                      ),
                    ),
                    onSaved: (String Value) {_description = Value;},
                  ),
                ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped, // new
        currentIndex: _currentIndex, // new
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