import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/services/plan_services.dart';

class PlansScreen extends StatelessWidget {
  PlansFirestore plans = PlansFirestore();
  String userId = '58kh0ywWMWWUE0dFLnjdq8P9Ky13';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 0.0, bottom: 20),
                child: Text(
                  'Pricing',
                  style: TextStyle(fontSize: 50),
                ),
              ),
              GestureDetector(
                onTap: () {
                  var date = DateTime.now().add(Duration(days: 7));
                  var plan = Subscription(
                      planId: "basic",
                      price: 200,
                      userId: userId,
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
                        transId: "premium",
                        price: 400,
                        start: Timestamp.now(),
                        end: Timestamp.fromDate(date),
                        planId: 'premium');
                    plans.addPlans(plan);
                  },
                  child: PlansWidget()),
            ],
          ),
        ));
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
