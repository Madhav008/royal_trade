import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/repository/api.dart';
import 'package:royaltrade/services/signal_services.dart';

class SignalWidget extends StatelessWidget {
  SignalWidget({
    @required this.id,
  });

  final String id;

  SignalFirestore _signalRefrence = SignalFirestore();
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FutureBuilder<List<Chart>>(
            future: getSignalData(id),
            builder: (context, snapshot) {
              return (snapshot.hasData)
                  ? Card(
                      child: Container(
                        child: Column(
                          children: [
                            Text(snapshot.data[0].curr),
                            Text(id),
                            IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  var signal0 = SignalId(
                                      id: id,
                                      type: 'closed');
                                  _signalRefrence.addUser(signal0);
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
    );
  }
}
