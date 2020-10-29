import 'package:http/http.dart' as http;
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';

Future<List<SignalId>> getData() async {
  var response = await http.get("https://royaltrade21.herokuapp.com");
  return signalIdFromJson(response.body);
}

Future<List<Chart>> getSignalData(String id) async {
  var response = await http.get("https://royaltrade21.herokuapp.com/" + id);
  return chartFromJson(response.body);
}
