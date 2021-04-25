import 'package:flutter/material.dart';

class NotifCard extends StatelessWidget {
  final String name;
  final String image;
  final String time;
  final String notif;



  NotifCard({
    this.name,
    this.image,
    this.time,
    this.notif,

  });

  @override
  Widget build(BuildContext context) {

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(
                  image,
                ),
                radius: 25,
              ),
              contentPadding: EdgeInsets.all(0),
              title: Text(notif),
              trailing: Text(
                time,
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 11,
                ),
              ),
              onTap: () {},
            ),
          );

  }
}