import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/post_model.dart';
import 'package:royaltrade/screen/free_signal.dart';
import 'package:royaltrade/screen/plans_screen.dart';
import 'package:royaltrade/widget/Card.dart';

class HomeWidget extends StatelessWidget {
  CollectionReference post = FirebaseFirestore.instance.collection('Posts');

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
          child: Stack(children: [
        Column(children: [
      SizedBox(
        height: 20,
      ),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => FreeSignalScreen(),
                ));
          },
          child: CardWidget("Forex Signal")),
      GestureDetector(onTap: null, child: CardWidget("Binary Signal")),
      GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlansScreen(),
                ));
          },
          child: CardWidget("VIP Signal")),
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
      color: Color(0xff1F375D),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: StreamBuilder(
        stream: post.snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }
          if (snapshot.hasData) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                var post =
                    Posts.fromFirestore(snapshot.data.docs[index].data());

                return ListTile(
                  title: Text(post.title,style: TextStyle(color: Colors.white),),
                  subtitle: Text(post.description,style: TextStyle(color: Colors.white),),
                );
              },
              itemCount: snapshot.data.docs.length,
            );
          } else {
            return Center(child: Text("loading"));
          }
        },
      ),
          ),
        )
        ])
      ]),
    );
  }
}
