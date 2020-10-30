import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:royaltrade/screen/pips_edit.dart';
import 'package:royaltrade/services/signal_services.dart';

class SignalWidget extends StatefulWidget {
  SignalWidget({
    @required this.id,
  });

  final String id;

  @override
  _SignalWidgetState createState() => _SignalWidgetState();
}

class _SignalWidgetState extends State<SignalWidget> {
  SignalFirestore _signal = SignalFirestore();
  bool pips = false;

  @override
  void initState() {
    super.initState();
    getPips(widget.id);
  }

  getPips(String id) {
    _signal.getPips(id).then((value) {
      if (value.docs[0].data().values.contains('closed') == true) {
        setState(() {
          pips = true;
          return pips;
        });
      } else {
        setState(() {
          pips = false;
          return pips;
        });
      }
    });
    return pips;
  }

  @override
  Widget build(BuildContext context) {
    return (pips == false)
        ? Padding(
          padding: const EdgeInsets.all(8.0),
          child: FutureBuilder<List<Chart>>(
              future: getSignalData(widget.id),
              builder: (context, snapshot) {
                var _data = snapshot.data[0];
                return (snapshot.hasData)
                    ? Container(
                        height: 120,
                        width: MediaQuery.of(context).size.width,
                        child: Card(
                          elevation: 15.0,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              child: Stack(
                                children: [
                                  Positioned(
                                    right: 10,
                                      child: Container(
                                          child: Text(_data.curr))),
                                  Positioned(
                                    top: 50,
                                      child: Container(
                                          child: Text(_data.price))),
                                  Positioned(
                                    bottom: 1,
                                      left: 0,
                                      child: Container(
                                          child: Text(_data.slPrice))),
                                  Positioned(
                                    bottom: 1,
                                      right: 0,
                                      child: Container(
                                          child: Text(_data.tpPrice))),
                                  Positioned(
                                      child: Container(
                                          child: Text(_data.title))),
                                  IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  PipsEditScreen(
                                                snapshot: snapshot,
                                                id: widget.id,
                                              ),
                                            ));
                                      })
                                ],
                              ),
                            ),
                          ),
                          color: Colors.grey[200],
                        ),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              }),
        )
        : SizedBox(
            height: 0,
          );
  }
}
