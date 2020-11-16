import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/binary_id.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/widget/binary_signal_widget.dart';

import 'binaryvip_open_signal.dart';

class VipBinarySignalWidget extends StatefulWidget {
  @override
  _VipBinarySignalWidgetState createState() => _VipBinarySignalWidgetState();
}

class _VipBinarySignalWidgetState extends State<VipBinarySignalWidget> {

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: binaryId.subject.stream,
        builder: (context, snapshot) {
          var id = snapshot.data;
          return (snapshot.hasData)
              ? ListView.builder(
                  itemBuilder: (context, index) =>
                      VipBinaryOpenSignalWidget(id: id[index].id),
                  itemCount: id.length,
                )
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
