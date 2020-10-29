import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal_id.dart';

class ClosedSignal extends StatelessWidget {
  CollectionReference signal =
      FirebaseFirestore.instance.collection('FreeSignal');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: signal.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            print(snapshot.data.docs[0].data()[5]);
            return ListView.builder(
              itemBuilder: (context, index) {
                var post =
                    SignalId.fromFirestore(snapshot.data.docs[index].data());

                return (post.type=="closed")?ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.curr),
                ):SizedBox(height: 0,);
              },
              itemCount: snapshot.data.docs.length,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
