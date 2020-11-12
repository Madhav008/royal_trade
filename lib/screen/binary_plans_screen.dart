import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/screen/plans_screen.dart';
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
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            centerTitle: true,
            title: Text(
              "Binary Plans",
              style: TextStyle(color: Colors.purple[300],fontSize: 25,fontWeight: FontWeight.bold),
            ),
            backgroundColor: Colors.white,
            elevation: 0,
            bottom: TabBar(
              indicatorColor: Colors.grey[400],
              indicatorWeight: 5.0,
              isScrollable: false,
              tabs: [
                Container(
                  child: Tab(
                
                    child: Text(
                      "Starter",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Tab(
                    child: Text(
                      "Pro",
                      style: TextStyle(fontSize: 20, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Tab(
                    child: Text(
                      "Premium",
                      style: TextStyle(fontSize: 16, color: Colors.black),
                    ),
                  ),
                ),
                Container(
                  child: Tab(
                    child: Text(
                      "Diamond",
                      style: TextStyle(fontSize: 16, color: Colors.black),
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
                    var date = DateTime.now().add(Duration(days: 30));
                    var plan = Subscription(
                        planId: "Starter",
                        price: 100,
                        userId: uid,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        transId: 'basic');
                    plans.addBinaryPlans(plan);
                  },
                  child: PlansWidget(
                    plan: "Starter",
                    price: 100,
                    time: "1 MONTH",
                    color1: Color(0xffd4fc79),
                    color2: Color(0xff96e6a1),
                  )),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 92));
                    var plan = Subscription(
                        userId: uid,
                        transId: "Pro",
                        price: 200,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'medium');
                    plans.addBinaryPlans(plan);
                  },
                  child: PlansWidget(
                    plan: "Pro",
                    price: 200,
                    time: "3 MONTHS",
                    color1: Color(0xffe0c3fc),
                    color2: Color(0xff8ec5fc),
                  )),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 183));
                    var plan = Subscription(
                        userId: uid,
                        transId: "premium",
                        price: 350,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'premium');
                    plans.addBinaryPlans(plan);
                  },
                  child: PlansWidget(
                    plan: "Premium",
                    price: 350,
                    time: "6 MONTHS",
                    color1: Color(0xff43e97b),
                    color2: Color(0xff38f9d7),
                  )),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 365));
                    var plan = Subscription(
                        userId: uid,
                        transId: "Diamond",
                        price: 500,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'diamond');
                    plans.addBinaryPlans(plan);
                  },
                  child: PlansWidget(
                    plan: "Diamond",
                    price: 500,
                    time: "1 YEAR",
                    color1: Color(0xfffdcbf1),
                    color2: Color(0xffe6dee9),
                  )),
            ],
          )),
    );
  }
}
