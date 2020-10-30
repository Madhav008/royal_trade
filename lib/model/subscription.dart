import 'package:cloud_firestore/cloud_firestore.dart';

class Subscription {
  String transId;
  String planId;
  String userId;
  int price;
  Timestamp start;
  Timestamp end;

  Subscription({this.transId, this.planId, this.price,this.userId, this.start, this.end});

  Map<String, dynamic> toMap() {
    return {
      "transId": transId,
      "planId": planId,
      "price": price,
      "userId": userId,
      "start": start,
      "end": end
    };
  }

  Subscription.fromFirestore(Map<String, dynamic> firestore)
      : transId = firestore['transId'],
        planId = firestore['planId'],
        price = firestore['price'],
        userId = firestore['userId'],
        start = firestore['start'],
        end = firestore['end'];
}
