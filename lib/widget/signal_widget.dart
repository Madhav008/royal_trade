import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';
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
      print(value.docs[0].data().values);
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
        ? Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder<List<Chart>>(
                  future: getSignalData(widget.id),
                  builder: (context, snapshot) {
                    return (snapshot.hasData)
                        ? Card(
                            child: Container(
                              child: Column(
                                children: [
                                  Text(snapshot.data[0].curr),
                                  Text(widget.id),
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
                            color: Colors.grey[200],
                          )
                        : Center(
                            child: CircularProgressIndicator(),
                          );
                  }),
            ),
          )
        : SizedBox(
            height: 0,
          );
  }
}
