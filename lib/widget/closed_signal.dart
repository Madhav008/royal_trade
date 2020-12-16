import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal_id.dart';

// ignore: must_be_immutable
class ClosedSignal extends StatelessWidget {
  CollectionReference signal =
      FirebaseFirestore.instance.collection('FreeSignal');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: signal.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemBuilder: (context, index) {
                var post =
                    SignalId.fromFirestore(snapshot.data.docs[index].data());

                return (post.type=="closed")?Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 15.0,
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.bottomLeft,
                          end: Alignment.bottomCenter,
                          colors: [Color(0xfff5f7fa), Color(0xffc3cfe2)],
                        ),
                      ),
                      height: MediaQuery.of(context).size.height / 5.5,
                      width: MediaQuery.of(context).size.width,

                      child: Stack(
                        children: [
                          Positioned(
                              left: 70,
                              top: 5,
                              child: Container(
                                  child:
                                  Text(post.curr,style:TextStyle(
                                      fontSize:23,color: Colors.white,fontWeight: FontWeight.bold
                                  )))),
                          Positioned(
                              top: 50,
                              left: 10,
                              child: Container(
                                  child:
                                  Text("Price - "+post.price,style: TextStyle(
                                    fontSize: 25,
                                  )))),
                          Positioned(
                              bottom: 5,
                              left: 10,
                              child: Container(
                                  child: Text(
                                    "Sl - "+post.slPrice,style: TextStyle(
                                      fontSize: 20
                                  ),))),
                          Positioned(
                              bottom: 10,
                              right: 10,
                              child: Container(
                                  child: Text(
                                    "Tp - "+post.tpPrice,style: TextStyle(
                                      fontSize: 20
                                  ),))),
                          Positioned(
                              left: 10,
                              top: 5,
                              child: Container(
                                  child:
                                  Text(post.title,style: TextStyle(
                                      fontSize: 23,fontWeight: FontWeight.bold
                                  ),))),
                          Positioned(
                              right: 10,
                              top: 5,
                              child: Container(
                                  child:
                                  Text("Closed",style: TextStyle(
                                      fontSize: 23,fontWeight: FontWeight.bold,color: Colors.red
                                  ),))),
                          // Positioned(
                          //   right: 10,
                          //   top: 50,
                            // child: IconButton(
                            //     icon: Icon(Icons.edit),
                            //     onPressed: () {
                            //       Navigator.push(
                            //           context,
                            //           MaterialPageRoute(
                            //             builder: (context) =>
                            //                 PipsEditScreen(
                            //                   snapshot: snapshot,
                            //                   id: widget.id,
                            //                 ),
                            //           ));
                            //     }),
                          // )
                        ],
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
