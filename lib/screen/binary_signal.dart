import 'package:flutter/material.dart';
import 'package:royaltrade/bloc/binary_id.dart';
import 'package:royaltrade/widget/Binary_closed.dart';
import 'package:royaltrade/widget/binary_open.dart';
import 'package:royaltrade/widget/closed_signal.dart';
import 'package:royaltrade/widget/forexvip.dart';

class BinarySignal extends StatefulWidget {
  @override
  _BinarySignalState createState() => _BinarySignalState();
}

class _BinarySignalState extends State<BinarySignal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    binaryId..getId();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Color(0xff232946),
        appBar: AppBar(
          backgroundColor: Color(0xff001535),
          elevation: 8,
          title: Text(
            "Free Binary Signals",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicatorColor: Colors.grey[100],
            indicatorWeight: 5.0,
            isScrollable: false,
            tabs: [
              Container(
                child: Tab(
                  child: Text(
                    "Open Signals",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              Container(
                child: Tab(
                  child: Text(
                    "Closed Signal",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [BinaryOpenSignal(), BinaryClosedSignal()],
        ),
      ),
    );
  }
}
