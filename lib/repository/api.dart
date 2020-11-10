import 'package:http/http.dart' as http;
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';

Future<List<SignalId>> getForexvipData() async {
  var response = await http.get("https://royaltrade21.herokuapp.com/forexvip");
  return signalIdFromJson(response.body);
}

Future<List<Chart>> getSignalData(String id) async {
  var response = await http.get("https://royaltrade21.herokuapp.com/" + id);
  return chartFromJson(response.body);
}

Future<List<SignalId>> getBinaryData() async {
  var response = await http.get("https://royaltrade21.herokuapp.com/binary");
  return signalIdFromJson(response.body);
}

Future<List<SignalId>> getBinaryvipData() async {
  var response = await http.get("https://royaltrade21.herokuapp.com/binaryvip");
  return signalIdFromJson(response.body);
}


