import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/signal_Id_bloc.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/services/signal_services.dart';
import 'package:royaltrade/widget/signal_widget.dart';

class OpenSignal extends StatelessWidget {
  CollectionReference signal =
      FirebaseFirestore.instance.collection('FreeSignal');


  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: signalIdBloc.subject.stream,
        builder: (context, snapshot) {
          var id = snapshot.data;
        /*   _signalRefrence.addUser(signal0);
          _signalRefrence.addUser(signal1);
          _signalRefrence.addUser(signal2); */

          return (snapshot.hasData)
              ? Column(children: [
                  SignalWidget(id: id[0].id),
                  SignalWidget(id: id[1].id),
                  SignalWidget(id: id[2].id),
                ])
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
