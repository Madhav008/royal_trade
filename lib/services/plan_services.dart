import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royaltrade/model/binary_status.dart';
import 'package:royaltrade/model/subscription.dart';
import 'package:royaltrade/model/status_transId.dart';

class PlansFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<Subscription> addPlans(Subscription plans)  {
    return  _db.collection('Subscription').doc().set(plans.toMap());
  }

  Future<Subscription> getPlans(String id) {
    return _db
        .collection('Subscription')
        .doc(id)
        .get()
        .then((value) => Subscription.fromFirestore(value.data()));
  }

  Future<Subscription> addBinaryPlans(Subscription plans) {
    return _db.collection('BinarySubscription').doc().set(plans.toMap());
  }

  Future<Subscription> getBinaryPlans(String id) {
    return _db
        .collection('BinarySubscription')
        .doc(id)
        .get()
        .then((value) => Subscription.fromFirestore(value.data()));
  }

  Future<void> addUserStatus(TransStatus status) {
     _db.collection("TransactionStaus").doc().set(status.toMap());
  }
Future<void> addBinaryUserStatus(BinaryStatus status) {
     _db.collection("BinaryStaus").doc().set(status.toMap());
  }
}
