import 'package:cloud_firestore/cloud_firestore.dart';

class Plans {
  String name;
  String planId;
  int price;
  Timestamp time;

  Plans({this.name, this.planId, this.price, this.time});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'planId': planId,
      'price': price,
      'time': time,
    };
  }

  Plans.fromFirestore(Map<String, dynamic> firestore)
      : name = firestore['name'],
        planId = firestore['planId'],
        price = firestore['price'],
        time = firestore['time'];
}
