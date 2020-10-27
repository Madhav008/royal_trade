// To parse this JSON data, do
//
//     final signalId = signalIdFromJson(jsonString);

import 'dart:convert';

List<SignalId> signalIdFromJson(String str) => List<SignalId>.from(json.decode(str).map((x) => SignalId.fromJson(x)));

String signalIdToJson(List<SignalId> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SignalId {
    SignalId({
        this.id,
        this.threadId,
    });

    String id;
    String threadId;

    factory SignalId.fromJson(Map<String, dynamic> json) => SignalId(
        id: json["id"],
        threadId: json["threadId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "threadId": threadId,
    };
}
