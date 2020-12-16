import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/forexvip_id.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/widget/signal_widget.dart';

class OpenSignal extends StatefulWidget {
  @override
  _OpenSignalState createState() => _OpenSignalState();
}

class _OpenSignalState extends State<OpenSignal> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: forexvipId.subject.stream,
        builder: (context, snapshot) {
          List<SignalId> reversed =
              snapshot.data.reversed.toList(); // getPips(id[0].id);
          if(snapshot.hasData){
              return ListView.builder(
                  itemBuilder: (context, index) => SignalWidget(
                    id: reversed[index].id,
                  ),
                  itemCount: 3,
                );}
              /*  ListView(children: [
                  SignalWidget(id: id[0].id),
                  SignalWidget(id: id[1].id),
                  SignalWidget(id: id[2].id)
                ]) */
             return Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
