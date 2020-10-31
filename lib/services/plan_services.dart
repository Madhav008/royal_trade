import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royaltrade/model/subscription.dart';


class PlansFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Subscription> addPlans(Subscription plans) {
    return _db.collection('Subscription').doc().set(plans.toMap());
  }

  Future<Subscription> getPlans(String id ) {
    return  _db.collection('Subscription').doc(id).get().then((value) => Subscription.fromFirestore(value.data()));
  }
}
