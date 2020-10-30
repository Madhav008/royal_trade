import 'package:cloud_firestore/cloud_firestore.dart';

class Posts {
  String title;
  String description;
  String img;
  Timestamp date;
  Posts({this.title, this.description, this.img,this.date});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'date': date,
      'image': img
    };
  }

  Posts.fromFirestore(Map<String, dynamic> firestore)
      : title = firestore['title'],
        description = firestore['description'],
        date = firestore['date'],
        img = firestore['image'];
}
