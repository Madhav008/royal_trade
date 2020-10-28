import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/signal_Id_bloc.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/widget/signal_widget.dart';

class OpenSignal extends StatefulWidget {
  @override
  _OpenSignalState createState() => _OpenSignalState();
}

class _OpenSignalState extends State<OpenSignal> {
  CollectionReference signal =
      FirebaseFirestore.instance.collection('FreeSignal');

  getPips(String id) {
    signal
        .where('id', isEqualTo: id)
        .where('pips', isNull: true)
        .get()
        .then((value) {
      return value.docs[0].id;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: signalIdBloc.subject.stream,
        builder: (context, snapshot) {
          var id = snapshot.data;

          return (snapshot.hasData)
              ? Column(children: [
                  (getPips(id[0].id) == null)
                      ? Container(
                          child: Text(getPips(id[0].id).toString()),
                        )
                      : SizedBox(
                          height: 0,
                        ),
                  (getPips(id[1].id) == null)
                      ? SignalWidget(id: id[1].id)
                      : SizedBox(
                          height: 0,
                        ),
                  (getPips(id[2].id) == null)
                      ? SignalWidget(id: id[2].id)
                      : SizedBox(
                          height: 0,
                        ),
                ])
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
