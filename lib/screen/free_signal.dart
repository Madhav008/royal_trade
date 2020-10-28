import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/signal_Id_bloc.dart';
import 'package:royaltrade/widget/closed_signal.dart';
import 'package:royaltrade/widget/open_signal.dart';

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
        bottom: TabBar(
          indicatorColor: Colors.grey[200],
          indicatorWeight: 5.0,
          isScrollable: false,
          tabs: [
            Container(
              child: Tab(
                child: Text(
                  "Signals",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              child: Tab(
                child: Text(
                  "Trades History",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        children: [OpenSignal(), ClosedSignal()],
      ),
    );
  }
}




