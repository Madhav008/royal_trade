import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:rxdart/rxdart.dart';

class SignalIdBloc {
  final _subject = BehaviorSubject<List<SignalId>>();

  getId() async {
    List<SignalId> reaponse = await getData();
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<SignalId>> get subject => _subject;
}

final signalIdBloc = SignalIdBloc();
