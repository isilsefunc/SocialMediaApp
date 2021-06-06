import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/screens/models/user.dart';
import 'package:social_media_app/screens/models/notifications.dart';
import 'package:social_media_app/screens/models/post.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUserData(String name, ) async {
    return await userCollection.doc(uid).set({
      'name': name,

    });
  }

/*  List<AppUser> _userListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.docs.map((doc){
      return AppUser(
          image: doc.data['image'],
          name: doc.data["name"],
          surname: doc.data["surname"],
          username: doc.data["username"],
          bio: doc.data["bio"],
          email: doc.data["email"],
          public: doc.data["public"],
          password: doc.data["password"],
          following: doc.data["following"],
          followers: doc.data["followers"]
      );
    }).toList();

  }*/
}

