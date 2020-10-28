import 'package:flutter/material.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/repository/api.dart';

class SignalWidget extends StatelessWidget {
  const SignalWidget({
    Key key,
    @required this.id,
  }) : super(key: key);

  final String id;

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
