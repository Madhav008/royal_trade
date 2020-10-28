import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:royaltrade/model/signal_id.dart';

class SignalFirestore {
  FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> addUser(SignalId signal) {
    return _db.collection('FreeSignal').doc(signal.id).set(signal.toMap());
  }

  Future<void> updateSignal(SignalId signal) {
    return _db.collection('FreeSignal').doc(signal.id).update(signal.toMap());
  }

}
