import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:royaltrade/widget/signal_widget.dart';

class OpenSignal extends StatefulWidget {
  @override
  _OpenSignalState createState() => _OpenSignalState();
}

class _OpenSignalState extends State<OpenSignal> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<SignalId>>(
        future: getForexvipData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<SignalId> reversed = snapshot.data.reversed.toList();
            return ListView.builder(
              itemBuilder: (context, index) => SignalWidget(
                id: reversed[index].id,
              ),
              itemCount: 3,
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
