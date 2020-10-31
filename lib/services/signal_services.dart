import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royaltrade/model/signal_id.dart';

class SignalFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addSignal(SignalId signal) {
    return _db.collection('FreeSignal').doc(signal.id).set(signal.toMap());
  }

  Future<void> updateSignal(SignalId signal) {
    return _db.collection('FreeSignal').doc(signal.id).update(signal.toMap());
  }

  Future<QuerySnapshot> getPips(String id) {
    return _db
        .collection('FreeSignal')
        .where('id', isEqualTo: id)
        .get();
  }

  
}
