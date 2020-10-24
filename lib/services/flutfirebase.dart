import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royaltrade/model/post_model.dart';
import 'package:royaltrade/model/user.dart';

class FireStoreServices {
  FirebaseFirestore _db = FirebaseFirestore.instance;
  CollectionReference posts = FirebaseFirestore.instance.collection('Posts');

  Future<void> addPost(Posts post) {
    return posts
        .add(post.toMap())
        .then((value) => print("Post Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Future<Posts> fetchPosts(String id) {
    return posts
        .doc(id)
        .get()
        .then((value) => Posts.fromFirestore(value.data()));
  }

  Future<void> addUser(Users user) {
    return _db.collection('user').doc(user.userId).set(user.toMap());
  }

  Future<Users> fetchUser(String userId) {
    return _db
        .collection('user')
        .doc(userId)
        .get()
        .then((value) => Users.fromFirestore(value.data()));
  }
}
