import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/signal_Id_bloc.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/widget/signal_widget.dart';

class OpenSignal extends StatelessWidget {
  const OpenSignal({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: signalIdBloc.subject.stream,
        builder: (context, snapshot) {
          var id = snapshot.data;

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