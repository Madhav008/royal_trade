import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/signal_Id_bloc.dart';
import 'package:royaltrade/model/signal.dart';
import 'package:royaltrade/model/signal_id.dart';
import 'package:royaltrade/repository/api.dart';

class FreeSignalScreen extends StatefulWidget {
  @override
  _FreeSignalScreenState createState() => _FreeSignalScreenState();
}

class _FreeSignalScreenState extends State<FreeSignalScreen> {
  @override
  void initState() {
    signalIdBloc..getId();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Free Signal"),
        centerTitle: true,
      ),
      body: StreamBuilder<List<SignalId>>(
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
          }),
    );
  }
}

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
