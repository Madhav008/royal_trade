import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/screen/payment_screen.dart';
import 'package:royaltrade/services/plan_services.dart';

// ignore: must_be_immutable
class PlansScreen extends StatelessWidget {
  PlansFirestore plans = PlansFirestore();
  String uid;
  PlansScreen(this.uid);

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
              "Forex Plans",
              style: TextStyle(
                  color: Colors.purple[300],
                  fontSize: 25,
                  fontWeight: FontWeight.bold),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PaymentScreen(
                              planId: "Starter",
                              price: 150,
                              userId: uid,
                              end: Timestamp.fromDate(date),
                           ),
                        ));
                  },
                  child: PlansWidget(
                    plan: "Starter",
                    price: 150,
                    time: "1 MONTH",
                    color1: Color(0xffd4fc79),
                    color2: Color(0xff96e6a1),
                  )),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 92));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                            userId: uid,
                            price: 300,
                            end: Timestamp.fromDate(date),
                            planId: 'Pro'),
                      ),
                    );
                  },
                  child: PlansWidget(
                    plan: "Pro",
                    price: 300,
                    time: "3 MONTHS",
                    color1: Color(0xffe0c3fc),
                    color2: Color(0xff8ec5fc),
                  )),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 183));
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentScreen(
                            userId: uid,
                            price: 500,
                            end: Timestamp.fromDate(date),
                            planId: 'premium'),
                      ),
                    );
                  },
                  child: PlansWidget(
                    plan: "Premium",
                    price: 500,
                    time: "6 MONTHS",
                    color1: Color(0xff43e97b),
                    color2: Color(0xff38f9d7),
                  )),
              GestureDetector(
                  onTap: () {
                    var date = DateTime.now().add(Duration(days: 365));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentScreen(
                                userId: uid,
                                price: 700,
                                end: Timestamp.fromDate(date),
                                planId: 'diamond')));
                  },
                  child: PlansWidget(
                    plan: "Diamond",
                    price: 700,
                    time: "1 YEAR",
                    color1: Color(0xfffdcbf1),
                    color2: Color(0xffe6dee9),
                  )),
            ],
          )),
    );
  }
}

// ignore: must_be_immutable
class PlansWidget extends StatelessWidget {
  String plan;
  int price;
  String time;
  Color color1;
  Color color2;
  PlansWidget({this.plan, this.price, this.time, this.color1, this.color2});
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
                  plan,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "\$" + price.toString(),
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      time,
                      style: TextStyle(fontSize: 30, color: Colors.pink[300]),
                    )
                  ],
                ),
              ),
              FlatButton(
                onPressed: null,
                child: Text(
                  "Buy Now",
                  style: TextStyle(color: Colors.purple[300], fontSize: 40),
                ),
              )
            ],
          ),
          decoration:
              BoxDecoration(gradient: LinearGradient(colors: [color1, color2])),
        ),
      ),
    );
  }
}
