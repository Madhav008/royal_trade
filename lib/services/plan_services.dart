import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:royaltrade/model/plans.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/model/user.dart';

class PlansFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Subscription> addPlans(Subscription plans) {
    return _db.collection('Subscription').doc(plans.planId).set(plans.toMap());
  }

  Future<Subscription> getPlans(String id ) {
    return  _db.collection('Subscription').doc(id).get().then((value) => Subscription.fromFirestore(value.data()));
  }
}
