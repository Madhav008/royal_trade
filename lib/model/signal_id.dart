// To parse this JSON data, do
//
//     final signalId = signalIdFromJson(jsonString);

import 'dart:convert';

List<SignalId> signalIdFromJson(String str) =>
    List<SignalId>.from(json.decode(str).map((x) => SignalId.fromJson(x)));

String signalIdToJson(List<SignalId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignalId {
  SignalId(
      {this.id,
      this.type,
      this.threadId,
      this.pips,
      this.curr,
      this.price,
      this.slPrice,
      this.title,
      this.tpPrice});

  String id;
  String type;
  String threadId;
  String pips;
  String curr;
  String title;
  String price;
  String tpPrice;
  String slPrice;

  factory SignalId.fromJson(Map<String, dynamic> json) => SignalId(
        id: json["id"],
        threadId: json["threadId"],
      );

  factory SignalId.fromFirestore(Map<String, dynamic> firestore) => SignalId(
        id: firestore["id"],
        pips: firestore["pips"],
        type: firestore["type"],
        curr: firestore["curr"],
        title: firestore["title"],
        price: firestore["price"],
        tpPrice: firestore["tp_price"],
        slPrice: firestore["sl_price"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "threadId": threadId,
      };

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "pips": pips,
        "curr": curr,
        "title": title,
        "price": price,
        "tp_price": tpPrice,
        "sl_price": slPrice,
      };
}
