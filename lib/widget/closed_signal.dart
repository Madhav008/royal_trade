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

                return (post.type=="closed")?Container(
                  height: 120,
                  width: MediaQuery.of(context).size.width,
                  child: Card(
                    elevation: 15.0,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        child: Stack(
                          children: [
                            Positioned(
                                right: 10,
                                child: Container(
                                    child: Text(post.curr))),
                            Positioned(
                                top: 50,
                                child: Container(
                                    child: Text(post.price))),
                            Positioned(
                                bottom: 1,
                                left: 0,
                                child: Container(
                                    child: Text(post.slPrice))),
                            Positioned(
                                bottom: 1,
                                right: 0,
                                child: Container(
                                    child: Text(post.tpPrice))),
                            Positioned(
                                child: Container(
                                    child: Text(post.title))),
                            IconButton(
                                icon: Icon(Icons.delete),
                                onPressed: () {null;  },)
                          ],
                        ),
                      ),
                    ),
                    color: Colors.grey[200],
                  ),
                
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
