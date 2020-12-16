import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/status_transId.dart';
import 'package:royaltrade/model/subscription.dart';

class AdminScreen extends StatelessWidget {
  CollectionReference plans =
      FirebaseFirestore.instance.collection('TransactionStaus');

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
                    TransStatus.fromFirestore(snapshot.data.docs[index].data());
                print(post.toMap());
                return ListTile(
                  title: Text(post.payername),
                  subtitle: Text(post.price.toString()),
                  trailing: Container(
                    width: 90,
                    child: Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.approval,
                            color: Colors.green,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  ),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          }
          return Center(child: Text("loading"));
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
