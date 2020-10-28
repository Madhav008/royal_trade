import 'package:http/http.dart' as http;
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';

Future<List<SignalId>> getData() async {
  var response = await http.get("http://cf24e0fa5707.ngrok.io");
  return signalIdFromJson(response.body);
}

Future<List<Chart>> getSignalData(String id) async {
  var response = await http.get("http://cf24e0fa5707.ngrok.io/" + id);
  return chartFromJson(response.body);
}
