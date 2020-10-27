import 'package:royaltrade/model/signal.dart';
import 'package:rxdart/rxdart.dart';

class SignalBloc {
  final _subject = BehaviorSubject<List<Chart>>();

  getSignalData(String id) async {
    List<Chart> reaponse = await getSignalData(id);
    _subject.sink.add(reaponse);
  }

  dispose() {
    _subject.close();
  }

  BehaviorSubject<List<Chart>> get subject => _subject;
}

final signalBloc = SignalBloc();
