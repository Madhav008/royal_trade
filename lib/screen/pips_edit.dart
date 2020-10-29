import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/services/signal_services.dart';

class PipsEditScreen extends StatelessWidget {
  final pipsController = TextEditingController();
  SignalFirestore _signal = SignalFirestore();
  AsyncSnapshot<List<Chart>> snapshot;
  String id;
  PipsEditScreen({this.snapshot, this.id});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Closed Signal Edit"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: pipsController,
                decoration: InputDecoration(
                    labelText: "Pips", labelStyle: TextStyle(fontSize: 20)),
              ),
            ),
            RaisedButton(
              onPressed: () {
                var signal0 = SignalId(
                    id: id,
                    type: 'closed',
                    title: snapshot.data[0].title,
                    curr: snapshot.data[0].curr,
                    price: snapshot.data[0].price,
                    slPrice: snapshot.data[0].slPrice,
                    tpPrice: snapshot.data[0].tpPrice,
                    pips: pipsController.text);

                _signal.addSignal(signal0);
              },
              child: Text(
                'Closed Order',
                style: TextStyle(color: Colors.black),
              ),
            )
          ],
        ));
  }
}
