import 'package:http/http.dart' as http;
import 'package:royaltrade/model/signal.dart';


Future<List<Chart>> getData() async {
  var response = await http.get("http://f571d6d4724c.ngrok.io/17547b7746fe802b");
  return chartFromJson(response.body);
}