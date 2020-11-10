import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:rxdart/rxdart.dart';

class BinaryId {
  final _subject = BehaviorSubject<List<SignalId>>();

  getId() async {
    List<SignalId> reaponse = await getBinaryvipData();
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<SignalId>> get subject => _subject;
}

final binaryId = BinaryId();
