// To parse this JSON data, do
//
//     final binary = binaryFromJson(jsonString);

import 'dart:convert';

List<Binary> binaryFromJson(String str) =>
    List<Binary>.from(json.decode(str).map((x) => Binary.fromJson(x)));

String binaryToJson(List<Binary> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Binary {
  Binary({
    this.id,
    this.curr,
    this.title,
    this.price,
    this.time,
  });

  String curr;
  String id;
  String title;
  String price;
  String time;

  factory Binary.fromJson(Map<String, dynamic> json) => Binary(
        curr: json["curr"],
        title: json["title"],
        price: json["price"],
        time: json["time"],
      );
  factory Binary.fromFirestore(Map<String, dynamic> firestore) => Binary(
        id: firestore["id"],
        curr: firestore["curr"],
        title: firestore["title"],
        price: firestore["price"],
      );

  Map<String, dynamic> toJson() => {
        "curr": curr,
        "title": title,
        "price": price,
        "time": time,
      };

  Map<String, dynamic> toMap() => {
        "id": id,
        "curr": curr,
        "title": title,
        "price": price,
      };
}
