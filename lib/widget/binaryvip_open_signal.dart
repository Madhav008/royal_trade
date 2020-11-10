import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:royaltrade/screen/BinaryEditScreen.dart';
import 'package:royaltrade/screen/pips_edit.dart';
import 'package:royaltrade/screen/vipBinary_edit.dart';
import 'package:royaltrade/services/signal_services.dart';

class VipBinaryOpenSignalWidget extends StatefulWidget {
  VipBinaryOpenSignalWidget({
    @required this.id,
  });

  final String id;

  @override
  _VipBinaryOpenSignalWidgetState createState() => _VipBinaryOpenSignalWidgetState();
}

class _VipBinaryOpenSignalWidgetState extends State<VipBinaryOpenSignalWidget> {
  SignalFirestore _signal = SignalFirestore();
  bool pips = false;

  @override
  void initState() {
    super.initState();
    getPips(widget.id);
  }

  getPips(String id) {
    _signal.getVipBinaryOrder(id).then((value) {
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
                  return (snapshot.hasData)
                      ? Card(
                          elevation: 15.0,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomLeft,
                                end: Alignment.bottomCenter,
                                colors: [Color(0xfff5f7fa), Color(0xffc3cfe2)],
                              ),
                            ),
                            height: MediaQuery.of(context).size.height / 5.5,
                            width: MediaQuery.of(context).size.width,
                            child: Stack(
                              children: [
                                Positioned(
                                    left: 70,
                                    top: 5,
                                    child: Container(
                                        child: Text(snapshot.data[0].curr,
                                            style: TextStyle(
                                                fontSize: 23,
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold)))),
                                Positioned(
                                    top: 50,
                                    left: 10,
                                    child: Container(
                                        child: Text(
                                            snapshot.data[0].price,
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontSize: 25,
                                            )))),
                                Positioned(
                                    bottom: 10,
                                    left: 10,
                                    child: Container(
                                        child: Text(
                                      "Time - " + snapshot.data[0].slPrice,
                                      style: TextStyle(fontSize: 20),
                                    ))),
                                Positioned(
                                    bottom: 10,
                                    right: 10,
                                    child: Container(
                                        child: Text(
                                      "Trade Time - " + snapshot.data[0].tpPrice,
                                      style: TextStyle(fontSize: 20),
                                    ))),
                                Positioned(
                                    left: 10,
                                    top: 5,
                                    child: Container(
                                        child: Text(
                                      "title",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ))),
                                Positioned(
                                    right: 10,
                                    top: 5,
                                    child: Container(
                                        child: Text(
                                      "Active",
                                      style: TextStyle(
                                          fontSize: 23,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue),
                                    ))),
                                Positioned(
                                  right: 10,
                                  top: 50,
                                  child: IconButton(
                                      icon: Icon(Icons.edit),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  VipBinaryEditScreen(
                                                snapshot: snapshot,
                                                id: widget.id,
                                              ),
                                            ));
                                      }),
                                )
                              ],
                            ),
                          ),
                          color: Colors.grey[200],
                        )
                      : SizedBox(
                          height: 1,
                        );
                }),
          )
        : SizedBox(
            height: 0,
          );
  }
}
