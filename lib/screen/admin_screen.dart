import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/model/user.dart';
import 'package:royaltrade/services/flutfirebase.dart';

class AdminScreen extends StatelessWidget {
  CollectionReference plans =
      FirebaseFirestore.instance.collection('Subscription');
  CollectionReference binaryplans =
      FirebaseFirestore.instance.collection('BinarySubscription');

  FireStoreServices firestoreService = new FireStoreServices();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff001535),
          elevation: 8,
          title: Text(
            "Premium User",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.grey[100],
            indicatorWeight: 5.0,
            isScrollable: false,
            tabs: [
              Container(
                child: Tab(
                  child: Text(
                    "Forex Premium ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  child: Text(
                    "Binary Premium ",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            StreamBuilder(
              stream: plans.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        var post = Subscription.fromFirestore(
                            snapshot.data.docs[index].data());

                        var _datestart = DateFormat('yyyy-MM-dd')
                            .format(post.start.toDate());
                        var _dateend =
                            DateFormat('yyyy-MM-dd').format(post.end.toDate());
                        return FutureBuilder(
                          future: firestoreService.fetchUser(post.userId),
                          builder: (context, snapshot) {
                            Users user = snapshot.data;

                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(post.planId),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(user.username),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(post.price.toString()),
                                  Text(_datestart),
                                  Text(_dateend),
                                ],
                              ),
                            );
                          },
                        );
                      });
                } else {
                  return Center(child: Text("loading"));
                }
              },
            ),
            StreamBuilder(
              stream: binaryplans.snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Something went wrong");
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data.docs.length,
                      itemBuilder: (context, index) {
                        var post = Subscription.fromFirestore(
                            snapshot.data.docs[index].data());

                        var _datestart = DateFormat('yyyy-MM-dd')
                            .format(post.start.toDate());
                        var _dateend =
                            DateFormat('yyyy-MM-dd').format(post.end.toDate());
                        return FutureBuilder(
                          future: firestoreService.fetchUser(post.userId),
                          builder: (context, snapshot) {
                            Users user = snapshot.data;

                            return ListTile(
                              title: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(post.planId),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(user.username),
                                ],
                              ),
                              subtitle: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(post.price.toString()),
                                  Text(_datestart),
                                  Text(_dateend),
                                ],
                              ),
                            );
                          },
                        );
                      });
                } else {
                  return Center(child: Text("loading"));
                }
              },
            )
          ],
        ),
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
