import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';






Future<void> addUser(String email, String pass) {
  CollectionReference users = FirebaseFirestore.instance.collection('users');
      // Call the user's CollectionReference to add a new user
  return users
      .add({
    'email': email, // John Doe
    'pass': pass, // Stokes and Sons
    'bio': '',
    'deactivated': false,
    'followers': 0,
    'following': 0,
    'image': null,
    'public': true,

      })
      .then((value) => print("User Added"))
      .catchError((error) => print("Failed to add user: $error"));
}



Future<void> Follow(String from, String to) {
  // Call the followers's CollectionReference to add a new follow request
  CollectionReference users = FirebaseFirestore.instance.collection('followers');
  return users
      .add({
    'to': to,
    'from': from,

  })
      .then((value) => print("Follow Request Added"))
      .catchError((error) => print("Failed to add follow request: $error"));
}




class GetUserDetails extends StatelessWidget {
  final String documentId;

  GetUserDetails(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          return Text("Full Name: ${data['full_name']} ${data['last_name']}");
        }

        return Text("loading");
      },
    );
  }
}






