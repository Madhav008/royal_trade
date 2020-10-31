import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/subscription.dart';

class AdminScreen extends StatelessWidget {
  CollectionReference plans =
      FirebaseFirestore.instance.collection('Subscription');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Plans"),
      ),
      body: StreamBuilder(
        stream: plans.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var post =
                    Subscription.fromFirestore(snapshot.data.docs[index].data());

                return ListTile(
                  title: Text(post.planId),
                  subtitle: Text(post.price.toString()),
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
