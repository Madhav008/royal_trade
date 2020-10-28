// To parse this JSON data, do
//
//     final signalId = signalIdFromJson(jsonString);

import 'dart:convert';

List<SignalId> signalIdFromJson(String str) =>
    List<SignalId>.from(json.decode(str).map((x) => SignalId.fromJson(x)));

String signalIdToJson(List<SignalId> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignalId {
  SignalId({
    this.id,
    this.type,
    this.threadId,
    this.pips,
  });

  String id;
  String type;
  String threadId;
  String pips;

  factory SignalId.fromJson(Map<String, dynamic> json) => SignalId(
        id: json["id"],
        threadId: json["threadId"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "threadId": threadId,
      };

  Map<String, dynamic> toMap() => {
        "id": id,
        "type": type,
        "pips":pips,
      };
}
