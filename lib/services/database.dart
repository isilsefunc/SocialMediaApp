import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media_app/screens/models/comments.dart';
import 'package:social_media_app/screens/models/post.dart';


class DatabaseService{
  final String uid;
  DatabaseService({this.uid});


  CollectionReference users = FirebaseFirestore.instance.collection('users');
  CollectionReference followers = FirebaseFirestore.instance.collection('followers');
  CollectionReference posts = FirebaseFirestore.instance.collection('posts');
  CollectionReference comments = FirebaseFirestore.instance.collection('comments');



  Future<void> addUser(String email, String pass) {
    return users
        .add({
      'email': email,
      'pass': pass,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }



  Future<void> follow(String from, String to) {
    return followers
        .add({
      'to': to,
      'from': from,
    })
        .then((value) => print("Follow Request Added"))
        .catchError((error) => print("Failed to add follow request: $error"));
  }

/*  Future<void> unfollow(String from, String to) {
    return followers
    .where('to', isEqualTo: to )
        .where('from', isEqualTo: from )
    .get()
    .then((querySnapshot) {
      querySnapshot.docs.forEach((docs).delete(docs.reference);
      );
  };
    }*/


  Future<void> addPost(AppPost newPost) {
    // Call the posts CollectionReference to add a new post
    return posts
        .add({
      'description': newPost.description,
      'geo': newPost.geo,
      'image': newPost.image,
      'likes': newPost.likes,
      'userID': newPost.userID,
      'username': newPost.username,

    })
        .then((value) => print("New Post Added"))
        .catchError((error) => print("Failed to add new post: $error"));
  }


  Future<void> acceptFollowRequest(String docID) {
      return followers.doc(docID)
        .update({'accepted': true})
        .then((value) => print("Follow Request Updated"))
        .catchError((error) => print("Failed to accept follow request: $error"));
  }


  Future<void> profileFeed(String docID) async {

       return posts
        .where('userId', isEqualTo: uid.toString())
        .get()
        .then((value) => print("Profile Posts Recieved"))
        .catchError((error) => print("Failed : $error"));
  }

  Future<void> deleteUser(String docID) {
    return users
        .doc(docID)
        .delete()
        .then((value) => print("User Deleted"))
        .catchError((error) => print("Failed to delete user: $error"));
  }

  Future<void> deletePost(String docID) {
    return users
        .doc(docID)
        .delete()
        .then((value) => print("Post Deleted"))
        .catchError((error) => print("Failed to delete post: $error"));
  }



  Future<void> setProfilePicture(String docID, String image) {

        return users.doc(docID)
        .update({'image': image})
        .then((value) => print("Profile Picture Updated"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> changeBio(String docID, String bio) {
        return users.doc(docID)
        .update({'bio': bio})
        .then((value) => print("Bio Updated"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> changePassword(String docID, String newPass) {
        return users.doc(docID)
        .update({'password': newPass})
        .then((value) => print("Password Updated"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> makePrivateProfile(String docID) {
        return users.doc(docID)
        .update({'public': false})
        .then((value) => print("Private Account"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> makePublicProfile(String docID) {
        return users.doc(docID)
        .update({'public': true})
        .then((value) => print("Public Account"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> deactivateAccount(String docID) {
        return users.doc(docID)
        .update({'deactivated': true})
        .then((value) => print("Deactivated"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> activateAccount(String docID) {
    return users.doc(docID)
        .update({'deactivated': false})
        .then((value) => print("Activated"))
        .catchError((error) => print("Failed: $error"));
  }

  Future<void> postComment(AppComments newComment) {
    return comments
        .add({
      'message': newComment.message,
      'postID': newComment.postID,
      'time': newComment.date,
      'user': newComment.username,

    })
        .then((value) => print("New Comment Added"))
        .catchError((error) => print("Failed to add new comment: $error"));
  }

  Future<void> likePost(String docID) {

  }

  Future<void> dislikePost(String docID) {

  }

  Future<void> reSharePost(String docID) {

  }

  Future<void> reportUser(String docID) {

  }

  Future<void> reportPost(String docID) {

  }

  Future<void> returnFollowers(String docID) {

  }

  Future<void> returnFollowings(String docID) {

  }





}

//

