import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:rxdart/rxdart.dart';

class ForexVipId {
  final _subject = BehaviorSubject<List<SignalId>>();

  getId() async {
    List<SignalId> reaponse = await getForexvipData();    
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<SignalId>> get subject => _subject;
}

final forexvipId = ForexVipId();
