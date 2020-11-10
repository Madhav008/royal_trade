import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/forexvip_id.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/widget/forexvip_signal_widget.dart';

class ForexVip extends StatefulWidget {
  @override
  _ForexVipState createState() => _ForexVipState();
}

class _ForexVipState extends State<ForexVip> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<SignalId>>(
        stream: forexvipId.subject.stream,
        builder: (context, snapshot) {
          var id = snapshot.data;
          // getPips(id[0].id);
          return (snapshot.hasData)
              ? ListView.builder(
                  itemBuilder: (context, index) => VipForexSignalWidget(
                    id: id[index].id,
                  ),
                  itemCount: snapshot.data.length,
                )
           
              : Center(
                  child: CircularProgressIndicator(),
                );
        });
  }
}
