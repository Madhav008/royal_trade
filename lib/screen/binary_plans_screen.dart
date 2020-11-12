import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/services/plan_services.dart';

// ignore: must_be_immutable
class BinaryPlansScreen extends StatelessWidget {
  PlansFirestore plans = PlansFirestore();
  String uid;
  BinaryPlansScreen(this.uid);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "Plans",
              style: TextStyle(color: Colors.black),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Colors.grey[200],
              indicatorWeight: 5.0,
              isScrollable: false,
              tabs: [
                Container(
                  child: Tab(
                    child: Text(
                      "Starter",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Tab(
                    child: Text(
                      "Pro",
                      style: TextStyle(fontSize: 18, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Tab(
                    child: Text(
                      "Premium",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Tab(
                    child: Text(
                      "Diamond",
                      style: TextStyle(fontSize: 15, color: Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              GestureDetector(
                onTap: () {
                  var date = DateTime.now().add(Duration(days: 7));
                  var plan = Subscription(
                      planId: "basic",
                      price: 200,
                      userId: uid,
                      start: Timestamp.now(),
                      end: Timestamp.fromDate(date),
                      transId: 'basic');
                  plans.addPlans(plan);
                },
                child: PlansWidget(),
              ),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 30));
                    var plan = Subscription(
                        userId: uid,
                        transId: "medium",
                        price: 300,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'medium');
                    plans.addPlans(plan);
                  },
                  child: PlansWidget()),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 365));
                    var plan = Subscription(
                        userId: uid,
                        transId: "premium",
                        price: 400,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'premium');
                    plans.addPlans(plan);
                  },
                  child: PlansWidget()),
                  GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 365));
                    var plan = Subscription(
                        userId: uid,
                        transId: "diamond",
                        price: 800,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'diamond');
                    plans.addPlans(plan);
                  },
                  child: PlansWidget()),
            ],
          )),
    );
  }
}

class PlansWidget extends StatelessWidget {
  const PlansWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        child: Container(
          height: MediaQuery.of(context).size.height / 3,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Small Plan",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$200",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Weekly ",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: null,
                child: Text(
                  "SELECT",
                  style: TextStyle(color: Colors.white, fontSize: 40),
                ),
              )
            ],
          ),
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color(0xff30E8BF), Color(0xffFF8235)])),
        ),
      ),
    );
  }
}
