import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/post_model.dart';

class PostScreen extends StatefulWidget {
  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  CollectionReference post = FirebaseFirestore.instance.collection('Posts');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Posts"),
      ),
      body: StreamBuilder(
        stream: post.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var post =
                    Posts.fromFirestore(snapshot.data.docs[index].data());

                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          } else {
            return Center(child: Text("loading"));
          }
        },
      ),
    );
  }
}
/* 
ListView(
              children: snapshot.data.docs.map((DocumentSnapshot document) {
               var post =  Posts.fromFirestore(document.data());
                return  ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.description),
                );
              }).toList(),
            ); */
