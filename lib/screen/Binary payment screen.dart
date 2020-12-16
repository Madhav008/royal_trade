import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/model/status_transId.dart';

import 'package:royaltrade/services/plan_services.dart';

class BinaryPaymentScreen extends StatefulWidget {
  String planId;
  int price;
  String userId;
  Timestamp end;
  String transId;
  String payerName;
  String bitcoinAddress;
  BinaryPaymentScreen(
      {this.planId, this.price, this.userId, this.end, this.transId});

  @override
  _BinaryPaymentScreenState createState() => _BinaryPaymentScreenState();
}

class _BinaryPaymentScreenState extends State<BinaryPaymentScreen> {
  PlansFirestore plans = PlansFirestore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffb8c1ec),
      appBar: AppBar(
        title: Text(
          "Payment Page",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.planId.toUpperCase() + ' PLAN',
            style: TextStyle(fontSize: 25),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            widget.price.toString() + " USD",
            style: TextStyle(fontSize: 18),
          ),
          TextField(
            onChanged: (value) {
              widget.bitcoinAddress = value;
            },
            decoration: InputDecoration(
              hintText: "Enter BTC Address",
            ),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (value) {
              widget.transId = value;
            },
            decoration: InputDecoration(hintText: "Enter Trasaction Id"),
          ),
          SizedBox(
            height: 15,
          ),
          TextField(
            onChanged: (value) {
              widget.payerName = value;
            },
            decoration: InputDecoration(hintText: "Payer Name"),
          ),
          SizedBox(
            height: 15,
          ),
          RaisedButton(
            child: Text("Buy Now"),
            onPressed: () async {
              var status = await TransStatus(
                  userId: widget.userId,
                  payername: widget.payerName,
                  bitcoinAddress: widget.bitcoinAddress,
                  planName: widget.planId,
                  price: widget.price,
                  transId: widget.transId,
                  result: "pending");

              var plan = Subscription(
                  planId: widget.planId,
                  price: widget.price,
                  userId: widget.userId,
                  start: Timestamp.now(),
                  end: widget.end,
                  transId: widget.transId);

              plans.addUserStatus(status);

              plans.addBinaryPlans(plan);
            },
          )
        ],
      ),
    );
  }
}
