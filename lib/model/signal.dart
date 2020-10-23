import 'dart:convert';

List<Chart> chartFromJson(String str) => List<Chart>.from(json.decode(str).map((x) => Chart.fromJson(x)));

String chartToJson(List<Chart> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Chart {
    Chart({
        this.curr,
        this.title,
        this.price,
        this.tp,
        this.tpPrice,
        this.sl,
        this.slPrice,
    });

    String curr;
    String title;
    String price;
    String tp;
    String tpPrice;
    String sl;
    String slPrice;

    factory Chart.fromJson(Map<String, dynamic> json) => Chart(
        curr: json["curr"],
        title: json["title"],
        price: json["price"],
        tp: json["tp"],
        tpPrice: json["tp_price"],
        sl: json["sl"],
        slPrice: json["sl_price"],
    );

    Map<String, dynamic> toJson() => {
        "curr": curr,
        "title": title,
        "price": price,
        "tp": tp,
        "tp_price": tpPrice,
        "sl": sl,
        "sl_price": slPrice,
    };
}
