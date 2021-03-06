import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royaltrade/model/signal_id.dart';

class SignalFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addSignal(SignalId signal) {
    return _db.collection('FreeSignal').doc(signal.id).set(signal.toMap());
  }

   Future<void> addForexVipSignal(SignalId signal) {
    return _db.collection('ForexVipSignal').doc(signal.id).set(signal.toMap());
  }

  Future<void> updateSignal(SignalId signal) {
    return _db.collection('FreeSignal').doc(signal.id).update(signal.toMap());
  }

   Future<void> updateForexVipSignal(SignalId signal) {
    return _db.collection('ForexVipSignal').doc(signal.id).update(signal.toMap());
  }

  Future<void> addBinarySignal(SignalId signal) {
    return _db.collection('BinaryFreeSignal').doc(signal.id).set(signal.toMap());
  }
  
  Future<void> updateBinarySignal(SignalId signal) {
    return _db.collection('BinaryFreeSignal').doc(signal.id).update(signal.toMap());
  }

  Future<void> addVipBinarySignal(SignalId signal) {
    return _db.collection('VipBinaryFreeSignal').doc(signal.id).set(signal.toMap());
  }
  
  Future<void> updateVipBinarySignal(SignalId signal) {
    return _db.collection('VipBinaryFreeSignal').doc(signal.id).update(signal.toMap());
  }
  Future<QuerySnapshot> getPips(String id) {
    return _db
        .collection('FreeSignal')
        .where('id', isEqualTo: id)
        .get();
  }
  Future<QuerySnapshot> getVipPips(String id) {
    return _db
        .collection('ForexVipSignal')
        .where('id', isEqualTo: id)
        .get();
  }

   Future<QuerySnapshot> getBinaryOrder(String id) {
    return _db
        .collection('BinaryFreeSignal')
        .where('id', isEqualTo: id)
        .get();
  }
   Future<QuerySnapshot> getVipBinaryOrder(String id) {
    return _db
        .collection('VipBinaryFreeSignal')
        .where('id', isEqualTo: id)
        .get();
  }
  
}
