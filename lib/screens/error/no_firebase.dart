import 'package:flutter/material.dart';

class NoFirebaseView extends StatelessWidget {
  const NoFirebaseView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text('Server connection failed'),
      ),
    );
  }
}


class WaitingFirebase extends StatelessWidget {
  const WaitingFirebase({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: Container(child: Text('Loading...'),));
  }
}
