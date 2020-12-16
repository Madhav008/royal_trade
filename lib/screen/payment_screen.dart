import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/services/plan_services.dart';

class PaymentScreen extends StatefulWidget {
  String planId;
  int price;
  String userId;
  Timestamp end;
  String transId;

  PaymentScreen({this.planId, this.price, this.userId, this.end, this.transId});

  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  PlansFirestore plans = PlansFirestore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Page",
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(widget.planId),
          Text(widget.price.toString()),
          TextField(
            onChanged: (value) {
              widget.transId = value;
            },
         
            decoration: InputDecoration(hintText: "Enter Trasaction Id"),
          ),
          RaisedButton(
            child: Text("Buy Now"),
            onPressed: () {
              var plan = Subscription(
                  planId: widget.planId,
                  price: widget.price,
                  userId: widget.userId,
                  start: Timestamp.now(),
                  end: widget.end,
                  transId: widget.transId);
              plans.addPlans(plan); 
            },
          )
        ],
      ),
    );
  }
}
